-- Deobfuscated cl_functions.lua
-- Contains all the main functions for the vehicle keys system

local canHotwire = false
local togglingLocks = false
local frameworkLoaded = false

-- Check if player has authorization to use the vehicle
function HasAuth(vehicle)
    if not vehicle or vehicle == 0 or not tonumber(vehicle) then
        return false
    end

    -- Check if vehicle is a bicycle (always has auth)
    if IsThisModelABicycle(GetEntityModel(vehicle)) or IsWhitelisted(GetEntityModel(vehicle)) then
        return true
    end

    local hasKey = false

    if Config.KeysAsItem.PlayerOwned.Enabled then
        local fobId = Entity(vehicle).state.MKFOB

        if fobId == nil then
            -- Check regular keys
            local keys = Entity(vehicle).state.Keys
            if keys then
                for _, identifier in pairs(keys) do
                    if identifier == LocalPlayer.state.mk_identifier then
                        hasKey = true
                        break
                    end
                end
            else
                return false
            end
        else
            -- Check if player has the keyfob item
            if inventory:hasItem(Config.KeysAsItem.PlayerOwned.ItemName, {id = fobId}, true) then
                return true
            else
                -- Check regular keys as fallback
                local keys = Entity(vehicle).state.Keys
                if keys then
                    for _, identifier in pairs(keys) do
                        if identifier == LocalPlayer.state.mk_identifier then
                            hasKey = true
                            break
                        end
                    end
                else
                    return false
                end
            end
        end
    else
        -- Regular key system (no physical items)
        local keys = Entity(vehicle).state.Keys
        if keys then
            for _, identifier in pairs(keys) do
                if identifier == LocalPlayer.state.mk_identifier then
                    hasKey = true
                    break
                end
            end
        else
            return false
        end
    end

    return hasKey
end

exports('HasKey', HasAuth)

-- Add key to vehicle
function AddKey(vehicle)
    if not vehicle or vehicle == 0 or not tonumber(vehicle) then
        utils:notify(locale('cant_find_veh'), 'primary', 5000)
        return
    end

    if not IsEntityAMissionEntity(vehicle) then
        SetEntityAsMissionEntity(vehicle, true, true)
    end

    -- Wait for entity to exist
    local timeout = 0
    while not DoesEntityExist(vehicle) and timeout < 30 do
        Wait(100)
        timeout = timeout + 1
    end

    -- Don't add keys to whitelisted vehicles
    if IsThisModelABicycle(GetEntityModel(vehicle)) or IsWhitelisted(GetEntityModel(vehicle)) then
        return
    end

    if Config.KeysAsItem.PlayerOwned.Enabled then
        -- Wait for network ownership
        local ownerTimeout = 0
        while NetworkGetEntityOwner(vehicle) ~= PlayerId() and ownerTimeout < 50 do
            Wait(100)
            ownerTimeout = ownerTimeout + 1
        end

        if CheckFob(vehicle, utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle))) then
            -- Player already has a fob
        else
            TriggerServerEvent('MK_VehicleKeys:Server:AddKey',
                NetworkGetNetworkIdFromEntity(vehicle), false, false
            )

            -- Start engine if player is in driver seat
            if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() and
               not GetIsVehicleEngineRunning(vehicle) then
                if Config.DisableAutoStartEngine then
                    SetVehicleEngineOn(vehicle, false, true, true)
                else
                    SetVehicleEngineOn(vehicle, true, false,
                        Config.DisableAutoStartEngine or false
                    )
                end
            end
        end
    else
        TriggerServerEvent('MK_VehicleKeys:Server:AddKey',
            NetworkGetNetworkIdFromEntity(vehicle), false, false
        )

        -- Start engine if player is in driver seat
        if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() and
           not GetIsVehicleEngineRunning(vehicle) then
            if Config.DisableAutoStartEngine then
                SetVehicleEngineOn(vehicle, false, true, true)
            else
                SetVehicleEngineOn(vehicle, true, false,
                    Config.DisableAutoStartEngine or false
                )
            end
        end
    end
end

exports('AddKey', AddKey)
exports('GiveKey', AddKey)

