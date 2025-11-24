-- Deobfuscated cl_main.lua
-- Main client-side file for the vehicle keys system

-- Global variables
Notify = nil
IsLockpicking = false
IsHotwiring = false
TakingKeys = false
AlertCooldown = false
Armed = false
MaxFobRange = 150
DisableLockpick = false
Binds = {}

-- Handle resource restart
RegisterNetEvent('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end

    if lib.isTextUIOpen() then
        lib.hideTextUI()
    end

    LoadFramework()
end)

-- Login event handler
function loginEvent()
    AlertCooldown = false
    IsLockpicking = false
    IsHotwiring = false
    TakingKeys = false
    Armed = false

    -- Setup keyfob zones and blips if using physical keys
    if Config.KeysAsItem.PlayerOwned.Enabled and Config.KeysAsItem.UseTarget then
        for index, pedConfig in pairs(Config.KeysAsItem.Peds) do
            local zone = lib.zones.poly({
                points = pedConfig.Coords,
                thickness = 4,
                debug = pedConfig.debug or false,
                inside = InsideZone,
                onEnter = EnterZone,
                onExit = ExitZone,
                Index = index
            })

            pedConfig.CreatedZone = zone

            -- Create blip if enabled
            if pedConfig.Blip.ShowBlip then
                local blip = AddBlipForCoord(pedConfig.PedPosition.x, pedConfig.PedPosition.y, 0.0)
                pedConfig.Blip.CreatedBlip = blip

                SetBlipSprite(blip, pedConfig.Blip.Sprite)
                SetBlipDisplay(blip, 2)
                SetBlipScale(blip, pedConfig.Blip.Scale)
                SetBlipAsShortRange(blip, pedConfig.Blip.ShortRange or false)
                SetBlipColour(blip, pedConfig.Blip.Color)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName(tostring(pedConfig.Blip.Label))
                EndTextCommandSetBlipName(blip)
            end
        end
    end

    -- Start disable accelerate start thread if needed
    if Config.DisableAccelerateVehicleStart then
        RunDisableStartThread()
    end

    -- Start main loops
    StartLoops()
end

-- Logout event handler
function logoutEvent(relogin)
    AlertCooldown = false
    IsLockpicking = false
    IsHotwiring = false
    TakingKeys = false
    Armed = false

    Wait(1000)

    -- Clean up keyfob zones and blips
    if Config.KeysAsItem.PlayerOwned.Enabled then
        for _, pedConfig in pairs(Config.KeysAsItem.Peds) do
            if pedConfig.CreatedZone then
                pedConfig.CreatedZone:remove()
            end

            if pedConfig.Ped then
                target:removeEntity(pedConfig.Ped)
                DeletePed(pedConfig.Ped)
                pedConfig.Ped = nil
            end

            if pedConfig.Blip.ShowBlip and pedConfig.Blip.CreatedBlip then
                RemoveBlip(pedConfig.Blip.CreatedBlip)
                pedConfig.Blip.CreatedBlip = nil
            end
        end
    end

    Wait(2000)

    if lib.isTextUIOpen() then
        lib.hideTextUI()
    end

    if relogin then
        loginEvent()
    end
end

