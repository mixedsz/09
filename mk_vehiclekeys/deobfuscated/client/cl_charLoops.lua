-- Deobfuscated cl_charLoops.lua
-- This file contains the main character loops for the vehicle keys system

-- Function to start the stealing driver keys loop
function StartLoops()
    CreateThread(function()
        while true do
            if not LocalPlayer.state.mk_isLoggedIn then
                break
            end

            if not TakingKeys then
                local enteringVehicle = GetVehiclePedIsTryingToEnter(PlayerPedId())

                if enteringVehicle > 0 then
                    if not cache.enteringVehicle and enteringVehicle > 0 then
                        cache:set('enteringVehicle', enteringVehicle)
                    end

                    local driver = GetPedInVehicleSeat(enteringVehicle, -1)

                    if driver > 0 and not IsPedAPlayer(driver) and not Entity(driver).state.MK_Disable_TakeKeys then
                        if Config.NpcVehicles.StealDriverKeys.Enabled then
                            -- Check if driver needs to be dead
                            if Config.NpcVehicles.StealDriverKeys.RequireDriverDead then
                                if not (IsEntityDead(driver) or GetEntityHealth(driver) <= 0 or IsPedDeadOrDying(driver, 1)) then
                                    goto continue
                                end
                            end

                            -- Check if vehicle is blacklisted
                            if IsStealDriverKeysBlacklist(GetEntityModel(enteringVehicle)) then
                                return
                            end

                            local pedCoords = GetEntityCoords(PlayerPedId(), true)
                            local driverCoords = GetEntityCoords(driver, false)
                            local distance = #(pedCoords - driverCoords)
                            local doorAngle = GetVehicleDoorAngleRatio(enteringVehicle, 0)

                            if doorAngle > 0.0 or distance < 1.5 then
                                local lockStatus = GetVehicleDoorLockStatus(enteringVehicle)

                                if lockStatus == 1 then
                                    TakingKeys = true

                                    local progressType = "progressBar"
                                    local progressPosition = nil

                                    if Config.ProgressCircle then
                                        progressType = "progressCircle"
                                        progressPosition = Config.ProgressCirclePosition or "middle"
                                    end

                                    local success = lib[progressType]({
                                        duration = 3000,
                                        label = locale('taking_keys'),
                                        position = progressPosition,
                                        useWhileDead = false,
                                        canCancel = false
                                    })

                                    if success then
                                        SetEntityAsMissionEntity(enteringVehicle, true, true)
                                        TriggerServerEvent('MK_VehicleKeys:Server:AddKey', NetworkGetNetworkIdFromEntity(enteringVehicle))

                                        local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(enteringVehicle))) or "Unknown"

                                        Config.NpcVehicles.StealDriverKeys.SuccessFunction(
                                            enteringVehicle,
                                            utils:removeTrailSpaces(GetVehicleNumberPlateText(enteringVehicle)),
                                            GetEntityCoords(enteringVehicle, false),
                                            vehicleName
                                        )

                                        SetVehicleEngineOn(
                                            enteringVehicle,
                                            true,
                                            false,
                                            Config.DisableAutoStartEngine or false
                                        )
                                    end

                                    TakingKeys = false
                                end
                            end
                        end
                    end
                else
                    if cache.enteringVehicle then
                        cache:set('enteringVehicle', false)
                    end
                end
            end

            ::continue::
            Wait(250)
        end
    end)
end