-- Change vehicle owner (remove all keys and add new owner)
function ChangeOwner(vehicle)
    if not vehicle or vehicle == 0 or not tonumber(vehicle) then
        utils:notify(locale('cant_find_veh'), 'primary', 5000)
        return
    end

    SetEntityAsMissionEntity(vehicle, true, true)

    -- Wait for entity to exist
    local timeout = 0
    while not DoesEntityExist(vehicle) and timeout < 30 do
        Wait(100)
        timeout = timeout + 1
    end

    if Config.KeysAsItem.PlayerOwned.Enabled then
        -- Wait for network ownership
        local ownerTimeout = 0
        while NetworkGetEntityOwner(vehicle) ~= PlayerId() and ownerTimeout < 50 do
            Wait(100)
            ownerTimeout = ownerTimeout + 1
        end

        Wait(2000)

        if CheckFob(vehicle, utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle)), true) then
            -- Player already has fob
        else
            -- Clear all keys
            Entity(vehicle).state:set('Keys', nil, true)

            TriggerServerEvent('MK_VehicleKeys:Server:AddKey',
                NetworkGetNetworkIdFromEntity(vehicle), false, false
            )

            -- Start engine if player is in driver seat
            if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() and
               not GetIsVehicleEngineRunning(vehicle) then
                if Config.DisableAutoStartEngine then
                    SetVehicleEngineOn(vehicle, false, true, true)
                else
                    SetVehicleEngineOn(vehicle, true, false,
                        Config.DisableAutoStartEngine or false
                    )
                end
            end
        end
    else
        -- Clear all keys
        Entity(vehicle).state:set('Keys', nil, true)

        TriggerServerEvent('MK_VehicleKeys:Server:AddKey',
            NetworkGetNetworkIdFromEntity(vehicle), false, false
        )

        -- Start engine if player is in driver seat
        if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() and
           not GetIsVehicleEngineRunning(vehicle) then
            if Config.DisableAutoStartEngine then
                SetVehicleEngineOn(vehicle, false, true, true)
            else
                SetVehicleEngineOn(vehicle, true, false,
                    Config.DisableAutoStartEngine or false
                )
            end
        end
    end
end

exports('ChangeOwner', ChangeOwner)

-- Toggle vehicle locks
function ToggleLocks(vehicle)
    if not LocalPlayer.state.mk_isLoggedIn then return end

    local targetVehicle = vehicle
    local isRestricted = false

    if Config.CheckRestrictions then
        local restrictPromise = promise.new()
        restrictPromise:resolve(framework:isRestricted())
        Citizen.Await(restrictPromise)

        if restrictPromise then
            isRestricted = restrictPromise.value
        end
    end

    if not isRestricted then
        local playerCoords = GetEntityCoords(PlayerPedId(), true)
        local vehicleCoords = GetEntityCoords(targetVehicle)

        if targetVehicle > 0 and #(playerCoords - vehicleCoords) < 7.5 then
            if HasAuth(targetVehicle) and not Entity(targetVehicle).state.LockBusy then
                TriggerServerEvent('MK_VehicleKeys:Server:ToggleLocks',
                    NetworkGetNetworkIdFromEntity(targetVehicle), targetVehicle
                )
            end
        end
    end
end

exports('ToggleLocks', ToggleLocks)

-- Unlock vehicle (force unlock)
function UnlockVehicle(vehicle)
    if not LocalPlayer.state.mk_isLoggedIn then return end

    local targetVehicle = nil

    if not vehicle or vehicle == 0 then
        targetVehicle, _ = utils:getClosestVehicle()
        if not targetVehicle then
            utils:notify(locale('cant_find_veh'), 'primary', 5000)
            return
        end
    else
        targetVehicle = vehicle
    end

    local isRestricted = false

    if Config.CheckRestrictions then
        local restrictPromise = promise.new()
        restrictPromise:resolve(framework:isRestricted())
        Citizen.Await(restrictPromise)

        if restrictPromise then
            isRestricted = restrictPromise.value
        end
    end

    if not isRestricted then
        local playerCoords = GetEntityCoords(PlayerPedId(), true)
        local vehicleCoords = GetEntityCoords(targetVehicle)

        if targetVehicle > 0 and #(playerCoords - vehicleCoords) < 7.5 then
            SetEntityAsMissionEntity(targetVehicle, true, true)

            if not Entity(targetVehicle).state.LockBusy then
                TriggerServerEvent('MK_VehicleKeys:Server:UnlockVehicle',
                    NetworkGetNetworkIdFromEntity(targetVehicle), targetVehicle
                )
            end
        end
    end
end

exports('UnlockVehicle', UnlockVehicle)