-- Load framework function
function LoadFramework()
    frameworkLoaded = false
    finishedLoading = false

    CreateThread(function()
        local timeout = 0

        while not frameworkLoaded and not finishedLoading and timeout < 600 do
            Wait(1000)
            timeout = timeout + 1
        end

        if not frameworkLoaded then
            utils.logger:error('VehicleKeys', '^1Unable to load framework; Check config.^7', {console = true})
        else
            -- Register hotwire keybind if enabled
            if Config.EnableHotwiring then
                RegisterKeyMapping('mkhotwireattempt', locale('hotwire_keybind_text'), 'keyboard', 'H')

                RegisterCommand('mkhotwireattempt', function()
                    if not Config.EnableHotwiring then return end

                    if canHotwire then
                        canHotwire = false
                        IsHotwiring = true

                        if lib.isTextUIOpen() then
                            lib.hideTextUI()
                        end

                        HotwireVehicle(cache.vehicle)
                    end
                end, false)
            end

            -- Register exit vehicle keybind
            RegisterKeyMapping('mkexitvehicle', locale('exitvehicle_keybind_text'), 'keyboard', 'F')

            RegisterCommand('mkexitvehicle', function()
                if cache.vehicle and cache.seat then
                    if not IsControlEnabled(0, 75) then return end

                    local lockStatus = GetVehicleDoorLockStatus(cache.vehicle)

                    if Config.DisableLeaveIfLocked and lockStatus == 2 then
                        if Config.NotifyPlayerDoorsAreLocked then
                            utils:notify(locale('cant_exit_veh_locked'), 'error', 5000)
                        end
                        DisableControlAction(0, 75, true)
                    else
                        if Config.LeaveDoorOpen then
                            Wait(150)
                            if IsControlPressed(0, 75) then
                                TaskLeaveVehicle(cache.ped, cache.vehicle, 256)
                            else
                                SetControlNormal(0, 75, 1)
                            end
                        else
                            SetControlNormal(0, 75, 1)
                        end
                    end
                end
            end, false)

            -- Register toggle locks command
            RegisterCommand('mktogglevehiclelocks', function()
                if not LocalPlayer.state.mk_isLoggedIn then return end

                if not togglingLocks then
                    togglingLocks = true

                    CreateThread(function()
                        SetTimeout(Config.ToggleLockSpamDelay, function()
                            togglingLocks = false
                        end)
                    end)

                    local isRestricted = false
                    local restrictPromise = promise.new()
                    restrictPromise:resolve(framework:isRestricted())
                    Citizen.Await(restrictPromise)

                    if restrictPromise then
                        isRestricted = restrictPromise.value
                    end

                    if not isRestricted then
                        local vehicle = utils:getClosestVehicle()
                        local playerCoords = GetEntityCoords(PlayerPedId(), true)

                        if IsPedInAnyVehicle(PlayerPedId(), true) then
                            vehicle = GetVehiclePedIsIn(PlayerPedId())
                        end

                        local vehicleCoords = GetEntityCoords(vehicle, false)

                        if vehicle > 0 and #(playerCoords - vehicleCoords) < 7.5 then
                            if HasAuth(vehicle) then
                                if not Entity(vehicle).state.LockBusy then
                                    TriggerServerEvent('MK_VehicleKeys:Server:ToggleLocks', NetworkGetNetworkIdFromEntity(vehicle), vehicle)
                                end
                            else
                                -- Check if job whitelisted
                                local jobWhitelisted = nil
                                local jobPromise = promise.new()

                                IsJobWhitelisted(GetEntityModel(vehicle), function(result)
                                    jobPromise:resolve(result)
                                end)

                                Citizen.Await(jobPromise)

                                if jobPromise then
                                    jobWhitelisted = jobPromise.value
                                end

                                if jobWhitelisted then
                                    if not HasAuth(vehicle) then
                                        Wait(250)

                                        lib.callback('MK_VehicleKeys:Server:CheckOwnership', false, function(isOwner)
                                            local job, jobName = framework:getJob()
                                            local vehicleJob = Entity(vehicle).state.mk_jobVehicle

                                            if vehicleJob and job and vehicleJob ~= job then
                                                return utils:notify(locale('job_vehicle_wrong_job'), 'error', 5000)
                                            end

                                            if isOwner then
                                                if Config.KeysAsItem.PlayerOwned.Enabled and Config.KeysAsItem.PlayerOwned.GiveWhitelistJobKeys then
                                                    TriggerServerEvent('MK_VehicleKeys:Server:AddKey',
                                                        NetworkGetNetworkIdFromEntity(vehicle),
                                                        false, false, false, false, false, job or false
                                                    )
                                                end

                                                if not Entity(vehicle).state.LockBusy then
                                                    TriggerServerEvent('MK_VehicleKeys:Server:ToggleLocks',
                                                        NetworkGetNetworkIdFromEntity(vehicle), vehicle
                                                    )
                                                end

                                                -- Start engine if in driver seat
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
                                        end, utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle)))
                                    end
                                elseif Config.KeysAsItem.PlayerOwned.Enabled then
                                    if not HasAuth(vehicle) then
                                        Wait(250)

                                        local fobId = Entity(vehicle).state.MKFOB

                                        if fobId == nil and not Entity(vehicle).state.MK_CheckFobData then
                                            Entity(vehicle).state:set('MK_CheckFobData', true, true)

                                            local fobPromise = promise.new()

                                            lib.callback('MK_VehicleKeys:Server:SetFobDataByPlate', false,
                                                function(fobData)
                                                    fobPromise:resolve(fobData)
                                                    Citizen.Await(fobPromise)

                                                    if fobPromise and fobPromise.value and
                                                       type(fobPromise.value) ~= "boolean" then
                                                        local waitCount = 0
                                                        while Entity(vehicle).state.MKFOB == nil and waitCount < 50 do
                                                            Wait(100)
                                                            waitCount = waitCount + 1
                                                        end
                                                    end

                                                    Entity(vehicle).state:set('MK_CheckFobData', false, true)

                                                    if HasAuth(vehicle) and not Entity(vehicle).state.LockBusy then
                                                        TriggerServerEvent('MK_VehicleKeys:Server:ToggleLocks',
                                                            NetworkGetNetworkIdFromEntity(vehicle), vehicle
                                                        )
                                                    end
                                                end,
                                                utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle)),
                                                NetworkGetNetworkIdFromEntity(vehicle)
                                            )
                                        end
                                    end
                                else
                                    if not HasAuth(vehicle) then
                                        Wait(250)

                                        lib.callback('MK_VehicleKeys:Server:CheckOwnership', false,
                                            function(isOwner, ownerIdentifier)
                                                if isOwner and ownerIdentifier == LocalPlayer.state.mk_identifier then
                                                    TriggerServerEvent('MK_VehicleKeys:Server:AddKey',
                                                        NetworkGetNetworkIdFromEntity(vehicle), false, false
                                                    )
                                                    Wait(300)

                                                    if not Entity(vehicle).state.LockBusy then
                                                        TriggerServerEvent('MK_VehicleKeys:Server:ToggleLocks',
                                                            NetworkGetNetworkIdFromEntity(vehicle), vehicle
                                                        )
                                                    end

                                                    -- Start engine if in driver seat
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
                                            end,
                                            utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle))
                                        )
                                    end
                                end
                            end
                        end
                    end
                end
            end)

            -- Register engine toggle command
            RegisterCommand('mktogglevehicleengine', function()
                if Config.Binds.EngineToggle.Enable and not IsPauseMenuActive() then
                    TriggerEvent('MK_VehicleKeys:Client:ToggleEngine')
                end
            end)

            -- Remove chat suggestions for internal commands
            TriggerEvent('chat:removeSuggestion', 'mktogglevehiclelocks')
            TriggerEvent('chat:removeSuggestion', 'mktogglevehicleengine')
            TriggerEvent('chat:removeSuggestion', 'mkhotwireattempt')
            TriggerEvent('chat:removeSuggestion', 'mkexitvehicle')

            -- Setup ox_inventory metadata if available
            if Config.KeysAsItem.PlayerOwned.Enabled and GetResourceState('ox_inventory') == 'started' then
                exports.ox_inventory:displayMetadata({
                    name = locale('ox_meta_name'),
                    id = locale('ox_meta_id'),
                    plate = locale('ox_meta_plate')
                })
            end

            -- Register keybinds
            local bindsToRegister = {
                {
                    l = locale('bind_lock_label'),
                    b = Config.Binds.ToggleLocks.DefaultBind or 'l',
                    c = 'mktogglevehiclelocks',
                    t = Config.Binds.ToggleLocks.BindType or 'keyboard'
                }
            }

            if Config.Binds.EngineToggle.Enable then
                table.insert(bindsToRegister, {
                    l = locale('bind_engine_label'),
                    b = Config.Binds.EngineToggle.DefaultBind or 'G',
                    c = 'mktogglevehicleengine',
                    t = Config.Binds.EngineToggle.BindType or 'keyboard'
                })
            end

            for _, bind in ipairs(bindsToRegister) do
                RegisterKeyMapping(bind.c, bind.l, bind.t, bind.b)
            end

            -- Register user commands
            if Config.Commands.GiveKey.Enable then
                RegisterCommand(Config.Commands.GiveKey.CommandName, function()
                    TriggerEvent('MK_VehicleKeys:Client:GiveKey')
                end)

                TriggerEvent('chat:addSuggestion', '/' .. Config.Commands.GiveKey.CommandName,
                    locale('command_givekey_label')
                )
            end

            if Config.Commands.RemoveKey.Enable then
                RegisterCommand(Config.Commands.RemoveKey.CommandName, function(source, args)
                    TriggerEvent('MK_VehicleKeys:Client:RemoveKey', tonumber(args[1]))
                end)

                TriggerEvent('chat:addSuggestion', '/' .. Config.Commands.RemoveKey.CommandName,
                    locale('command_removekey_label'), {
                        {name = locale('command_removekey_idlabel'), help = ''}
                    }
                )
            end

            if Config.Commands.EngineToggle.Enable then
                RegisterCommand(Config.Commands.EngineToggle.CommandName, function()
                    TriggerEvent('MK_VehicleKeys:Client:ToggleEngine')
                end)

                TriggerEvent('chat:addSuggestion', '/' .. Config.Commands.EngineToggle.CommandName,
                    locale('command_engine_toggle_label')
                )
            end

            if Config.KeysAsItem.Command.Enable then
                RegisterCommand(Config.KeysAsItem.Command.CommandName, function()
                    TriggerEvent('MK_VehicleKeys:Client:OpenKeyfobMenu')
                end)

                TriggerEvent('chat:addSuggestion', '/' .. Config.KeysAsItem.Command.CommandName,
                    locale('command_keyfobs_label')
                )
            end

            finishedLoading = true
        end
    end)
end