-- Function for the weapon/carjacking loop
function WeaponLoop()
    CreateThread(function()
        while true do
            if not LocalPlayer.state.mk_isLoggedIn then
                break
            end

            if not Armed then
                break
            end

            Wait(20)

            if not IsPedInAnyVehicle(PlayerPedId(), true) then
                if IsPlayerFreeAiming(PlayerId()) then
                    local success, targetEntity = GetEntityPlayerIsFreeAimingAt(PlayerId())

                    if IsPedArmed(PlayerPedId(), 4) and not IsPedFleeing(targetEntity) and not IsPedAPlayer(targetEntity) and success then
                        local playerPed = PlayerPedId()
                        local playerCoords = GetEntityCoords(playerPed, true)
                        local targetCoords = GetEntityCoords(targetEntity, true)

                        if DoesEntityExist(targetEntity) and IsEntityAPed(targetEntity) and
                           not IsPedDeadOrDying(targetEntity) and GetEntityHealth(targetEntity) > 0 and
                           not Entity(targetEntity).state.MK_Disable_CarJack then

                            local distance = #(playerCoords - targetCoords)

                            if distance <= 6.0 and IsPedInAnyVehicle(targetEntity, true) then
                                local vehicle = GetVehiclePedIsIn(targetEntity, false)

                                if not IsCarjackBlacklist(GetEntityModel(vehicle)) then
                                    local driver = GetPedInVehicleSeat(vehicle, -1)

                                    if driver == targetEntity and IsVehicleStopped(vehicle) then
                                        -- Make driver leave vehicle
                                        TaskLeaveVehicle(targetEntity, vehicle, 1)

                                        local timeout = 0
                                        while IsPedInAnyVehicle(targetEntity, false) and timeout < 1000 do
                                            Wait(5)
                                            timeout = timeout + 1
                                        end

                                        -- Make passengers leave
                                        local maxPassengers = GetVehicleMaxNumberOfPassengers(vehicle)
                                        if maxPassengers > 0 then
                                            for i = 0, maxPassengers do
                                                local passenger = GetPedInVehicleSeat(vehicle, i)
                                                if passenger > 0 and not IsPedAPlayer(passenger) then
                                                    TaskLeaveVehicle(passenger, vehicle, 1)

                                                    local passengerTimeout = 0
                                                    while IsPedInAnyVehicle(passenger, false) and passengerTimeout < 1000 do
                                                        Wait(5)
                                                        passengerTimeout = passengerTimeout + 1
                                                    end

                                                    SetPedDropsWeaponsWhenDead(passenger, false)
                                                    ClearPedTasksImmediately(passenger)
                                                    TaskSetBlockingOfNonTemporaryEvents(passenger, true)
                                                    SetPedCombatAttributes(passenger, 1, false)
                                                    SetPedCombatAttributes(passenger, 46, false)
                                                    ResetPedLastVehicle(passenger)
                                                    TaskReactAndFleePed(passenger, PlayerPedId())
                                                    SetPedKeepTask(passenger, true)
                                                end
                                                Wait(100)
                                            end
                                        end

                                        -- Load animations
                                        RequestAnimDict("missfbi5ig_22")
                                        while not HasAnimDictLoaded("missfbi5ig_22") do
                                            RequestAnimDict("missfbi5ig_22")
                                            Wait(100)
                                        end

                                        RequestAnimDict("mp_common")
                                        while not HasAnimDictLoaded("mp_common") do
                                            RequestAnimDict("mp_common")
                                            Wait(100)
                                        end

                                        -- Police notification
                                        if Config.PoliceNotify and Config.PoliceNotify.Chance and Config.PoliceNotify.AlertTimeout then
                                            if not AlertCooldown and math.random(1, 100) < Config.PoliceNotify.Chance then
                                                local plate = utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle))
                                                local coords = GetEntityCoords(vehicle)
                                                local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) or "Unknown"

                                                AlertCooldown = true
                                                framework:policeDispatchNotify({
                                                    coords = coords,
                                                    plate = plate,
                                                    vehicleName = vehicleName,
                                                    vehicle = vehicle,
                                                    message = locale('dispatch_alert_message'),
                                                    blipText = locale('dispatch_alert_blip_text'),
                                                    modelHash = GetEntityModel(vehicle),
                                                    modelString = vehicles[GetEntityModel(vehicle)] and vehicles[GetEntityModel(vehicle)].name
                                                })

                                                SetTimeout(Config.PoliceNotify.AlertTimeout * 1000, function()
                                                    AlertCooldown = false
                                                end)
                                            end
                                        end

                                        -- Driver animations
                                        SetPedDropsWeaponsWhenDead(targetEntity, false)
                                        ClearPedTasksImmediately(targetEntity)
                                        TaskTurnPedToFaceEntity(targetEntity, PlayerPedId(), 3.0)
                                        TaskSetBlockingOfNonTemporaryEvents(targetEntity, true)
                                        SetPedFleeAttributes(targetEntity, 0, 0)
                                        SetPedCombatAttributes(targetEntity, 17, 1)
                                        SetPedCombatAttributes(targetEntity, 46, false)
                                        ResetPedLastVehicle(targetEntity)
                                        SetPedSeeingRange(targetEntity, 0.0)
                                        SetPedHearingRange(targetEntity, 0.0)
                                        SetPedAlertness(targetEntity, 0)
                                        SetPedKeepTask(targetEntity, true)

                                        TaskPlayAnim(targetEntity, "missfbi5ig_22", "hands_up_anxious_scientist", 8.0, -8, -1, 12, 1, 0, 0, 0)
                                        Wait(1500)
                                        TaskPlayAnim(targetEntity, "missfbi5ig_22", "hands_up_anxious_scientist", 8.0, -8, -1, 12, 1, 0, 0, 0)
                                        Wait(2500)

                                        local playerDistFromVehicle = #(GetEntityCoords(PlayerPedId(), true) - GetEntityCoords(vehicle, true))

                                        if not IsEntityDead(targetEntity) and DoesEntityExist(targetEntity) and
                                           not IsPedDeadOrDying(targetEntity, 1) and GetEntityHealth(targetEntity) > 0.0 and
                                           playerDistFromVehicle < 12 then

                                            TaskPlayAnim(targetEntity, "mp_common", "givetake1_a", 8.0, -8, -1, 12, 1, 0, 0, 0)
                                            Wait(750)

                                            SetEntityAsMissionEntity(vehicle, true, true)
                                            TriggerServerEvent('MK_VehicleKeys:Server:AddKey', NetworkGetNetworkIdFromEntity(vehicle), false, false, false, true)

                                            local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) or "Unknown"

                                            Config.NpcVehicles.Carjacking.SuccessFunction(
                                                vehicle,
                                                utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle)),
                                                GetEntityCoords(vehicle, false),
                                                vehicleName
                                            )

                                            SetVehicleEngineOn(vehicle, true, false, Config.DisableAutoStartEngine or false)
                                            Wait(500)

                                            -- Make driver flee multiple times
                                            for i = 1, 4 do
                                                TaskReactAndFleePed(targetEntity, PlayerPedId())
                                                SetPedKeepTask(targetEntity, true)
                                                Wait(2500)
                                            end
                                        end

                                        ClearPedTasks(targetEntity)
                                        Wait(1000)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        if Armed then
            Armed = false
        end
    end)
end