-- Hotwire vehicle function
function HotwireVehicle(vehicle)
    if not vehicle or not Config.EnableHotwiring then return end

    local playerPed = PlayerPedId()
    local vehicleModel = GetEntityModel(vehicle)
    local vehicleClass = GetVehicleClass(vehicle)

    if lib.isTextUIOpen() then
        lib.hideTextUI()
    end

    local isHelicopter = false
    local isPlane = false

    DisableLockpick = true

    -- Check if vehicle is eligible for hotwiring
    local popType = GetEntityPopulationType(vehicle)
    local isScriptOwned = false

    if popType == 7 then
        local scriptOwned = Entity(vehicle).state.mk_scriptOwned
        local spawnTimer = Entity(vehicle).state.mk_scriptOwnedSpawnTimer

        if scriptOwned ~= nil and scriptOwned and spawnTimer then
            isScriptOwned = true
        end
    end

    if not isScriptOwned then
        DisableLockpick = false
    end

    if not IsEntityAMissionEntity(vehicle) then
        SetEntityAsMissionEntity(vehicle, true, true)
    end

    -- Check restrictions
    local isRestricted = false
    if Config.CheckRestrictions then
        local restrictPromise = promise.new()
        restrictPromise:resolve(framework:isRestricted())
        Citizen.Await(restrictPromise)

        if restrictPromise then
            isRestricted = restrictPromise.value
        end
    end

    if isRestricted then
        IsHotwiring = false
        return
    end

    -- Check authorization
    if not Config.HotwireCustomAuth(vehicle, utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle))) then
        IsHotwiring = false
        return
    end

    -- Check if vehicle is whitelisted
    if IsThisModelABicycle(vehicleModel) or IsWhitelisted(vehicleModel) then
        IsHotwiring = false
        return
    end

    -- Check if player already has keys
    if HasAuth(vehicle) then
        IsHotwiring = false
        return
    end

    -- Check if it's a helicopter or plane
    if vehicleClass == 15 then
        isHelicopter = true
        if not Config.Licenses.Helicopter.CanHotwire then
            IsHotwiring = false
            return
        end
    elseif vehicleClass == 16 then
        isPlane = true
        if not Config.Licenses.Plane.CanHotwire then
            IsHotwiring = false
            return
        end
    end

    -- Check if player owned vehicle can be hotwired
    if Config.KeysAsItem.PlayerOwned.Enabled and not Config.KeysAsItem.PlayerOwned.CanHotwire then
        local ownerCheck = promise.new()

        lib.callback('MK_VehicleKeys:Server:CheckOwnership', false, function(isOwned)
            ownerCheck:resolve(isOwned)
        end, utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle)))

        Citizen.Await(ownerCheck)

        if ownerCheck and ownerCheck.value then
            utils:notify(locale('no_keys'), 'error', 5000)
            IsHotwiring = false
            return
        end
    end

    -- Perform hotwire
    local hotwireTime = math.random(Config.HotwireTime.Min, Config.HotwireTime.Max) * 1000
    local success = false

    if Config.HotwireGame.UseGame then
        Config.HotwireGame.StartGame(function(result)
            success = result
        end)
    else
        local progressType = Config.ProgressCircle and "progressCircle" or "progressBar"
        local position = Config.ProgressCircle and (Config.ProgressCirclePosition or "middle") or nil

        success = lib[progressType]({
            duration = hotwireTime,
            label = locale('attempt_hotwire'),
            position = position,
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true
            },
            anim = {
                dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
                clip = 'machinic_loop_mechandplayer'
            }
        })
    end

    if success then
        -- Check if game was configured to fail
        if not Config.HotwireGame.UseGame then
            local failChance = math.random(1, 100)
            if failChance <= Config.HotwireFailChance then
                success = false
            end
        end

        if success then
            utils:notify(locale('hotwire_success'), 'success', 5000)

            TriggerServerEvent('MK_VehicleKeys:Server:AddKey',
                NetworkGetNetworkIdFromEntity(vehicle), false, false
            )

            SetVehicleEngineOn(vehicle, true, false, Config.DisableAutoStartEngine or false)

            Config.HotwireEvent(vehicle,
                utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle)),
                GetEntityCoords(vehicle, false)
            )
        else
            utils:notify(locale('hotwire_fail'), 'error', 5000)
        end
    end

    IsHotwiring = false
    canHotwire = false

    SetTimeout(3000, function()
        canHotwire = true
    end)
end

-- Lockpick vehicle door function
function LockpickDoor(vehicle, isAdvanced)
    if not vehicle then return end

    local playerPed = PlayerPedId()

    -- Check restrictions
    local isRestricted = false
    if Config.CheckRestrictions then
        local restrictPromise = promise.new()
        restrictPromise:resolve(framework:isRestricted())
        Citizen.Await(restrictPromise)

        if restrictPromise then
            isRestricted = restrictPromise.value
        end
    end

    if isRestricted then
        IsLockpicking = false
        return
    end

    -- Check authorization
    if not Config.LockpickDoorCustomAuth(vehicle, utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle))) then
        IsLockpicking = false
        return
    end

    -- Check if vehicle is locked
    local lockStatus = GetVehicleDoorLockStatus(vehicle)
    if lockStatus ~= 2 then
        utils:notify(locale('not_locked'), 'error', 5000)
        IsLockpicking = false
        return
    end

    -- Check if player already has keys
    if HasAuth(vehicle) then
        IsLockpicking = false
        return
    end

    -- Check if player owned vehicle can be lockpicked
    if Config.KeysAsItem.PlayerOwned.Enabled and not Config.KeysAsItem.PlayerOwned.CanLockpickDoor then
        local ownerCheck = promise.new()

        lib.callback('MK_VehicleKeys:Server:CheckOwnership', false, function(isOwned)
            ownerCheck:resolve(isOwned)
        end, utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle)))

        Citizen.Await(ownerCheck)

        if ownerCheck and ownerCheck.value then
            utils:notify(locale('no_keys'), 'error', 5000)
            IsLockpicking = false
            return
        end
    end

    -- Perform lockpick
    local lockpickTime = math.random(Config.Lockpick.DoorsTime.Min, Config.Lockpick.DoorsTime.Max) * 1000
    if isAdvanced then
        lockpickTime = lockpickTime / 2
    end

    local success = false

    if Config.Lockpick.Game.VehicleDoors.UseGame then
        Config.Lockpick.Game.VehicleDoors.StartGame(isAdvanced, function(result)
            success = result
        end)
    else
        local progressType = Config.ProgressCircle and "progressCircle" or "progressBar"
        local position = Config.ProgressCircle and (Config.ProgressCirclePosition or "middle") or nil

        success = lib[progressType]({
            duration = lockpickTime,
            label = locale('attempt_lockpick_door'),
            position = position,
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true
            },
            anim = {
                dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
                clip = 'machinic_loop_mechandplayer'
            }
        })
    end

    if success then
        -- Check if configured to fail
        if not Config.Lockpick.Game.VehicleDoors.UseGame then
            local failChance = math.random(1, 100)
            local failThreshold = isAdvanced and (Config.Lockpick.DoorsFailChance / 2) or Config.Lockpick.DoorsFailChance

            if failChance <= failThreshold then
                success = false
            end
        end

        if success then
            utils:notify(locale('lockpick_success'), 'success', 5000)

            -- Unlock vehicle
            SetVehicleDoorsLocked(vehicle, 1)

            -- Check if lockpick breaks
            local breakChance = math.random(1, 100)
            local breakThreshold = isAdvanced and
                (Config.Lockpick.DoorsBreakPick.OnSuccess.Chance / 2) or
                Config.Lockpick.DoorsBreakPick.OnSuccess.Chance

            if Config.Lockpick.DoorsBreakPick.OnSuccess.Break and breakChance <= breakThreshold then
                local itemToRemove = isAdvanced and
                    Config.Lockpick.AdvancedLockpickItem or
                    Config.Lockpick.LockpickItem

                TriggerServerEvent('MK_VehicleKeys:Server:RemoveItem', itemToRemove, 1)
                utils:notify(locale('broke_lockpick'), 'error', 5000)
            end

            Config.LockpickDoorEvent(vehicle,
                utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle)),
                GetEntityCoords(vehicle, false)
            )
        else
            utils:notify(locale('lockpick_door_fail'), 'error', 5000)

            -- Check if lockpick breaks
            local breakChance = math.random(1, 100)
            local breakThreshold = isAdvanced and
                (Config.Lockpick.DoorsBreakPick.OnFail.Chance / 2) or
                Config.Lockpick.DoorsBreakPick.OnFail.Chance

            if Config.Lockpick.DoorsBreakPick.OnFail.Break and breakChance <= breakThreshold then
                local itemToRemove = isAdvanced and
                    Config.Lockpick.AdvancedLockpickItem or
                    Config.Lockpick.LockpickItem

                TriggerServerEvent('MK_VehicleKeys:Server:RemoveItem', itemToRemove, 1)
                utils:notify(locale('broke_lockpick'), 'error', 5000)
            end
        end
    end

    IsLockpicking = false
end

-- Lockpick ignition function
function LockpickIgnition(vehicle, isAdvanced)
    if not vehicle then return end

    local playerPed = PlayerPedId()

    -- Check restrictions
    local isRestricted = false
    if Config.CheckRestrictions then
        local restrictPromise = promise.new()
        restrictPromise:resolve(framework:isRestricted())
        Citizen.Await(restrictPromise)

        if restrictPromise then
            isRestricted = restrictPromise.value
        end
    end

    if isRestricted then
        IsLockpicking = false
        return
    end

    -- Check authorization
    if not Config.LockpickIgnitionCustomAuth(vehicle, utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle))) then
        IsLockpicking = false
        return
    end

    -- Check if player already has keys
    if HasAuth(vehicle) then
        IsLockpicking = false
        return
    end

    -- Check if player owned vehicle can be lockpicked
    if Config.KeysAsItem.PlayerOwned.Enabled and not Config.KeysAsItem.PlayerOwned.CanLockpickIgnition then
        local ownerCheck = promise.new()

        lib.callback('MK_VehicleKeys:Server:CheckOwnership', false, function(isOwned)
            ownerCheck:resolve(isOwned)
        end, utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle)))

        Citizen.Await(ownerCheck)

        if ownerCheck and ownerCheck.value then
            utils:notify(locale('no_keys'), 'error', 5000)
            IsLockpicking = false
            return
        end
    end

    -- Perform lockpick
    local lockpickTime = math.random(Config.Lockpick.IgnitionTime.Min, Config.Lockpick.IgnitionTime.Max) * 1000
    if isAdvanced then
        lockpickTime = lockpickTime / 2
    end

    local success = false

    if Config.Lockpick.Game.Ignition.UseGame then
        Config.Lockpick.Game.Ignition.StartGame(isAdvanced, function(result)
            success = result
        end)
    else
        local progressType = Config.ProgressCircle and "progressCircle" or "progressBar"
        local position = Config.ProgressCircle and (Config.ProgressCirclePosition or "middle") or nil

        success = lib[progressType]({
            duration = lockpickTime,
            label = locale('attempt_lockpick_door'),
            position = position,
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true
            },
            anim = {
                dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
                clip = 'machinic_loop_mechandplayer'
            }
        })
    end

    if success then
        -- Check if configured to fail
        if not Config.Lockpick.Game.Ignition.UseGame then
            local failChance = math.random(1, 100)
            local failThreshold = isAdvanced and (Config.Lockpick.IgnitionFailChance / 2) or Config.Lockpick.IgnitionFailChance

            if failChance <= failThreshold then
                success = false
            end
        end

        if success then
            utils:notify(locale('lockpick_success'), 'success', 5000)

            TriggerServerEvent('MK_VehicleKeys:Server:AddKey',
                NetworkGetNetworkIdFromEntity(vehicle), false, false
            )

            SetVehicleEngineOn(vehicle, true, false, Config.DisableAutoStartEngine or false)

            -- Check if lockpick breaks
            local breakChance = math.random(1, 100)
            local breakThreshold = isAdvanced and
                (Config.Lockpick.IgnitionBreakPick.OnSuccess.Chance / 2) or
                Config.Lockpick.IgnitionBreakPick.OnSuccess.Chance

            if Config.Lockpick.IgnitionBreakPick.OnSuccess.Break and breakChance <= breakThreshold then
                local itemToRemove = isAdvanced and
                    Config.Lockpick.AdvancedLockpickItem or
                    Config.Lockpick.LockpickItem

                TriggerServerEvent('MK_VehicleKeys:Server:RemoveItem', itemToRemove, 1)
                utils:notify(locale('broke_lockpick'), 'error', 5000)
            end

            Config.LockpickIgnitionEvent(vehicle,
                utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle)),
                GetEntityCoords(vehicle, false)
            )
        else
            utils:notify(locale('ignition_fail'), 'error', 5000)

            -- Check if lockpick breaks
            local breakChance = math.random(1, 100)
            local breakThreshold = isAdvanced and
                (Config.Lockpick.IgnitionBreakPick.OnFail.Chance / 2) or
                Config.Lockpick.IgnitionBreakPick.OnFail.Chance

            if Config.Lockpick.IgnitionBreakPick.OnFail.Break and breakChance <= breakThreshold then
                local itemToRemove = isAdvanced and
                    Config.Lockpick.AdvancedLockpickItem or
                    Config.Lockpick.LockpickItem

                TriggerServerEvent('MK_VehicleKeys:Server:RemoveItem', itemToRemove, 1)
                utils:notify(locale('broke_lockpick'), 'error', 5000)
            end
        end
    end

    IsLockpicking = false
end

-- Additional helper functions would go here (IsWhitelisted, IsJobWhitelisted, CheckFob, etc.)
-- These are utility functions referenced in the main code above
