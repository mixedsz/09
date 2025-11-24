local L0_1, L1_1, L2_1
Notify = nil
IsLockpicking = false
IsHotwiring = false
TakingKeys = false
AlertCooldown = false
Armed = false
MaxFobRange = 150
DisableLockpick = false
L0_1 = {}
Binds = L0_1
L0_1 = RegisterNetEvent
L1_1 = "onClientResourceStart"
function L2_1(A0_2)
  local L1_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 ~= A0_2 then
    return
  end
  L1_2 = lib
  L1_2 = L1_2.isTextUIOpen
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = lib
    L1_2 = L1_2.hideTextUI
    L1_2()
  end
  L1_2 = LoadFramework
  L1_2()
end
L0_1(L1_1, L2_1)
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  AlertCooldown = false
  IsLockpicking = false
  IsHotwiring = false
  TakingKeys = false
  Armed = false
  L0_2 = Config
  L0_2 = L0_2.KeysAsItem
  L0_2 = L0_2.PlayerOwned
  L0_2 = L0_2.Enabled
  if L0_2 then
    L0_2 = Config
    L0_2 = L0_2.KeysAsItem
    L0_2 = L0_2.UseTarget
    if L0_2 then
      L0_2 = pairs
      L1_2 = Config
      L1_2 = L1_2.KeysAsItem
      L1_2 = L1_2.Peds
      L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
      for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
        L6_2 = lib
        L6_2 = L6_2.zones
        L6_2 = L6_2.poly
        L7_2 = {}
        L8_2 = L5_2.Coords
        L7_2.points = L8_2
        L7_2.thickness = 4
        L8_2 = L5_2.debug
        if L8_2 then
          L8_2 = L5_2.debug
          if L8_2 then
            goto lbl_38
          end
        end
        L8_2 = false
        ::lbl_38::
        L7_2.debug = L8_2
        L8_2 = InsideZone
        L7_2.inside = L8_2
        L8_2 = EnterZone
        L7_2.onEnter = L8_2
        L8_2 = ExitZone
        L7_2.onExit = L8_2
        L7_2.Index = L4_2
        L6_2 = L6_2(L7_2)
        L5_2.CreatedZone = L6_2
        L6_2 = L5_2.Blip
        L6_2 = L6_2.ShowBlip
        if L6_2 then
          L6_2 = L5_2.Blip
          L7_2 = AddBlipForCoord
          L8_2 = L5_2.PedPosition
          L8_2 = L8_2.x
          L9_2 = L5_2.PedPosition
          L9_2 = L9_2.y
          L10_2 = 0.0
          L7_2 = L7_2(L8_2, L9_2, L10_2)
          L6_2.CreatedBlip = L7_2
          L6_2 = SetBlipSprite
          L7_2 = L5_2.Blip
          L7_2 = L7_2.CreatedBlip
          L8_2 = L5_2.Blip
          L8_2 = L8_2.Sprite
          L6_2(L7_2, L8_2)
          L6_2 = SetBlipDisplay
          L7_2 = L5_2.Blip
          L7_2 = L7_2.CreatedBlip
          L8_2 = 2
          L6_2(L7_2, L8_2)
          L6_2 = SetBlipScale
          L7_2 = L5_2.Blip
          L7_2 = L7_2.CreatedBlip
          L8_2 = L5_2.Blip
          L8_2 = L8_2.Scale
          L6_2(L7_2, L8_2)
          L6_2 = SetBlipAsShortRange
          L7_2 = L5_2.Blip
          L7_2 = L7_2.CreatedBlip
          L8_2 = L5_2.Blip
          L8_2 = L8_2.ShortRange
          if L8_2 then
            L8_2 = true
            if L8_2 then
              goto lbl_89
            end
          end
          L8_2 = false
          ::lbl_89::
          L6_2(L7_2, L8_2)
          L6_2 = SetBlipColour
          L7_2 = L5_2.Blip
          L7_2 = L7_2.CreatedBlip
          L8_2 = L5_2.Blip
          L8_2 = L8_2.Color
          L6_2(L7_2, L8_2)
          L6_2 = BeginTextCommandSetBlipName
          L7_2 = "STRING"
          L6_2(L7_2)
          L6_2 = AddTextComponentSubstringPlayerName
          L7_2 = tostring
          L8_2 = L5_2.Blip
          L8_2 = L8_2.Label
          L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
          L6_2(L7_2, L8_2, L9_2, L10_2)
          L6_2 = EndTextCommandSetBlipName
          L7_2 = L5_2.Blip
          L7_2 = L7_2.CreatedBlip
          L6_2(L7_2)
        end
      end
    end
  end
  L0_2 = Config
  L0_2 = L0_2.DisableAccelerateVehicleStart
  if L0_2 then
    L0_2 = RunDisableStartThread
    L0_2()
  end
  L0_2 = StartLoops
  L0_2()
end
loginEvent = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  AlertCooldown = false
  IsLockpicking = false
  IsHotwiring = false
  TakingKeys = false
  Armed = false
  L1_2 = Wait
  L2_2 = 1000
  L1_2(L2_2)
  L1_2 = Config
  L1_2 = L1_2.KeysAsItem
  L1_2 = L1_2.PlayerOwned
  L1_2 = L1_2.Enabled
  if L1_2 then
    L1_2 = pairs
    L2_2 = Config
    L2_2 = L2_2.KeysAsItem
    L2_2 = L2_2.Peds
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_2.CreatedZone
      if L7_2 then
        L7_2 = L6_2.CreatedZone
        L8_2 = L7_2
        L7_2 = L7_2.remove
        L7_2(L8_2)
      end
      L7_2 = L6_2.Ped
      if L7_2 then
        L7_2 = target
        L8_2 = L7_2
        L7_2 = L7_2.removeEntity
        L9_2 = L6_2.Ped
        L7_2(L8_2, L9_2)
        L7_2 = DeletePed
        L8_2 = L6_2.Ped
        L7_2(L8_2)
        L6_2.Ped = nil
      end
      L7_2 = L6_2.Blip
      L7_2 = L7_2.ShowBlip
      if L7_2 then
        L7_2 = L6_2.Blip
        L7_2 = L7_2.CreatedBlip
        if L7_2 then
          L7_2 = RemoveBlip
          L8_2 = L6_2.Blip
          L8_2 = L8_2.CreatedBlip
          L7_2(L8_2)
          L7_2 = L6_2.Blip
          L7_2.CreatedBlip = nil
        end
      end
    end
  end
  L1_2 = Wait
  L2_2 = 2000
  L1_2(L2_2)
  L1_2 = lib
  L1_2 = L1_2.isTextUIOpen
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = lib
    L1_2 = L1_2.hideTextUI
    L1_2()
  end
  if A0_2 then
    L1_2 = loginEvent
    L1_2()
  end
end
logoutEvent = L0_1
function L0_1()
  local L0_2, L1_2, L2_2
  frameworkLoaded = false
  finishedLoading = false
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = 0
    while true do
      L1_3 = frameworkLoaded
      if L1_3 then
        break
      end
      L1_3 = finishedLoading
      if L1_3 then
        break
      end
      L1_3 = 600
      if not (L0_3 < L1_3) then
        break
      end
      L1_3 = Wait
      L2_3 = 1000
      L1_3(L2_3)
      L0_3 = L0_3 + 1
    end
    L1_3 = frameworkLoaded
    if not L1_3 then
      L1_3 = utils
      L1_3 = L1_3.logger
      L2_3 = L1_3
      L1_3 = L1_3.error
      L3_3 = "VehicleKeys"
      L4_3 = "^1Unable to load framework; Check config.^7"
      L5_3 = {}
      L5_3.console = true
      L1_3(L2_3, L3_3, L4_3, L5_3)
    else
      L1_3 = Config
      L1_3 = L1_3.EnableHotwiring
      if L1_3 then
        L1_3 = RegisterKeyMapping
        L2_3 = "mkhotwireattempt"
        L3_3 = locale
        L4_3 = "hotwire_keybind_text"
        L3_3 = L3_3(L4_3)
        L4_3 = "keyboard"
        L5_3 = "H"
        L1_3(L2_3, L3_3, L4_3, L5_3)
        L1_3 = RegisterCommand
        L2_3 = "mkhotwireattempt"
        function L3_3()
          local L0_4, L1_4
          L0_4 = Config
          L0_4 = L0_4.EnableHotwiring
          if not L0_4 then
            return
          end
          L0_4 = canHotwire
          if L0_4 then
            canHotwire = false
            IsHotwiring = true
            L0_4 = lib
            L0_4 = L0_4.isTextUIOpen
            L0_4 = L0_4()
            if L0_4 then
              L0_4 = lib
              L0_4 = L0_4.hideTextUI
              L0_4()
            end
            L0_4 = HotwireVehicle
            L1_4 = cache
            L1_4 = L1_4.vehicle
            L0_4(L1_4)
          end
        end
        L4_3 = false
        L1_3(L2_3, L3_3, L4_3)
      end
      L1_3 = RegisterKeyMapping
      L2_3 = "mkexitvehicle"
      L3_3 = locale
      L4_3 = "exitvehicle_keybind_text"
      L3_3 = L3_3(L4_3)
      L4_3 = "keyboard"
      L5_3 = "F"
      L1_3(L2_3, L3_3, L4_3, L5_3)
      L1_3 = RegisterCommand
      L2_3 = "mkexitvehicle"
      function L3_3()
        local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4
        L0_4 = cache
        L0_4 = L0_4.vehicle
        if L0_4 then
          L0_4 = cache
          L0_4 = L0_4.seat
          if L0_4 then
            L0_4 = IsControlEnabled
            L1_4 = 0
            L2_4 = 75
            L0_4 = L0_4(L1_4, L2_4)
            if not L0_4 then
              return
            end
            L0_4 = GetVehicleDoorLockStatus
            L1_4 = cache
            L1_4 = L1_4.vehicle
            L0_4 = L0_4(L1_4)
            L1_4 = Config
            L1_4 = L1_4.DisableLeaveIfLocked
            if L1_4 and 2 == L0_4 then
              L1_4 = Config
              L1_4 = L1_4.NotifyPlayerDoorsAreLocked
              if L1_4 then
                L1_4 = utils
                L2_4 = L1_4
                L1_4 = L1_4.notify
                L3_4 = locale
                L4_4 = "cant_exit_veh_locked"
                L3_4 = L3_4(L4_4)
                L4_4 = "error"
                L5_4 = 5000
                L1_4(L2_4, L3_4, L4_4, L5_4)
              end
              L1_4 = DisableControlAction
              L2_4 = 0
              L3_4 = 75
              L4_4 = true
              L1_4(L2_4, L3_4, L4_4)
            else
              L1_4 = Config
              L1_4 = L1_4.LeaveDoorOpen
              if L1_4 then
                L1_4 = Wait
                L2_4 = 150
                L1_4(L2_4)
                L1_4 = IsControlPressed
                L2_4 = 0
                L3_4 = 75
                L1_4 = L1_4(L2_4, L3_4)
                if L1_4 then
                  L1_4 = TaskLeaveVehicle
                  L2_4 = cache
                  L2_4 = L2_4.ped
                  L3_4 = cache
                  L3_4 = L3_4.vehicle
                  L4_4 = 256
                  L1_4(L2_4, L3_4, L4_4)
                else
                  L1_4 = SetControlNormal
                  L2_4 = 0
                  L3_4 = 75
                  L4_4 = 1
                  L1_4(L2_4, L3_4, L4_4)
                end
              else
                L1_4 = SetControlNormal
                L2_4 = 0
                L3_4 = 75
                L4_4 = 1
                L1_4(L2_4, L3_4, L4_4)
              end
            end
          end
        end
      end
      L4_3 = false
      L1_3(L2_3, L3_3, L4_3)
      L1_3 = RegisterCommand
      L2_3 = "mktogglevehiclelocks"
      function L3_3()
        local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4
        L0_4 = LocalPlayer
        L0_4 = L0_4.state
        L0_4 = L0_4.mk_isLoggedIn
        if L0_4 then
          L0_4 = togglingLocks
          if not L0_4 then
            togglingLocks = true
            L0_4 = CreateThread
            function L1_4()
              local L0_5, L1_5, L2_5
              L0_5 = SetTimeout
              L1_5 = Config
              L1_5 = L1_5.ToggleLockSpamDelay
              function L2_5()
                local L0_6, L1_6
                togglingLocks = false
              end
              L0_5(L1_5, L2_5)
            end
            L0_4(L1_4)
            L0_4 = false
            L1_4 = promise
            L1_4 = L1_4.new
            L1_4 = L1_4()
            L3_4 = L1_4
            L2_4 = L1_4.resolve
            L4_4 = framework
            L5_4 = L4_4
            L4_4 = L4_4.isRestricted
            L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4 = L4_4(L5_4)
            L2_4(L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4)
            L2_4 = Citizen
            L2_4 = L2_4.Await
            L3_4 = L1_4
            L2_4(L3_4)
            if L1_4 then
              L0_4 = L1_4.value
            end
            if not L0_4 then
              L2_4 = utils
              L3_4 = L2_4
              L2_4 = L2_4.getClosestVehicle
              L2_4 = L2_4(L3_4)
              L3_4 = GetEntityCoords
              L4_4 = PlayerPedId
              L4_4 = L4_4()
              L5_4 = true
              L3_4 = L3_4(L4_4, L5_4)
              L4_4 = IsPedInAnyVehicle
              L5_4 = PlayerPedId
              L5_4 = L5_4()
              L6_4 = true
              L4_4 = L4_4(L5_4, L6_4)
              if L4_4 then
                L4_4 = GetVehiclePedIsIn
                L5_4 = PlayerPedId
                L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4 = L5_4()
                L4_4 = L4_4(L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4)
                L2_4 = L4_4
              end
              L4_4 = GetEntityCoords
              L5_4 = L2_4
              L6_4 = false
              L4_4 = L4_4(L5_4, L6_4)
              if L2_4 > 0 then
                L5_4 = L3_4 - L4_4
                L5_4 = #L5_4
                L6_4 = 7.5
                if L5_4 < L6_4 then
                  L5_4 = HasAuth
                  L6_4 = L2_4
                  L5_4 = L5_4(L6_4)
                  if L5_4 then
                    L5_4 = Entity
                    L6_4 = L2_4
                    L5_4 = L5_4(L6_4)
                    L5_4 = L5_4.state
                    L5_4 = L5_4.LockBusy
                    if not L5_4 then
                      L5_4 = TriggerServerEvent
                      L6_4 = "MK_VehicleKeys:Server:ToggleLocks"
                      L7_4 = NetworkGetNetworkIdFromEntity
                      L8_4 = L2_4
                      L7_4 = L7_4(L8_4)
                      L8_4 = L2_4
                      L5_4(L6_4, L7_4, L8_4)
                    end
                  else
                    L5_4 = nil
                    L6_4 = promise
                    L6_4 = L6_4.new
                    L6_4 = L6_4()
                    L7_4 = IsJobWhitelisted
                    L8_4 = GetEntityModel
                    L9_4 = L2_4
                    L8_4 = L8_4(L9_4)
                    function L9_4(A0_5)
                      local L1_5, L2_5, L3_5
                      L1_5 = L6_4
                      L2_5 = L1_5
                      L1_5 = L1_5.resolve
                      L3_5 = A0_5
                      L1_5(L2_5, L3_5)
                    end
                    L7_4(L8_4, L9_4)
                    L7_4 = Citizen
                    L7_4 = L7_4.Await
                    L8_4 = L6_4
                    L7_4(L8_4)
                    if L6_4 then
                      L5_4 = L6_4.value
                    end
                    if L5_4 then
                      L7_4 = HasAuth
                      L8_4 = L2_4
                      L7_4 = L7_4(L8_4)
                      if not L7_4 then
                        L7_4 = Wait
                        L8_4 = 250
                        L7_4(L8_4)
                        L7_4 = lib
                        L7_4 = L7_4.callback
                        L8_4 = "MK_VehicleKeys:Server:CheckOwnership"
                        L9_4 = false
                        function L10_4(A0_5)
                          local L1_5, L2_5, L3_5, L4_5, L5_5, L6_5, L7_5, L8_5, L9_5, L10_5, L11_5
                          L1_5 = framework
                          L2_5 = L1_5
                          L1_5 = L1_5.getJob
                          L1_5, L2_5 = L1_5(L2_5)
                          L3_5 = Entity
                          L4_5 = L2_4
                          L3_5 = L3_5(L4_5)
                          L3_5 = L3_5.state
                          L3_5 = L3_5.mk_jobVehicle
                          if L3_5 and L1_5 then
                            L3_5 = Entity
                            L4_5 = L2_4
                            L3_5 = L3_5(L4_5)
                            L3_5 = L3_5.state
                            L3_5 = L3_5.mk_jobVehicle
                            if L3_5 ~= L1_5 then
                              L3_5 = utils
                              L4_5 = L3_5
                              L3_5 = L3_5.notify
                              L5_5 = locale
                              L6_5 = "job_vehicle_wrong_job"
                              L5_5 = L5_5(L6_5)
                              L6_5 = "error"
                              L7_5 = 5000
                              return L3_5(L4_5, L5_5, L6_5, L7_5)
                            end
                          end
                          if A0_5 then
                            if A0_5 then
                              L3_5 = Config
                              L3_5 = L3_5.KeysAsItem
                              L3_5 = L3_5.PlayerOwned
                              L3_5 = L3_5.Enabled
                              if not L3_5 then
                                goto lbl_53
                              end
                            end
                            if not A0_5 then
                              goto lbl_120
                            end
                            L3_5 = Config
                            L3_5 = L3_5.KeysAsItem
                            L3_5 = L3_5.PlayerOwned
                            L3_5 = L3_5.Enabled
                            if not L3_5 then
                              goto lbl_120
                            end
                            L3_5 = Config
                            L3_5 = L3_5.KeysAsItem
                            L3_5 = L3_5.PlayerOwned
                            L3_5 = L3_5.GiveWhitelistJobKeys
                            if not L3_5 then
                              goto lbl_120
                            end
                          end
                          ::lbl_53::
                          L3_5 = TriggerServerEvent
                          L4_5 = "MK_VehicleKeys:Server:AddKey"
                          L5_5 = NetworkGetNetworkIdFromEntity
                          L6_5 = L2_4
                          L5_5 = L5_5(L6_5)
                          L6_5 = false
                          L7_5 = false
                          L8_5 = false
                          L9_5 = false
                          L10_5 = false
                          L11_5 = L1_5 or L11_5
                          if not L1_5 or not L1_5 then
                            L11_5 = false
                          end
                          L3_5(L4_5, L5_5, L6_5, L7_5, L8_5, L9_5, L10_5, L11_5)
                          L3_5 = Entity
                          L4_5 = L2_4
                          L3_5 = L3_5(L4_5)
                          L3_5 = L3_5.state
                          L3_5 = L3_5.LockBusy
                          if not L3_5 then
                            L3_5 = TriggerServerEvent
                            L4_5 = "MK_VehicleKeys:Server:ToggleLocks"
                            L5_5 = NetworkGetNetworkIdFromEntity
                            L6_5 = L2_4
                            L5_5 = L5_5(L6_5)
                            L6_5 = L2_4
                            L3_5(L4_5, L5_5, L6_5)
                          end
                          L3_5 = GetPedInVehicleSeat
                          L4_5 = L2_4
                          L5_5 = -1
                          L3_5 = L3_5(L4_5, L5_5)
                          L4_5 = PlayerPedId
                          L4_5 = L4_5()
                          if L3_5 == L4_5 then
                            L3_5 = GetIsVehicleEngineRunning
                            L4_5 = L2_4
                            L3_5 = L3_5(L4_5)
                            if not L3_5 then
                              L3_5 = Config
                              L3_5 = L3_5.DisableAutoStartEngine
                              if L3_5 then
                                L3_5 = SetVehicleEngineOn
                                L4_5 = L2_4
                                L5_5 = false
                                L6_5 = true
                                L7_5 = true
                                L3_5(L4_5, L5_5, L6_5, L7_5)
                              else
                                L3_5 = SetVehicleEngineOn
                                L4_5 = L2_4
                                L5_5 = true
                                L6_5 = false
                                L7_5 = Config
                                L7_5 = L7_5.DisableAutoStartEngine
                                if L7_5 then
                                  L7_5 = true
                                  if L7_5 then
                                    goto lbl_119
                                  end
                                end
                                L7_5 = false
                                ::lbl_119::
                                L3_5(L4_5, L5_5, L6_5, L7_5)
                              end
                            end
                          end
                          ::lbl_120::
                        end
                        L11_4 = utils
                        L12_4 = L11_4
                        L11_4 = L11_4.removeTrailSpaces
                        L13_4 = GetVehicleNumberPlateText
                        L14_4 = L2_4
                        L13_4, L14_4, L15_4 = L13_4(L14_4)
                        L11_4, L12_4, L13_4, L14_4, L15_4 = L11_4(L12_4, L13_4, L14_4, L15_4)
                        L7_4(L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4)
                      end
                    else
                      L7_4 = Config
                      L7_4 = L7_4.KeysAsItem
                      L7_4 = L7_4.PlayerOwned
                      L7_4 = L7_4.Enabled
                      if L7_4 then
                        L7_4 = HasAuth
                        L8_4 = L2_4
                        L7_4 = L7_4(L8_4)
                        if not L7_4 then
                          L7_4 = Wait
                          L8_4 = 250
                          L7_4(L8_4)
                          L7_4 = Entity
                          L8_4 = L2_4
                          L7_4 = L7_4(L8_4)
                          L7_4 = L7_4.state
                          L7_4 = L7_4.MKFOB
                          if nil == L7_4 then
                            L7_4 = Entity
                            L8_4 = L2_4
                            L7_4 = L7_4(L8_4)
                            L7_4 = L7_4.state
                            L7_4 = L7_4.MK_CheckFobData
                            if not L7_4 then
                              L7_4 = Entity
                              L8_4 = L2_4
                              L7_4 = L7_4(L8_4)
                              L7_4 = L7_4.state
                              L8_4 = L7_4
                              L7_4 = L7_4.set
                              L9_4 = "MK_CheckFobData"
                              L10_4 = true
                              L11_4 = true
                              L7_4(L8_4, L9_4, L10_4, L11_4)
                              L7_4 = promise
                              L7_4 = L7_4.new
                              L7_4 = L7_4()
                              L8_4 = lib
                              L8_4 = L8_4.callback
                              L9_4 = "MK_VehicleKeys:Server:SetFobDataByPlate"
                              L10_4 = false
                              function L11_4(A0_5)
                                local L1_5, L2_5, L3_5, L4_5, L5_5
                                L1_5 = L7_4
                                L2_5 = L1_5
                                L1_5 = L1_5.resolve
                                L3_5 = A0_5
                                L1_5(L2_5, L3_5)
                                L1_5 = Citizen
                                L1_5 = L1_5.Await
                                L2_5 = L7_4
                                L1_5(L2_5)
                                L1_5 = L7_4
                                if L1_5 then
                                  L1_5 = L7_4.value
                                  if L1_5 then
                                    L1_5 = type
                                    L2_5 = L7_4.value
                                    L1_5 = L1_5(L2_5)
                                    if "boolean" ~= L1_5 then
                                      L1_5 = 0
                                      while true do
                                        L2_5 = Entity
                                        L3_5 = L2_4
                                        L2_5 = L2_5(L3_5)
                                        L2_5 = L2_5.state
                                        L2_5 = L2_5.MKFOB
                                        if not (nil == L2_5 and L1_5 < 50) then
                                          break
                                        end
                                        L2_5 = Wait
                                        L3_5 = 100
                                        L2_5(L3_5)
                                        L1_5 = L1_5 + 1
                                      end
                                    end
                                    L1_5 = Entity
                                    L2_5 = L2_4
                                    L1_5 = L1_5(L2_5)
                                    L1_5 = L1_5.state
                                    L2_5 = L1_5
                                    L1_5 = L1_5.set
                                    L3_5 = "MK_CheckFobData"
                                    L4_5 = false
                                    L5_5 = true
                                    L1_5(L2_5, L3_5, L4_5, L5_5)
                                    L1_5 = HasAuth
                                    L2_5 = L2_4
                                    L1_5 = L1_5(L2_5)
                                    if L1_5 then
                                      L1_5 = Entity
                                      L2_5 = L2_4
                                      L1_5 = L1_5(L2_5)
                                      L1_5 = L1_5.state
                                      L1_5 = L1_5.LockBusy
                                      if not L1_5 then
                                        L1_5 = TriggerServerEvent
                                        L2_5 = "MK_VehicleKeys:Server:ToggleLocks"
                                        L3_5 = NetworkGetNetworkIdFromEntity
                                        L4_5 = L2_4
                                        L3_5 = L3_5(L4_5)
                                        L4_5 = L2_4
                                        L1_5(L2_5, L3_5, L4_5)
                                      end
                                    end
                                  end
                                end
                              end
                              L12_4 = utils
                              L13_4 = L12_4
                              L12_4 = L12_4.removeTrailSpaces
                              L14_4 = GetVehicleNumberPlateText
                              L15_4 = L2_4
                              L14_4, L15_4 = L14_4(L15_4)
                              L12_4 = L12_4(L13_4, L14_4, L15_4)
                              L13_4 = NetworkGetNetworkIdFromEntity
                              L14_4 = L2_4
                              L13_4, L14_4, L15_4 = L13_4(L14_4)
                              L8_4(L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4)
                            end
                          end
                        end
                      else
                        L7_4 = HasAuth
                        L8_4 = L2_4
                        L7_4 = L7_4(L8_4)
                        if not L7_4 then
                          L7_4 = Wait
                          L8_4 = 250
                          L7_4(L8_4)
                          L7_4 = lib
                          L7_4 = L7_4.callback
                          L8_4 = "MK_VehicleKeys:Server:CheckOwnership"
                          L9_4 = false
                          function L10_4(A0_5, A1_5)
                            local L2_5, L3_5, L4_5, L5_5, L6_5
                            if A0_5 and A1_5 then
                              L2_5 = LocalPlayer
                              L2_5 = L2_5.state
                              L2_5 = L2_5.mk_identifier
                              if A1_5 == L2_5 then
                                L2_5 = TriggerServerEvent
                                L3_5 = "MK_VehicleKeys:Server:AddKey"
                                L4_5 = NetworkGetNetworkIdFromEntity
                                L5_5 = L2_4
                                L4_5 = L4_5(L5_5)
                                L5_5 = false
                                L6_5 = false
                                L2_5(L3_5, L4_5, L5_5, L6_5)
                                L2_5 = Wait
                                L3_5 = 300
                                L2_5(L3_5)
                                L2_5 = Entity
                                L3_5 = L2_4
                                L2_5 = L2_5(L3_5)
                                L2_5 = L2_5.state
                                L2_5 = L2_5.LockBusy
                                if not L2_5 then
                                  L2_5 = TriggerServerEvent
                                  L3_5 = "MK_VehicleKeys:Server:ToggleLocks"
                                  L4_5 = NetworkGetNetworkIdFromEntity
                                  L5_5 = L2_4
                                  L4_5 = L4_5(L5_5)
                                  L5_5 = L2_4
                                  L2_5(L3_5, L4_5, L5_5)
                                end
                                L2_5 = GetPedInVehicleSeat
                                L3_5 = L2_4
                                L4_5 = -1
                                L2_5 = L2_5(L3_5, L4_5)
                                L3_5 = PlayerPedId
                                L3_5 = L3_5()
                                if L2_5 == L3_5 then
                                  L2_5 = GetIsVehicleEngineRunning
                                  L3_5 = L2_4
                                  L2_5 = L2_5(L3_5)
                                  if not L2_5 then
                                    L2_5 = Config
                                    L2_5 = L2_5.DisableAutoStartEngine
                                    if L2_5 then
                                      L2_5 = SetVehicleEngineOn
                                      L3_5 = L2_4
                                      L4_5 = false
                                      L5_5 = true
                                      L6_5 = true
                                      L2_5(L3_5, L4_5, L5_5, L6_5)
                                    else
                                      L2_5 = SetVehicleEngineOn
                                      L3_5 = L2_4
                                      L4_5 = true
                                      L5_5 = false
                                      L6_5 = Config
                                      L6_5 = L6_5.DisableAutoStartEngine
                                      if L6_5 then
                                        L6_5 = true
                                        if L6_5 then
                                          goto lbl_71
                                        end
                                      end
                                      L6_5 = false
                                      ::lbl_71::
                                      L2_5(L3_5, L4_5, L5_5, L6_5)
                                    end
                                  end
                                end
                              end
                            end
                          end
                          L11_4 = utils
                          L12_4 = L11_4
                          L11_4 = L11_4.removeTrailSpaces
                          L13_4 = GetVehicleNumberPlateText
                          L14_4 = L2_4
                          L13_4, L14_4, L15_4 = L13_4(L14_4)
                          L11_4, L12_4, L13_4, L14_4, L15_4 = L11_4(L12_4, L13_4, L14_4, L15_4)
                          L7_4(L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4)
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      L1_3(L2_3, L3_3)
      L1_3 = RegisterCommand
      L2_3 = "mktogglevehicleengine"
      function L3_3()
        local L0_4, L1_4
        L0_4 = Config
        L0_4 = L0_4.Binds
        L0_4 = L0_4.EngineToggle
        L0_4 = L0_4.Enable
        if L0_4 then
          L0_4 = IsPauseMenuActive
          L0_4 = L0_4()
          if not L0_4 then
            L0_4 = TriggerEvent
            L1_4 = "MK_VehicleKeys:Client:ToggleEngine"
            L0_4(L1_4)
          end
        end
      end
      L1_3(L2_3, L3_3)
      L1_3 = TriggerEvent
      L2_3 = "chat:removeSuggestion"
      L3_3 = "mktogglevehiclelocks"
      L1_3(L2_3, L3_3)
      L1_3 = TriggerEvent
      L2_3 = "chat:removeSuggestion"
      L3_3 = "mktogglevehicleengine"
      L1_3(L2_3, L3_3)
      L1_3 = TriggerEvent
      L2_3 = "chat:removeSuggestion"
      L3_3 = "mkhotwireattempt"
      L1_3(L2_3, L3_3)
      L1_3 = TriggerEvent
      L2_3 = "chat:removeSuggestion"
      L3_3 = "mkexitvehicle"
      L1_3(L2_3, L3_3)
      L1_3 = Config
      L1_3 = L1_3.KeysAsItem
      L1_3 = L1_3.PlayerOwned
      L1_3 = L1_3.Enabled
      if L1_3 then
        L1_3 = GetResourceState
        L2_3 = "ox_inventory"
        L1_3 = L1_3(L2_3)
        if "started" == L1_3 then
          L1_3 = exports
          L1_3 = L1_3.ox_inventory
          L2_3 = L1_3
          L1_3 = L1_3.displayMetadata
          L3_3 = {}
          L4_3 = locale
          L5_3 = "ox_meta_name"
          L4_3 = L4_3(L5_3)
          L3_3.name = L4_3
          L4_3 = locale
          L5_3 = "ox_meta_id"
          L4_3 = L4_3(L5_3)
          L3_3.id = L4_3
          L4_3 = locale
          L5_3 = "ox_meta_plate"
          L4_3 = L4_3(L5_3)
          L3_3.plate = L4_3
          L1_3(L2_3, L3_3)
        end
      end
      L1_3 = {}
      L2_3 = {}
      L3_3 = locale
      L4_3 = "bind_lock_label"
      L3_3 = L3_3(L4_3)
      L2_3.l = L3_3
      L3_3 = Config
      L3_3 = L3_3.Binds
      L3_3 = L3_3.ToggleLocks
      L3_3 = L3_3.DefaultBind
      if L3_3 then
        L3_3 = Config
        L3_3 = L3_3.Binds
        L3_3 = L3_3.ToggleLocks
        L3_3 = L3_3.DefaultBind
        if L3_3 then
          goto lbl_134
        end
      end
      L3_3 = "l"
      ::lbl_134::
      L2_3.b = L3_3
      L2_3.c = "mktogglevehiclelocks"
      L3_3 = Config
      L3_3 = L3_3.Binds
      L3_3 = L3_3.ToggleLocks
      L3_3 = L3_3.BindType
      if L3_3 then
        L3_3 = Config
        L3_3 = L3_3.Binds
        L3_3 = L3_3.ToggleLocks
        L3_3 = L3_3.BindType
        if L3_3 then
          goto lbl_149
        end
      end
      L3_3 = "keyboard"
      ::lbl_149::
      L2_3.t = L3_3
      L1_3[1] = L2_3
      L2_3 = {}
      L3_3 = locale
      L4_3 = "bind_engine_label"
      L3_3 = L3_3(L4_3)
      L2_3.l = L3_3
      L3_3 = Config
      L3_3 = L3_3.Binds
      L3_3 = L3_3.EngineToggle
      L3_3 = L3_3.DefaultBind
      if L3_3 then
        L3_3 = Config
        L3_3 = L3_3.Binds
        L3_3 = L3_3.EngineToggle
        L3_3 = L3_3.DefaultBind
        if L3_3 then
          goto lbl_170
        end
      end
      L3_3 = "IOM_WHEEL_UP"
      ::lbl_170::
      L2_3.b = L3_3
      L2_3.c = "mktogglevehicleengine"
      L3_3 = Config
      L3_3 = L3_3.Binds
      L3_3 = L3_3.EngineToggle
      L3_3 = L3_3.BindType
      if L3_3 then
        L3_3 = Config
        L3_3 = L3_3.Binds
        L3_3 = L3_3.EngineToggle
        L3_3 = L3_3.BindType
        if L3_3 then
          goto lbl_185
        end
      end
      L3_3 = "MOUSE_WHEEL"
      ::lbl_185::
      L2_3.t = L3_3
      L1_3[2] = L2_3
      Binds = L1_3
      L1_3 = RegisterKeyMapping
      L2_3 = Binds
      L2_3 = L2_3[1]
      L2_3 = L2_3.c
      L3_3 = Binds
      L3_3 = L3_3[1]
      L3_3 = L3_3.l
      L4_3 = Binds
      L4_3 = L4_3[1]
      L4_3 = L4_3.t
      L5_3 = Binds
      L5_3 = L5_3[1]
      L5_3 = L5_3.b
      L1_3(L2_3, L3_3, L4_3, L5_3)
      L1_3 = Config
      L1_3 = L1_3.Binds
      L1_3 = L1_3.EngineToggle
      L1_3 = L1_3.Enable
      if L1_3 then
        L1_3 = RegisterKeyMapping
        L2_3 = Binds
        L2_3 = L2_3[2]
        L2_3 = L2_3.c
        L3_3 = Binds
        L3_3 = L3_3[2]
        L3_3 = L3_3.l
        L4_3 = Binds
        L4_3 = L4_3[2]
        L4_3 = L4_3.t
        L5_3 = Binds
        L5_3 = L5_3[2]
        L5_3 = L5_3.b
        L1_3(L2_3, L3_3, L4_3, L5_3)
      end
      L1_3 = EnableScript
      L1_3()
      L1_3 = LocalPlayer
      L1_3 = L1_3.state
      L1_3 = L1_3.mk_isLoggedIn
      if L1_3 then
        L1_3 = Wait
        L2_3 = 500
        L1_3(L2_3)
        L1_3 = GetGamePool
        L2_3 = "CPed"
        L1_3 = L1_3(L2_3)
        L2_3 = 1
        L3_3 = #L1_3
        L4_3 = 1
        for L5_3 = L2_3, L3_3, L4_3 do
          L6_3 = Entity
          L7_3 = L1_3[L5_3]
          L6_3 = L6_3(L7_3)
          L6_3 = L6_3.state
          L6_3 = L6_3.MK_VehicleKeysPed
          if L6_3 then
            L6_3 = DeletePed
            L7_3 = L1_3[L5_3]
            L6_3(L7_3)
          end
        end
        L2_3 = logoutEvent
        L3_3 = true
        L2_3(L3_3)
      end
      L1_3 = AddStateBagChangeHandler
      L2_3 = "mk_isLoggedIn"
      L3_3 = "player:"
      L4_3 = cache
      L4_3 = L4_3.serverId
      L3_3 = L3_3 .. L4_3
      function L4_3(A0_4, A1_4, A2_4, A3_4, A4_4)
        local L5_4
        if A2_4 then
          L5_4 = loginEvent
          L5_4()
        else
          L5_4 = logoutEvent
          L5_4()
        end
      end
      L1_3(L2_3, L3_3, L4_3)
      L1_3 = AddStateBagChangeHandler
      L2_3 = "mk_disabledAutoStart"
      L3_3 = nil
      function L4_3(A0_4, A1_4, A2_4, A3_4, A4_4)
        local L5_4, L6_4, L7_4, L8_4, L9_4, L10_4
        if A2_4 then
          L5_4 = GetEntityFromStateBagName
          L6_4 = A0_4
          L5_4 = L5_4(L6_4)
          if L5_4 then
            goto lbl_9
          end
        end
        do return end
        ::lbl_9::
        L5_4 = GetEntityFromStateBagName
        L6_4 = A0_4
        L5_4 = L5_4(L6_4)
        if L5_4 then
          L6_4 = DoesEntityExist
          L7_4 = L5_4
          L6_4 = L6_4(L7_4)
          if L6_4 then
            L6_4 = NetworkGetEntityIsNetworked
            L7_4 = L5_4
            L6_4 = L6_4(L7_4)
            if L6_4 then
              L6_4 = NetworkGetEntityOwner
              L7_4 = L5_4
              L6_4 = L6_4(L7_4)
              L7_4 = cache
              L7_4 = L7_4.playerId
              if L6_4 == L7_4 then
                L6_4 = SetVehicleEngineOn
                L7_4 = L5_4
                L8_4 = GetIsVehicleEngineRunning
                L9_4 = A2_4
                L8_4 = L8_4(L9_4)
                L9_4 = true
                L10_4 = true
                L6_4(L7_4, L8_4, L9_4, L10_4)
              end
            end
          end
        end
      end
      L1_3(L2_3, L3_3, L4_3)
      L1_3 = utils
      L1_3 = L1_3.logger
      L2_3 = L1_3
      L1_3 = L1_3.info
      L3_3 = "VehicleKeys"
      L4_3 = "[^5CLIENT FRAMEWORK LOADED^7] [^5"
      L5_3 = framework
      L5_3 = L5_3.name
      L6_3 = "^7]"
      L4_3 = L4_3 .. L5_3 .. L6_3
      L5_3 = {}
      L5_3.console = true
      L1_3(L2_3, L3_3, L4_3, L5_3)
    end
  end
  L0_2(L1_2)
  L0_2 = exports
  L0_2 = L0_2.mk_utils
  L1_2 = L0_2
  L0_2 = L0_2.fetch
  L2_2 = "utils"
  L0_2 = L0_2(L1_2, L2_2)
  utils = L0_2
  L0_2 = exports
  L0_2 = L0_2.mk_utils
  L1_2 = L0_2
  L0_2 = L0_2.fetch
  L2_2 = "framework"
  L0_2 = L0_2(L1_2, L2_2)
  framework = L0_2
  L0_2 = exports
  L0_2 = L0_2.mk_utils
  L1_2 = L0_2
  L0_2 = L0_2.fetch
  L2_2 = "vehicles"
  L0_2 = L0_2(L1_2, L2_2)
  vehicles = L0_2
  L0_2 = exports
  L0_2 = L0_2.mk_utils
  L1_2 = L0_2
  L0_2 = L0_2.fetch
  L2_2 = "inventory"
  L0_2 = L0_2(L1_2, L2_2)
  inventory = L0_2
  L0_2 = Config
  L0_2 = L0_2.KeysAsItem
  L0_2 = L0_2.PlayerOwned
  L0_2 = L0_2.Enabled
  if L0_2 then
    L0_2 = Config
    L0_2 = L0_2.KeysAsItem
    L0_2 = L0_2.UseTarget
    if L0_2 then
      L0_2 = exports
      L0_2 = L0_2.mk_utils
      L1_2 = L0_2
      L0_2 = L0_2.fetch
      L2_2 = "target"
      L0_2 = L0_2(L1_2, L2_2)
      target = L0_2
    end
  end
  L0_2 = utils
  if L0_2 then
    L0_2 = framework
    if L0_2 then
      L0_2 = vehicles
      if L0_2 then
        L0_2 = inventory
        if L0_2 then
          L0_2 = Config
          L0_2 = L0_2.KeysAsItem
          L0_2 = L0_2.PlayerOwned
          L0_2 = L0_2.Enabled
          if L0_2 then
            L0_2 = Config
            L0_2 = L0_2.KeysAsItem
            L0_2 = L0_2.UseTarget
            if L0_2 then
              L0_2 = target
              if L0_2 then
                frameworkLoaded = true
              end
          end
          else
            frameworkLoaded = true
          end
        end
      end
    end
  end
  finishedLoading = true
end
LoadFramework = L0_1
function L0_1()
  local L0_2, L1_2, L2_2
  L0_2 = lib
  L0_2 = L0_2.onCache
  L1_2 = "weapon"
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3
    if A0_3 then
      L1_3 = IsPedArmed
      L2_3 = PlayerPedId
      L2_3 = L2_3()
      L3_3 = 4
      L1_3 = L1_3(L2_3, L3_3)
      if L1_3 then
        L1_3 = Config
        L1_3 = L1_3.NpcVehicles
        L1_3 = L1_3.Carjacking
        L1_3 = L1_3.Enabled
        if L1_3 then
          Armed = true
          L1_3 = WeaponLoop
          L1_3()
        end
      end
    else
      L1_3 = Armed
      if L1_3 then
        Armed = false
      end
    end
  end
  L0_2(L1_2, L2_2)
  L0_2 = lib
  L0_2 = L0_2.onCache
  L1_2 = "enteringVehicle"
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    if A0_3 then
      L1_3 = IsVehicleSeatFree
      L2_3 = A0_3
      L3_3 = -1
      L1_3 = L1_3(L2_3, L3_3)
      if L1_3 then
        L1_3 = GetSeatPedIsTryingToEnter
        L2_3 = cache
        L2_3 = L2_3.playerId
        L1_3 = L1_3(L2_3)
        if -1 == L1_3 then
          L1_3 = SetVehicleEngineOn
          L2_3 = A0_3
          L3_3 = GetIsVehicleEngineRunning
          L4_3 = A0_3
          L3_3 = L3_3(L4_3)
          L4_3 = true
          L5_3 = Config
          L5_3 = L5_3.DisableAutoStartEngine
          if L5_3 then
            L5_3 = true
            if L5_3 then
              goto lbl_29
            end
          end
          L5_3 = false
          ::lbl_29::
          L1_3(L2_3, L3_3, L4_3, L5_3)
        end
      end
    end
  end
  L0_2(L1_2, L2_2)
  L0_2 = lib
  L0_2 = L0_2.onCache
  L1_2 = "seat"
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3
    if A0_3 then
      if -1 == A0_3 then
        L1_3 = cache
        L1_3 = L1_3.vehicle
        if not L1_3 then
          goto lbl_380
        end
        L1_3 = SetVehicleEngineOn
        L2_3 = cache
        L2_3 = L2_3.vehicle
        L3_3 = GetIsVehicleEngineRunning
        L4_3 = cache
        L4_3 = L4_3.vehicle
        L3_3 = L3_3(L4_3)
        L4_3 = true
        L5_3 = true
        L1_3(L2_3, L3_3, L4_3, L5_3)
        L1_3 = false
        L2_3 = Config
        L2_3 = L2_3.CheckRestrictions
        if L2_3 then
          L2_3 = promise
          L2_3 = L2_3.new
          L2_3 = L2_3()
          L4_3 = L2_3
          L3_3 = L2_3.resolve
          L5_3 = framework
          L6_3 = L5_3
          L5_3 = L5_3.isRestricted
          L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3 = L5_3(L6_3)
          L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
          L3_3 = Citizen
          L3_3 = L3_3.Await
          L4_3 = L2_3
          L3_3(L4_3)
          if L2_3 then
            L1_3 = L2_3.value
          end
        end
        if L1_3 then
          goto lbl_380
        end
        L2_3 = HasAuth
        L3_3 = cache
        L3_3 = L3_3.vehicle
        L2_3 = L2_3(L3_3)
        if not L2_3 then
          L2_3 = 0
          L3_3 = 0
          L4_3 = GetVehicleClass
          L5_3 = cache
          L5_3 = L5_3.vehicle
          L4_3 = L4_3(L5_3)
          L5_3 = NetworkGetEntityIsNetworked
          L6_3 = cache
          L6_3 = L6_3.vehicle
          L5_3 = L5_3(L6_3)
          if L5_3 then
            L5_3 = NetworkGetNetworkIdFromEntity
            L6_3 = cache
            L6_3 = L6_3.vehicle
            L5_3 = L5_3(L6_3)
            L3_3 = L5_3
          end
          while true do
            L5_3 = cache
            L5_3 = L5_3.vehicle
            if not (L5_3 and L2_3 < 50) or L3_3 > 0 then
              break
            end
            L5_3 = NetworkGetEntityIsNetworked
            L6_3 = cache
            L6_3 = L6_3.vehicle
            L5_3 = L5_3(L6_3)
            if L5_3 then
              L5_3 = NetworkGetNetworkIdFromEntity
              L6_3 = cache
              L6_3 = L6_3.vehicle
              L5_3 = L5_3(L6_3)
              L3_3 = L5_3
            end
            L5_3 = Wait
            L6_3 = 100
            L5_3(L6_3)
            L2_3 = L2_3 + 1
          end
          L5_3 = cache
          L5_3 = L5_3.vehicle
          if not L5_3 then
            return
          end
          if L3_3 > 0 then
            L5_3 = IsThisModelABicycle
            L6_3 = GetEntityModel
            L7_3 = cache
            L7_3 = L7_3.vehicle
            L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3 = L6_3(L7_3)
            L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
            if not L5_3 then
              L5_3 = IsWhitelisted
              L6_3 = GetEntityModel
              L7_3 = cache
              L7_3 = L7_3.vehicle
              L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3 = L6_3(L7_3)
              L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
              if not L5_3 then
                goto lbl_159
              end
            end
            L5_3 = cache
            L5_3 = L5_3.vehicle
            if not L5_3 then
              return
            end
            L5_3 = GetPedInVehicleSeat
            L6_3 = cache
            L6_3 = L6_3.vehicle
            L7_3 = -1
            L5_3 = L5_3(L6_3, L7_3)
            L6_3 = cache
            L6_3 = L6_3.ped
            if L5_3 == L6_3 then
              L5_3 = GetIsVehicleEngineRunning
              L6_3 = cache
              L6_3 = L6_3.vehicle
              L5_3 = L5_3(L6_3)
              if not L5_3 then
                L5_3 = Config
                L5_3 = L5_3.DisableAutoStartEngine
                if L5_3 then
                  L5_3 = SetVehicleEngineOn
                  L6_3 = cache
                  L6_3 = L6_3.vehicle
                  L7_3 = false
                  L8_3 = true
                  L9_3 = true
                  L5_3(L6_3, L7_3, L8_3, L9_3)
                else
                  L5_3 = SetVehicleEngineOn
                  L6_3 = cache
                  L6_3 = L6_3.vehicle
                  L7_3 = true
                  L8_3 = false
                  L9_3 = Config
                  L9_3 = L9_3.DisableAutoStartEngine
                  if L9_3 then
                    L9_3 = true
                    if L9_3 then
                      goto lbl_157
                    end
                  end
                  L9_3 = false
                  ::lbl_157::
                  L5_3(L6_3, L7_3, L8_3, L9_3)
                  goto lbl_278
                  ::lbl_159::
                  L5_3 = HasAuth
                  L6_3 = cache
                  L6_3 = L6_3.vehicle
                  L5_3 = L5_3(L6_3)
                  if not L5_3 then
                    L5_3 = nil
                    L6_3 = promise
                    L6_3 = L6_3.new
                    L6_3 = L6_3()
                    L7_3 = IsJobWhitelisted
                    L8_3 = GetEntityModel
                    L9_3 = cache
                    L9_3 = L9_3.vehicle
                    L8_3 = L8_3(L9_3)
                    function L9_3(A0_4)
                      local L1_4, L2_4, L3_4
                      L1_4 = L6_3
                      L2_4 = L1_4
                      L1_4 = L1_4.resolve
                      L3_4 = A0_4
                      L1_4(L2_4, L3_4)
                    end
                    L7_3(L8_3, L9_3)
                    L7_3 = Citizen
                    L7_3 = L7_3.Await
                    L8_3 = L6_3
                    L7_3(L8_3)
                    if L6_3 then
                      L5_3 = L6_3.value
                    end
                    if L5_3 then
                      L7_3 = HasAuth
                      L8_3 = cache
                      L8_3 = L8_3.vehicle
                      L7_3 = L7_3(L8_3)
                      if not L7_3 then
                        L7_3 = Wait
                        L8_3 = 250
                        L7_3(L8_3)
                        L7_3 = lib
                        L7_3 = L7_3.callback
                        L8_3 = "MK_VehicleKeys:Server:CheckOwnership"
                        L9_3 = false
                        function L10_3(A0_4)
                          local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4
                          L1_4 = framework
                          L2_4 = L1_4
                          L1_4 = L1_4.getJob
                          L1_4, L2_4 = L1_4(L2_4)
                          L3_4 = Entity
                          L4_4 = cache
                          L4_4 = L4_4.vehicle
                          L3_4 = L3_4(L4_4)
                          L3_4 = L3_4.state
                          L3_4 = L3_4.mk_jobVehicle
                          if L3_4 and L1_4 then
                            L3_4 = Entity
                            L4_4 = cache
                            L4_4 = L4_4.vehicle
                            L3_4 = L3_4(L4_4)
                            L3_4 = L3_4.state
                            L3_4 = L3_4.mk_jobVehicle
                            if L3_4 ~= L1_4 then
                              L3_4 = RunVehicleThread
                              L3_4()
                              L3_4 = utils
                              L4_4 = L3_4
                              L3_4 = L3_4.notify
                              L5_4 = locale
                              L6_4 = "job_vehicle_wrong_job"
                              L5_4 = L5_4(L6_4)
                              L6_4 = "error"
                              L7_4 = 5000
                              return L3_4(L4_4, L5_4, L6_4, L7_4)
                            end
                          end
                          if A0_4 then
                            if A0_4 then
                              L3_4 = Config
                              L3_4 = L3_4.KeysAsItem
                              L3_4 = L3_4.PlayerOwned
                              L3_4 = L3_4.Enabled
                              if not L3_4 then
                                goto lbl_57
                              end
                            end
                            if not A0_4 then
                              goto lbl_121
                            end
                            L3_4 = Config
                            L3_4 = L3_4.KeysAsItem
                            L3_4 = L3_4.PlayerOwned
                            L3_4 = L3_4.Enabled
                            if not L3_4 then
                              goto lbl_121
                            end
                            L3_4 = Config
                            L3_4 = L3_4.KeysAsItem
                            L3_4 = L3_4.PlayerOwned
                            L3_4 = L3_4.GiveWhitelistJobKeys
                            if not L3_4 then
                              goto lbl_121
                            end
                          end
                          ::lbl_57::
                          L3_4 = TriggerServerEvent
                          L4_4 = "MK_VehicleKeys:Server:AddKey"
                          L5_4 = L3_3
                          L6_4 = false
                          L7_4 = false
                          L8_4 = false
                          L9_4 = false
                          L10_4 = false
                          L11_4 = L1_4 or L11_4
                          if not L1_4 or not L1_4 then
                            L11_4 = false
                          end
                          L3_4(L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4)
                          L3_4 = Wait
                          L4_4 = 300
                          L3_4(L4_4)
                          L3_4 = cache
                          L3_4 = L3_4.vehicle
                          if not L3_4 then
                            return
                          end
                          L3_4 = GetPedInVehicleSeat
                          L4_4 = cache
                          L4_4 = L4_4.vehicle
                          L5_4 = -1
                          L3_4 = L3_4(L4_4, L5_4)
                          L4_4 = PlayerPedId
                          L4_4 = L4_4()
                          if L3_4 == L4_4 then
                            L3_4 = GetIsVehicleEngineRunning
                            L4_4 = cache
                            L4_4 = L4_4.vehicle
                            L3_4 = L3_4(L4_4)
                            if not L3_4 then
                              L3_4 = Config
                              L3_4 = L3_4.DisableAutoStartEngine
                              if L3_4 then
                                L3_4 = SetVehicleEngineOn
                                L4_4 = cache
                                L4_4 = L4_4.vehicle
                                L5_4 = false
                                L6_4 = true
                                L7_4 = true
                                L3_4(L4_4, L5_4, L6_4, L7_4)
                              else
                                L3_4 = SetVehicleEngineOn
                                L4_4 = cache
                                L4_4 = L4_4.vehicle
                                L5_4 = true
                                L6_4 = false
                                L7_4 = Config
                                L7_4 = L7_4.DisableAutoStartEngine
                                if L7_4 then
                                  L7_4 = true
                                  if L7_4 then
                                    goto lbl_119
                                  end
                                end
                                L7_4 = false
                                ::lbl_119::
                                L3_4(L4_4, L5_4, L6_4, L7_4)
                                goto lbl_123
                                ::lbl_121::
                                L3_4 = RunVehicleThread
                                L3_4()
                              end
                            end
                          end
                          ::lbl_123::
                        end
                        L11_3 = utils
                        L12_3 = L11_3
                        L11_3 = L11_3.removeTrailSpaces
                        L13_3 = GetVehicleNumberPlateText
                        L14_3 = cache
                        L14_3 = L14_3.vehicle
                        L13_3, L14_3, L15_3, L16_3 = L13_3(L14_3)
                        L11_3, L12_3, L13_3, L14_3, L15_3, L16_3 = L11_3(L12_3, L13_3, L14_3, L15_3, L16_3)
                        L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
                      end
                    elseif 15 == L4_3 or 16 == L4_3 then
                      L7_3 = HasFlyingAuth
                      L8_3 = cache
                      L8_3 = L8_3.vehicle
                      L7_3(L8_3)
                      L7_3 = Wait
                      L8_3 = 100
                      L7_3(L8_3)
                      L7_3 = HasAuth
                      L8_3 = cache
                      L8_3 = L8_3.vehicle
                      L7_3 = L7_3(L8_3)
                      if not L7_3 then
                        L7_3 = RunVehicleThread
                        L7_3()
                      end
                    else
                      L7_3 = RunVehicleThread
                      L7_3()
                    end
                  else
                    L5_3 = Entity
                    L6_3 = cache
                    L6_3 = L6_3.vehicle
                    L5_3 = L5_3(L6_3)
                    L5_3 = L5_3.state
                    L5_3 = L5_3.MKOLDFOB
                    if L5_3 then
                      L5_3 = false
                      L6_3 = pairs
                      L7_3 = Entity
                      L8_3 = cache
                      L8_3 = L8_3.vehicle
                      L7_3 = L7_3(L8_3)
                      L7_3 = L7_3.state
                      L7_3 = L7_3.MKOLDFOB
                      L6_3, L7_3, L8_3, L9_3 = L6_3(L7_3)
                      for L10_3, L11_3 in L6_3, L7_3, L8_3, L9_3 do
                        L12_3 = inventory
                        L13_3 = L12_3
                        L12_3 = L12_3.hasItem
                        L14_3 = Config
                        L14_3 = L14_3.KeysAsItem
                        L14_3 = L14_3.PlayerOwned
                        L14_3 = L14_3.ItemName
                        L15_3 = {}
                        L15_3.id = L11_3
                        L16_3 = true
                        L12_3 = L12_3(L13_3, L14_3, L15_3, L16_3)
                        if L12_3 then
                          L5_3 = true
                          break
                        end
                      end
                      if L5_3 then
                        L6_3 = utils
                        L7_3 = L6_3
                        L6_3 = L6_3.notify
                        L8_3 = locale
                        L9_3 = "old_fob"
                        L8_3 = L8_3(L9_3)
                        L9_3 = "error"
                        L10_3 = 5000
                        L6_3(L7_3, L8_3, L9_3, L10_3)
                      end
                    end
                  end
                end
              end
            end
          end
          ::lbl_278::
        else
          L2_3 = GetIsVehicleEngineRunning
          L3_3 = cache
          L3_3 = L3_3.vehicle
          L2_3 = L2_3(L3_3)
          if not L2_3 then
            L2_3 = Config
            L2_3 = L2_3.DisableAutoStartEngine
            if L2_3 then
              L2_3 = SetVehicleEngineOn
              L3_3 = cache
              L3_3 = L3_3.vehicle
              L4_3 = false
              L5_3 = true
              L6_3 = true
              L2_3(L3_3, L4_3, L5_3, L6_3)
            else
              L2_3 = SetVehicleEngineOn
              L3_3 = cache
              L3_3 = L3_3.vehicle
              L4_3 = true
              L5_3 = false
              L6_3 = Config
              L6_3 = L6_3.DisableAutoStartEngine
              if L6_3 then
                L6_3 = true
                if L6_3 then
                  goto lbl_311
                end
              end
              L6_3 = false
              ::lbl_311::
              L2_3(L3_3, L4_3, L5_3, L6_3)
            end
          end
          L2_3 = Entity
          L3_3 = cache
          L3_3 = L3_3.vehicle
          L2_3 = L2_3(L3_3)
          L2_3 = L2_3.state
          L2_3 = L2_3.MKOLDFOB
          if L2_3 then
            L2_3 = false
            L3_3 = pairs
            L4_3 = Entity
            L5_3 = cache
            L5_3 = L5_3.vehicle
            L4_3 = L4_3(L5_3)
            L4_3 = L4_3.state
            L4_3 = L4_3.MKOLDFOB
            L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
            for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
              L9_3 = inventory
              L10_3 = L9_3
              L9_3 = L9_3.hasItem
              L11_3 = Config
              L11_3 = L11_3.KeysAsItem
              L11_3 = L11_3.PlayerOwned
              L11_3 = L11_3.ItemName
              L12_3 = {}
              L12_3.id = L8_3
              L13_3 = true
              L9_3 = L9_3(L10_3, L11_3, L12_3, L13_3)
              if L9_3 then
                L2_3 = true
                break
              end
            end
            if L2_3 then
              L3_3 = utils
              L4_3 = L3_3
              L3_3 = L3_3.notify
              L5_3 = locale
              L6_3 = "old_fob"
              L5_3 = L5_3(L6_3)
              L6_3 = "error"
              L7_3 = 5000
              L3_3(L4_3, L5_3, L6_3, L7_3)
            end
          end
          L2_3 = SetVehicleKeepEngineOnWhenAbandoned
          L3_3 = cache
          L3_3 = L3_3.vehicle
          L4_3 = Config
          L4_3 = L4_3.LeaveEngineRunning
          if L4_3 then
            L4_3 = true
            if L4_3 then
              goto lbl_369
            end
          end
          L4_3 = false
          ::lbl_369::
          L2_3(L3_3, L4_3)
        end
      else
        L1_3 = Config
        L1_3 = L1_3.NoShuffle
        if L1_3 and 0 == A0_3 then
          L1_3 = RunNoShuffleThread
          L1_3()
        else
        end
      end
    end
    ::lbl_380::
  end
  L0_2(L1_2, L2_2)
end
EnableScript = L0_1
L0_1 = RegisterNetEvent
L1_1 = "MK_VehicleKeys:Client:ToggleLocks"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A2_2 then
    L3_2 = RequestAnimDict
    L4_2 = "anim@mp_player_intmenu@key_fob@"
    L3_2(L4_2)
    while true do
      L3_2 = HasAnimDictLoaded
      L4_2 = "anim@mp_player_intmenu@key_fob@"
      L3_2 = L3_2(L4_2)
      if L3_2 then
        break
      end
      L3_2 = RequestAnimDict
      L4_2 = "anim@mp_player_intmenu@key_fob@"
      L3_2(L4_2)
      L3_2 = Wait
      L4_2 = 100
      L3_2(L4_2)
    end
    L3_2 = TaskPlayAnim
    L4_2 = PlayerPedId
    L4_2 = L4_2()
    L5_2 = "anim@mp_player_intmenu@key_fob@"
    L6_2 = "fob_click"
    L7_2 = 3.0
    L8_2 = 3.0
    L9_2 = -1
    L10_2 = 49
    L11_2 = 0
    L12_2 = false
    L13_2 = false
    L14_2 = false
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  L3_2 = A1_2
  if "Lock" == A0_2 then
    L4_2 = Wait
    L5_2 = 750
    L4_2(L5_2)
    L4_2 = ClearPedTasks
    L5_2 = PlayerPedId
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2()
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L4_2 = Config
    L4_2 = L4_2.VehicleDoorlockSounds
    if L4_2 then
      L4_2 = utils
      L5_2 = L4_2
      L4_2 = L4_2.playSoundDistance
      L6_2 = "lock"
      L7_2 = 0.3
      L8_2 = 5
      L4_2(L5_2, L6_2, L7_2, L8_2)
    end
    L4_2 = utils
    L5_2 = L4_2
    L4_2 = L4_2.notify
    L6_2 = locale
    L7_2 = "veh_locked"
    L6_2 = L6_2(L7_2)
    L7_2 = "primary"
    L8_2 = 5000
    L4_2(L5_2, L6_2, L7_2, L8_2)
  elseif "Unlock" == A0_2 then
    L4_2 = Wait
    L5_2 = 750
    L4_2(L5_2)
    L4_2 = ClearPedTasks
    L5_2 = PlayerPedId
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2()
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L4_2 = Config
    L4_2 = L4_2.VehicleDoorlockSounds
    if L4_2 then
      L4_2 = utils
      L5_2 = L4_2
      L4_2 = L4_2.playSoundDistance
      L6_2 = "unlock"
      L7_2 = 0.3
      L8_2 = 5
      L4_2(L5_2, L6_2, L7_2, L8_2)
    end
    L4_2 = utils
    L5_2 = L4_2
    L4_2 = L4_2.notify
    L6_2 = locale
    L7_2 = "veh_unlocked"
    L6_2 = L6_2(L7_2)
    L7_2 = "primary"
    L8_2 = 5000
    L4_2(L5_2, L6_2, L7_2, L8_2)
  end
  L4_2 = IsPedInAnyVehicle
  L5_2 = PlayerPedId
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2()
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  if not L4_2 then
    L4_2 = SetVehicleInteriorlight
    L5_2 = L3_2
    L6_2 = true
    L4_2(L5_2, L6_2)
    L4_2 = SetVehicleIndicatorLights
    L5_2 = L3_2
    L6_2 = 0
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = SetVehicleIndicatorLights
    L5_2 = L3_2
    L6_2 = 1
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = Wait
    L5_2 = 450
    L4_2(L5_2)
    L4_2 = SetVehicleIndicatorLights
    L5_2 = L3_2
    L6_2 = 0
    L7_2 = false
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = SetVehicleIndicatorLights
    L5_2 = L3_2
    L6_2 = 1
    L7_2 = false
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = Wait
    L5_2 = 450
    L4_2(L5_2)
    L4_2 = SetVehicleInteriorlight
    L5_2 = L3_2
    L6_2 = true
    L4_2(L5_2, L6_2)
    L4_2 = SetVehicleIndicatorLights
    L5_2 = L3_2
    L6_2 = 0
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = SetVehicleIndicatorLights
    L5_2 = L3_2
    L6_2 = 1
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = Wait
    L5_2 = 450
    L4_2(L5_2)
    L4_2 = SetVehicleInteriorlight
    L5_2 = L3_2
    L6_2 = false
    L4_2(L5_2, L6_2)
    L4_2 = SetVehicleIndicatorLights
    L5_2 = L3_2
    L6_2 = 0
    L7_2 = false
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = SetVehicleIndicatorLights
    L5_2 = L3_2
    L6_2 = 1
    L7_2 = false
    L4_2(L5_2, L6_2, L7_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "MK_VehicleKeys:Client:UseLockpick"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" == L2_2 then
    L2_2 = A0_2.name
    if L2_2 then
      goto lbl_10
    end
  end
  L2_2 = A0_2
  ::lbl_10::
  L3_2 = false
  L4_2 = Config
  L4_2 = L4_2.CheckRestrictions
  if L4_2 then
    L4_2 = promise
    L4_2 = L4_2.new
    L4_2 = L4_2()
    L6_2 = L4_2
    L5_2 = L4_2.resolve
    L7_2 = framework
    L8_2 = L7_2
    L7_2 = L7_2.isRestricted
    L7_2, L8_2 = L7_2(L8_2)
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = Citizen
    L5_2 = L5_2.Await
    L6_2 = L4_2
    L5_2(L6_2)
    if L4_2 then
      L3_2 = L4_2.value
    end
  end
  if not L3_2 then
    L4_2 = IsLockpicking
    if not L4_2 then
      L4_2 = IsHotwiring
      if not L4_2 then
        L4_2 = DisableLockpick
        if not L4_2 then
          L4_2 = GetVehiclePedIsIn
          L5_2 = PlayerPedId
          L5_2 = L5_2()
          L6_2 = false
          L4_2 = L4_2(L5_2, L6_2)
          L5_2 = GetVehicleClass
          L6_2 = L4_2
          L5_2 = L5_2(L6_2)
          L6_2 = HasAuth
          L7_2 = L4_2
          L6_2 = L6_2(L7_2)
          if not L6_2 then
            if 15 == L5_2 or 16 == L5_2 then
              if 15 == L5_2 then
                L6_2 = Config
                L6_2 = L6_2.Licenses
                L6_2 = L6_2.Helicopter
                L6_2 = L6_2.CanLockpick
                if L6_2 then
                  goto lbl_74
                end
              end
              if 16 == L5_2 then
                L6_2 = Config
                L6_2 = L6_2.Licenses
                L6_2 = L6_2.Plane
                L6_2 = L6_2.CanLockpick
                ::lbl_74::
                if L6_2 then
                  L6_2 = Entity
                  L7_2 = L4_2
                  L6_2 = L6_2(L7_2)
                  L6_2 = L6_2.state
                  L6_2 = L6_2.LockpickDisabled
                  if not L6_2 then
                    L6_2 = GetVehiclePedIsEntering
                    L7_2 = PlayerPedId
                    L7_2, L8_2 = L7_2()
                    L6_2 = L6_2(L7_2, L8_2)
                    if 0 == L6_2 then
                      L6_2 = IsPedInAnyVehicle
                      L7_2 = PlayerPedId
                      L7_2 = L7_2()
                      L8_2 = false
                      L6_2 = L6_2(L7_2, L8_2)
                      if L6_2 then
                        L6_2 = LockpickIgnition
                        L7_2 = A1_2.Advanced
                        L8_2 = A0_2
                        L6_2(L7_2, L8_2)
                      else
                        L6_2 = LockpickDoor
                        L7_2 = A1_2.Advanced
                        L8_2 = A0_2
                        L6_2(L7_2, L8_2)
                      end
                    end
                  end
                end
              end
            else
              L6_2 = Entity
              L7_2 = L4_2
              L6_2 = L6_2(L7_2)
              L6_2 = L6_2.state
              L6_2 = L6_2.LockpickDisabled
              if not L6_2 then
                L6_2 = GetVehiclePedIsEntering
                L7_2 = PlayerPedId
                L7_2, L8_2 = L7_2()
                L6_2 = L6_2(L7_2, L8_2)
                if 0 == L6_2 then
                  L6_2 = IsPedInAnyVehicle
                  L7_2 = PlayerPedId
                  L7_2 = L7_2()
                  L8_2 = false
                  L6_2 = L6_2(L7_2, L8_2)
                  if L6_2 then
                    L6_2 = LockpickIgnition
                    L7_2 = A1_2.Advanced
                    L8_2 = A0_2
                    L6_2(L7_2, L8_2)
                  else
                    L6_2 = LockpickDoor
                    L7_2 = A1_2.Advanced
                    L8_2 = A0_2
                    L6_2(L7_2, L8_2)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "MK_VehicleKeys:Client:ToggleEngine"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = false
  L1_2 = GetResourceState
  L2_2 = "ox_inventory"
  L1_2 = L1_2(L2_2)
  if "started" == L1_2 then
    L1_2 = LocalPlayer
    L1_2 = L1_2.state
    L1_2 = L1_2.invOpen
    if L1_2 then
      return
    end
  end
  L1_2 = Config
  L1_2 = L1_2.CheckRestrictions
  if L1_2 then
    L1_2 = promise
    L1_2 = L1_2.new
    L1_2 = L1_2()
    L3_2 = L1_2
    L2_2 = L1_2.resolve
    L4_2 = framework
    L5_2 = L4_2
    L4_2 = L4_2.isRestricted
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    L2_2 = Citizen
    L2_2 = L2_2.Await
    L3_2 = L1_2
    L2_2(L3_2)
    if L1_2 then
      L0_2 = L1_2.value
    end
  end
  if not L0_2 then
    L1_2 = GetVehiclePedIsIn
    L2_2 = PlayerPedId
    L2_2 = L2_2()
    L3_2 = true
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 and 0 ~= L1_2 then
      L2_2 = GetPedInVehicleSeat
      L3_2 = L1_2
      L4_2 = -1
      L2_2 = L2_2(L3_2, L4_2)
      L3_2 = PlayerPedId
      L3_2 = L3_2()
      if L2_2 == L3_2 then
        L2_2 = HasAuth
        L3_2 = L1_2
        L2_2 = L2_2(L3_2)
        if L2_2 then
          L2_2 = GetVehicleClass
          L3_2 = L1_2
          L2_2 = L2_2(L3_2)
          L3_2 = GetIsVehicleEngineRunning
          L4_2 = L1_2
          L3_2 = L3_2(L4_2)
          if not L3_2 then
            if 15 == L2_2 or 16 == L2_2 then
              L3_2 = SetVehicleUndriveable
              L4_2 = L1_2
              L5_2 = false
              L3_2(L4_2, L5_2)
              L3_2 = SetVehicleEngineOn
              L4_2 = L1_2
              L5_2 = true
              L6_2 = false
              L7_2 = Config
              L7_2 = L7_2.DisableAutoStartEngine
              if L7_2 then
                L7_2 = true
                if L7_2 then
                  goto lbl_84
                end
              end
              L7_2 = false
              ::lbl_84::
              L3_2(L4_2, L5_2, L6_2, L7_2)
              L3_2 = Config
              L3_2 = L3_2.Commands
              L3_2 = L3_2.EngineToggle
              L3_2 = L3_2.Notify
              if L3_2 then
                L3_2 = utils
                L4_2 = L3_2
                L3_2 = L3_2.notify
                L5_2 = locale
                L6_2 = "engine_on"
                L5_2 = L5_2(L6_2)
                L6_2 = "primary"
                L7_2 = 5000
                L3_2(L4_2, L5_2, L6_2, L7_2)
              end
            else
              L3_2 = SetVehicleEngineOn
              L4_2 = L1_2
              L5_2 = true
              L6_2 = false
              L7_2 = Config
              L7_2 = L7_2.DisableAutoStartEngine
              if L7_2 then
                L7_2 = true
                if L7_2 then
                  goto lbl_112
                end
              end
              L7_2 = false
              ::lbl_112::
              L3_2(L4_2, L5_2, L6_2, L7_2)
              L3_2 = Config
              L3_2 = L3_2.Commands
              L3_2 = L3_2.EngineToggle
              L3_2 = L3_2.Notify
              if L3_2 then
                L3_2 = utils
                L4_2 = L3_2
                L3_2 = L3_2.notify
                L5_2 = locale
                L6_2 = "engine_on"
                L5_2 = L5_2(L6_2)
                L6_2 = "primary"
                L7_2 = 5000
                L3_2(L4_2, L5_2, L6_2, L7_2)
              end
            end
          elseif 15 == L2_2 or 16 == L2_2 then
            L3_2 = SetVehicleUndriveable
            L4_2 = L1_2
            L5_2 = true
            L3_2(L4_2, L5_2)
            L3_2 = SetVehicleEngineOn
            L4_2 = L1_2
            L5_2 = false
            L6_2 = false
            L7_2 = true
            L3_2(L4_2, L5_2, L6_2, L7_2)
            L3_2 = Config
            L3_2 = L3_2.Commands
            L3_2 = L3_2.EngineToggle
            L3_2 = L3_2.Notify
            if L3_2 then
              L3_2 = utils
              L4_2 = L3_2
              L3_2 = L3_2.notify
              L5_2 = locale
              L6_2 = "engine_off"
              L5_2 = L5_2(L6_2)
              L6_2 = "primary"
              L7_2 = 5000
              L3_2(L4_2, L5_2, L6_2, L7_2)
            end
          else
            L3_2 = SetVehicleEngineOn
            L4_2 = L1_2
            L5_2 = false
            L6_2 = false
            L7_2 = true
            L3_2(L4_2, L5_2, L6_2, L7_2)
            L3_2 = Config
            L3_2 = L3_2.Commands
            L3_2 = L3_2.EngineToggle
            L3_2 = L3_2.Notify
            if L3_2 then
              L3_2 = utils
              L4_2 = L3_2
              L3_2 = L3_2.notify
              L5_2 = locale
              L6_2 = "engine_off"
              L5_2 = L5_2(L6_2)
              L6_2 = "primary"
              L7_2 = 5000
              L3_2(L4_2, L5_2, L6_2, L7_2)
            end
          end
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "MK_VehicleKeys:Client:RemoveKey"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = false
  L2_2 = Config
  L2_2 = L2_2.CheckRestrictions
  if L2_2 then
    L2_2 = promise
    L2_2 = L2_2.new
    L2_2 = L2_2()
    L4_2 = L2_2
    L3_2 = L2_2.resolve
    L5_2 = framework
    L6_2 = L5_2
    L5_2 = L5_2.isRestricted
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L5_2(L6_2)
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L3_2 = Citizen
    L3_2 = L3_2.Await
    L4_2 = L2_2
    L3_2(L4_2)
    if L2_2 then
      L1_2 = L2_2.value
    end
  end
  if not L1_2 then
    L2_2 = utils
    L3_2 = L2_2
    L2_2 = L2_2.getClosestVehicle
    L2_2, L3_2 = L2_2(L3_2)
    if L2_2 and L3_2 then
      if L3_2 < 5.0 then
        L4_2 = Entity
        L5_2 = L2_2
        L4_2 = L4_2(L5_2)
        L4_2 = L4_2.state
        L4_2 = L4_2.MKFOB
        if nil ~= L4_2 then
          L4_2 = Config
          L4_2 = L4_2.KeysAsItem
          L4_2 = L4_2.PlayerOwned
          L4_2 = L4_2.CanHotwire
          if not L4_2 then
            L4_2 = Config
            L4_2 = L4_2.KeysAsItem
            L4_2 = L4_2.PlayerOwned
            L4_2 = L4_2.CanLockpickIgnition
            if not L4_2 then
              L4_2 = Config
              L4_2 = L4_2.KeysAsItem
              L4_2 = L4_2.PlayerOwned
              L4_2 = L4_2.GiveWhitelistJobKeys
            end
          end
          if L4_2 then
            L4_2 = false
            L5_2 = Entity
            L6_2 = L2_2
            L5_2 = L5_2(L6_2)
            L5_2 = L5_2.state
            L5_2 = L5_2.Keys
            if L5_2 then
              L5_2 = pairs
              L6_2 = Entity
              L7_2 = L2_2
              L6_2 = L6_2(L7_2)
              L6_2 = L6_2.state
              L6_2 = L6_2.Keys
              L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
              for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
                L11_2 = LocalPlayer
                L11_2 = L11_2.state
                L11_2 = L11_2.mk_identifier
                if L10_2 == L11_2 then
                  L4_2 = true
                  break
                end
              end
              if L4_2 then
                L5_2 = TriggerServerEvent
                L6_2 = "MK_VehicleKeys:Server:RemoveKey"
                L7_2 = NetworkGetNetworkIdFromEntity
                L8_2 = L2_2
                L7_2 = L7_2(L8_2)
                L8_2 = A0_2
                L5_2(L6_2, L7_2, L8_2)
              end
            end
          end
        else
          L4_2 = HasAuth
          L5_2 = L2_2
          L4_2 = L4_2(L5_2)
          if L4_2 then
            L4_2 = TriggerServerEvent
            L5_2 = "MK_VehicleKeys:Server:RemoveKey"
            L6_2 = NetworkGetNetworkIdFromEntity
            L7_2 = L2_2
            L6_2 = L6_2(L7_2)
            L7_2 = A0_2
            L4_2(L5_2, L6_2, L7_2)
          else
            L4_2 = utils
            L5_2 = L4_2
            L4_2 = L4_2.notify
            L6_2 = locale
            L7_2 = "no_keys"
            L6_2 = L6_2(L7_2)
            L7_2 = "error"
            L8_2 = 5000
            L4_2(L5_2, L6_2, L7_2, L8_2)
          end
        end
      else
        L4_2 = utils
        L5_2 = L4_2
        L4_2 = L4_2.notify
        L6_2 = locale
        L7_2 = "far_from_veh"
        L6_2 = L6_2(L7_2)
        L7_2 = "error"
        L8_2 = 5000
        L4_2(L5_2, L6_2, L7_2, L8_2)
      end
    else
      L4_2 = utils
      L5_2 = L4_2
      L4_2 = L4_2.notify
      L6_2 = locale
      L7_2 = "far_from_veh"
      L6_2 = L6_2(L7_2)
      L7_2 = "error"
      L8_2 = 5000
      L4_2(L5_2, L6_2, L7_2, L8_2)
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "MK_VehicleKeys:Client:GiveKey"
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = false
  L1_2 = Config
  L1_2 = L1_2.CheckRestrictions
  if L1_2 then
    L1_2 = promise
    L1_2 = L1_2.new
    L1_2 = L1_2()
    L3_2 = L1_2
    L2_2 = L1_2.resolve
    L4_2 = framework
    L5_2 = L4_2
    L4_2 = L4_2.isRestricted
    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L4_2(L5_2)
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L2_2 = Citizen
    L2_2 = L2_2.Await
    L3_2 = L1_2
    L2_2(L3_2)
    if L1_2 then
      L0_2 = L1_2.value
    end
  end
  if not L0_2 then
    L1_2 = utils
    L2_2 = L1_2
    L1_2 = L1_2.getClosestVehicle
    L1_2, L2_2 = L1_2(L2_2)
    L3_2 = utils
    L4_2 = L3_2
    L3_2 = L3_2.getClosestPlayer
    L3_2 = L3_2(L4_2)
    if L1_2 and L2_2 then
      L4_2 = GetVehicleClass
      L5_2 = L1_2
      L4_2 = L4_2(L5_2)
      if L2_2 < 7.0 then
        if L3_2 then
          L5_2 = L3_2.Distance
          if L5_2 < 10 then
            L5_2 = Entity
            L6_2 = L1_2
            L5_2 = L5_2(L6_2)
            L5_2 = L5_2.state
            L5_2 = L5_2.MKFOB
            if nil ~= L5_2 then
              L5_2 = Config
              L5_2 = L5_2.KeysAsItem
              L5_2 = L5_2.PlayerOwned
              L5_2 = L5_2.CanHotwire
              if not L5_2 then
                L5_2 = Config
                L5_2 = L5_2.KeysAsItem
                L5_2 = L5_2.PlayerOwned
                L5_2 = L5_2.CanLockpickIgnition
                if not L5_2 then
                  L5_2 = Config
                  L5_2 = L5_2.KeysAsItem
                  L5_2 = L5_2.PlayerOwned
                  L5_2 = L5_2.GiveWhitelistJobKeys
                  if not L5_2 then
                    goto lbl_245
                  end
                end
              end
              L5_2 = false
              L6_2 = Entity
              L7_2 = L1_2
              L6_2 = L6_2(L7_2)
              L6_2 = L6_2.state
              L6_2 = L6_2.Keys
              if L6_2 then
                L6_2 = pairs
                L7_2 = Entity
                L8_2 = L1_2
                L7_2 = L7_2(L8_2)
                L7_2 = L7_2.state
                L7_2 = L7_2.Keys
                L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
                for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
                  L12_2 = LocalPlayer
                  L12_2 = L12_2.state
                  L12_2 = L12_2.mk_identifier
                  if L11_2 == L12_2 then
                    L5_2 = true
                    break
                  end
                end
                if L5_2 then
                  if 15 == L4_2 or 16 == L4_2 then
                    if 15 == L4_2 then
                      L6_2 = Config
                      L6_2 = L6_2.Licenses
                      L6_2 = L6_2.Helicopter
                      L6_2 = L6_2.CanHotwire
                      if L6_2 then
                        goto lbl_128
                      end
                      L6_2 = Config
                      L6_2 = L6_2.Licenses
                      L6_2 = L6_2.Helicopter
                      L6_2 = L6_2.CanLockpick
                      if L6_2 then
                        goto lbl_128
                      end
                    end
                    if 16 == L4_2 then
                      L6_2 = Config
                      L6_2 = L6_2.Licenses
                      L6_2 = L6_2.Plane
                      L6_2 = L6_2.CanHotwire
                      if not L6_2 then
                        L6_2 = Config
                        L6_2 = L6_2.Licenses
                        L6_2 = L6_2.Plane
                        L6_2 = L6_2.CanLockpick
                        if not L6_2 then
                          goto lbl_136
                        end
                      end
                      ::lbl_128::
                      L6_2 = TriggerServerEvent
                      L7_2 = "MK_VehicleKeys:Server:AddKey"
                      L8_2 = NetworkGetNetworkIdFromEntity
                      L9_2 = L1_2
                      L8_2 = L8_2(L9_2)
                      L9_2 = L3_2.Source
                      L6_2(L7_2, L8_2, L9_2)
                    ::lbl_136::
                    else
                      L6_2 = lib
                      L6_2 = L6_2.callback
                      L6_2 = L6_2.await
                      L7_2 = "MK_VehicleKeys:Server:GetFlyingAuth"
                      L8_2 = false
                      L9_2 = L3_2.Source
                      L10_2 = NetworkGetNetworkIdFromEntity
                      L11_2 = L1_2
                      L10_2, L11_2, L12_2 = L10_2(L11_2)
                      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                      if L6_2 then
                        L7_2 = TriggerServerEvent
                        L8_2 = "MK_VehicleKeys:Server:AddKey"
                        L9_2 = NetworkGetNetworkIdFromEntity
                        L10_2 = L1_2
                        L9_2 = L9_2(L10_2)
                        L10_2 = L3_2.Source
                        L7_2(L8_2, L9_2, L10_2)
                      else
                        L7_2 = utils
                        L8_2 = L7_2
                        L7_2 = L7_2.notify
                        L9_2 = locale
                        L10_2 = "not_auth_fly"
                        L9_2 = L9_2(L10_2)
                        L10_2 = "error"
                        L11_2 = 5000
                        L7_2(L8_2, L9_2, L10_2, L11_2)
                      end
                    end
                  else
                    L6_2 = TriggerServerEvent
                    L7_2 = "MK_VehicleKeys:Server:AddKey"
                    L8_2 = NetworkGetNetworkIdFromEntity
                    L9_2 = L1_2
                    L8_2 = L8_2(L9_2)
                    L9_2 = L3_2.Source
                    L6_2(L7_2, L8_2, L9_2)
                  end
                else
                  L6_2 = inventory
                  L7_2 = L6_2
                  L6_2 = L6_2.hasItem
                  L8_2 = Config
                  L8_2 = L8_2.KeysAsItem
                  L8_2 = L8_2.PlayerOwned
                  L8_2 = L8_2.ItemName
                  L9_2 = {}
                  L10_2 = Entity
                  L11_2 = L1_2
                  L10_2 = L10_2(L11_2)
                  L10_2 = L10_2.state
                  L10_2 = L10_2.MKFOB
                  L9_2.id = L10_2
                  L10_2 = true
                  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
                  if L6_2 then
                    L6_2 = utils
                    L7_2 = L6_2
                    L6_2 = L6_2.notify
                    L8_2 = locale
                    L9_2 = "cant_give_fob"
                    L8_2 = L8_2(L9_2)
                    L9_2 = "error"
                    L10_2 = 5000
                    L6_2(L7_2, L8_2, L9_2, L10_2)
                  else
                    L6_2 = utils
                    L7_2 = L6_2
                    L6_2 = L6_2.notify
                    L8_2 = locale
                    L9_2 = "no_keys"
                    L8_2 = L8_2(L9_2)
                    L9_2 = "error"
                    L10_2 = 5000
                    L6_2(L7_2, L8_2, L9_2, L10_2)
                  end
                end
              else
                L6_2 = inventory
                L7_2 = L6_2
                L6_2 = L6_2.hasItem
                L8_2 = Config
                L8_2 = L8_2.KeysAsItem
                L8_2 = L8_2.PlayerOwned
                L8_2 = L8_2.ItemName
                L9_2 = {}
                L10_2 = Entity
                L11_2 = L1_2
                L10_2 = L10_2(L11_2)
                L10_2 = L10_2.state
                L10_2 = L10_2.MKFOB
                L9_2.id = L10_2
                L10_2 = true
                L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
                if L6_2 then
                  L6_2 = utils
                  L7_2 = L6_2
                  L6_2 = L6_2.notify
                  L8_2 = locale
                  L9_2 = "cant_give_fob"
                  L8_2 = L8_2(L9_2)
                  L9_2 = "error"
                  L10_2 = 5000
                  L6_2(L7_2, L8_2, L9_2, L10_2)
                else
                  L6_2 = utils
                  L7_2 = L6_2
                  L6_2 = L6_2.notify
                  L8_2 = locale
                  L9_2 = "no_keys"
                  L8_2 = L8_2(L9_2)
                  L9_2 = "error"
                  L10_2 = 5000
                  L6_2(L7_2, L8_2, L9_2, L10_2)
                  goto lbl_407
                  ::lbl_245::
                  L5_2 = inventory
                  L6_2 = L5_2
                  L5_2 = L5_2.hasItem
                  L7_2 = Config
                  L7_2 = L7_2.KeysAsItem
                  L7_2 = L7_2.PlayerOwned
                  L7_2 = L7_2.ItemName
                  L8_2 = {}
                  L9_2 = Entity
                  L10_2 = L1_2
                  L9_2 = L9_2(L10_2)
                  L9_2 = L9_2.state
                  L9_2 = L9_2.MKFOB
                  L8_2.id = L9_2
                  L9_2 = true
                  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
                  if L5_2 then
                    L5_2 = utils
                    L6_2 = L5_2
                    L5_2 = L5_2.notify
                    L7_2 = locale
                    L8_2 = "cant_give_fob"
                    L7_2 = L7_2(L8_2)
                    L8_2 = "error"
                    L9_2 = 5000
                    L5_2(L6_2, L7_2, L8_2, L9_2)
                  else
                    L5_2 = utils
                    L6_2 = L5_2
                    L5_2 = L5_2.notify
                    L7_2 = locale
                    L8_2 = "no_keys"
                    L7_2 = L7_2(L8_2)
                    L8_2 = "error"
                    L9_2 = 5000
                    L5_2(L6_2, L7_2, L8_2, L9_2)
                  end
                end
              end
            else
              L5_2 = HasAuth
              L6_2 = L1_2
              L5_2 = L5_2(L6_2)
              if not L5_2 then
                L5_2 = utils
                L6_2 = L5_2
                L5_2 = L5_2.notify
                L7_2 = locale
                L8_2 = "no_keys"
                L7_2 = L7_2(L8_2)
                L8_2 = "error"
                L9_2 = 5000
                return L5_2(L6_2, L7_2, L8_2, L9_2)
              end
              if 15 == L4_2 or 16 == L4_2 then
                if 15 == L4_2 then
                  L5_2 = Config
                  L5_2 = L5_2.Licenses
                  L5_2 = L5_2.Helicopter
                  L5_2 = L5_2.CanHotwire
                  if L5_2 then
                    goto lbl_327
                  end
                  L5_2 = Config
                  L5_2 = L5_2.Licenses
                  L5_2 = L5_2.Helicopter
                  L5_2 = L5_2.CanLockpick
                  if L5_2 then
                    goto lbl_327
                  end
                end
                if 16 == L4_2 then
                  L5_2 = Config
                  L5_2 = L5_2.Licenses
                  L5_2 = L5_2.Plane
                  L5_2 = L5_2.CanHotwire
                  if not L5_2 then
                    L5_2 = Config
                    L5_2 = L5_2.Licenses
                    L5_2 = L5_2.Plane
                    L5_2 = L5_2.CanLockpick
                    if not L5_2 then
                      goto lbl_335
                    end
                  end
                  ::lbl_327::
                  L5_2 = TriggerServerEvent
                  L6_2 = "MK_VehicleKeys:Server:AddKey"
                  L7_2 = NetworkGetNetworkIdFromEntity
                  L8_2 = L1_2
                  L7_2 = L7_2(L8_2)
                  L8_2 = L3_2.Source
                  L5_2(L6_2, L7_2, L8_2)
                ::lbl_335::
                else
                  L5_2 = lib
                  L5_2 = L5_2.callback
                  L5_2 = L5_2.await
                  L6_2 = "MK_VehicleKeys:Server:GetFlyingAuth"
                  L7_2 = false
                  L8_2 = L3_2.Source
                  L9_2 = NetworkGetNetworkIdFromEntity
                  L10_2 = L1_2
                  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
                  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                  if L5_2 then
                    L6_2 = TriggerServerEvent
                    L7_2 = "MK_VehicleKeys:Server:AddKey"
                    L8_2 = NetworkGetNetworkIdFromEntity
                    L9_2 = L1_2
                    L8_2 = L8_2(L9_2)
                    L9_2 = L3_2.Source
                    L6_2(L7_2, L8_2, L9_2)
                  else
                    L6_2 = utils
                    L7_2 = L6_2
                    L6_2 = L6_2.notify
                    L8_2 = locale
                    L9_2 = "not_auth_fly"
                    L8_2 = L8_2(L9_2)
                    L9_2 = "error"
                    L10_2 = 5000
                    L6_2(L7_2, L8_2, L9_2, L10_2)
                  end
                end
              else
                L5_2 = TriggerServerEvent
                L6_2 = "MK_VehicleKeys:Server:AddKey"
                L7_2 = NetworkGetNetworkIdFromEntity
                L8_2 = L1_2
                L7_2 = L7_2(L8_2)
                L8_2 = L3_2.Source
                L5_2(L6_2, L7_2, L8_2)
              end
            end
          else
            L5_2 = utils
            L6_2 = L5_2
            L5_2 = L5_2.notify
            L7_2 = locale
            L8_2 = "nobody_around"
            L7_2 = L7_2(L8_2)
            L8_2 = "error"
            L9_2 = 5000
            L5_2(L6_2, L7_2, L8_2, L9_2)
          end
        else
          L5_2 = utils
          L6_2 = L5_2
          L5_2 = L5_2.notify
          L7_2 = locale
          L8_2 = "nobody_around"
          L7_2 = L7_2(L8_2)
          L8_2 = "error"
          L9_2 = 5000
          L5_2(L6_2, L7_2, L8_2, L9_2)
        end
      else
        L5_2 = utils
        L6_2 = L5_2
        L5_2 = L5_2.notify
        L7_2 = locale
        L8_2 = "far_from_veh"
        L7_2 = L7_2(L8_2)
        L8_2 = "error"
        L9_2 = 5000
        L5_2(L6_2, L7_2, L8_2, L9_2)
      end
    else
      L4_2 = utils
      L5_2 = L4_2
      L4_2 = L4_2.notify
      L6_2 = locale
      L7_2 = "far_from_veh"
      L6_2 = L6_2(L7_2)
      L7_2 = "error"
      L8_2 = 5000
      L4_2(L5_2, L6_2, L7_2, L8_2)
    end
  end
  ::lbl_407::
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "MK_VehicleKeys:Client:ManageKeyFobs"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = false
  L2_2 = Config
  L2_2 = L2_2.CheckRestrictions
  if L2_2 then
    L2_2 = promise
    L2_2 = L2_2.new
    L2_2 = L2_2()
    L4_2 = L2_2
    L3_2 = L2_2.resolve
    L5_2 = framework
    L6_2 = L5_2
    L5_2 = L5_2.isRestricted
    L5_2, L6_2 = L5_2(L6_2)
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = Citizen
    L3_2 = L3_2.Await
    L4_2 = L2_2
    L3_2(L4_2)
    if L2_2 then
      L1_2 = L2_2.value
    end
  end
  if not L1_2 then
    L2_2 = lib
    L2_2 = L2_2.callback
    L3_2 = "MK_VehicleKeys:Server:GetFobData"
    L4_2 = false
    function L5_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3
      L1_3 = next
      if A0_3 then
        L2_3 = L1_3
        L3_3 = A0_3
        L2_3 = L2_3(L3_3)
        if nil ~= L2_3 then
          L2_3 = {}
          L3_3 = pairs
          L4_3 = A0_3
          L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
          for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
            L9_3 = VehicleInfo
            L10_3 = tonumber
            L11_3 = L8_3.model
            L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3 = L10_3(L11_3)
            L9_3 = L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3)
            L10_3 = L9_3.brand
            if not L10_3 then
              L9_3.brand = ""
            end
            L8_3.VehInfo = L9_3
            L10_3 = table
            L10_3 = L10_3.insert
            L11_3 = L2_3
            L12_3 = {}
            L13_3 = "["
            L14_3 = L8_3.plate
            L15_3 = "] "
            L13_3 = L13_3 .. L14_3 .. L15_3
            L12_3.title = L13_3
            if L9_3 then
              L13_3 = L9_3.name
              L14_3 = L9_3.brand
              if L13_3 ~= L14_3 then
                L13_3 = L9_3.brand
                L14_3 = " "
                L15_3 = L9_3.name
                L13_3 = L13_3 .. L14_3 .. L15_3
                if L13_3 then
                  goto lbl_51
                end
              end
              L13_3 = L9_3.name
              if L13_3 then
                goto lbl_51
              end
            end
            L13_3 = ""
            ::lbl_51::
            L12_3.description = L13_3
            L13_3 = "KeyFobManagement_Id_"
            L14_3 = L8_3.fobid
            L13_3 = L13_3 .. L14_3
            L12_3.menu = L13_3
            L12_3.icon = "fa-solid fa-key"
            L13_3 = {}
            L14_3 = locale
            L15_3 = "keyfob_menu_metadata_vehid"
            L14_3 = L14_3(L15_3)
            L15_3 = " "
            L16_3 = L8_3.fobid
            L14_3 = L14_3 .. L15_3 .. L16_3
            L13_3[1] = L14_3
            L12_3.metadata = L13_3
            L10_3(L11_3, L12_3)
            L10_3 = lib
            L10_3 = L10_3.registerContext
            L11_3 = {}
            L12_3 = "KeyFobManagement_Id_"
            L13_3 = L8_3.fobid
            L12_3 = L12_3 .. L13_3
            L11_3.id = L12_3
            L12_3 = "["
            L13_3 = L8_3.plate
            L14_3 = "] "
            if L9_3 then
              L15_3 = L9_3.name
              if L15_3 then
                L15_3 = L9_3.name
                if L15_3 then
                  goto lbl_91
                end
              end
              L15_3 = ""
              if L15_3 then
                goto lbl_91
              end
            end
            L15_3 = ""
            ::lbl_91::
            L12_3 = L12_3 .. L13_3 .. L14_3 .. L15_3
            L11_3.title = L12_3
            L12_3 = "KeyFobManagement_"
            L13_3 = LocalPlayer
            L13_3 = L13_3.state
            L13_3 = L13_3.mk_identifier
            L12_3 = L12_3 .. L13_3
            L11_3.menu = L12_3
            L12_3 = {}
            L13_3 = {}
            L14_3 = locale
            L15_3 = "keyfob_dupe_key"
            L14_3 = L14_3(L15_3)
            L15_3 = utils
            L16_3 = L15_3
            L15_3 = L15_3.formatThousand
            L17_3 = Config
            L17_3 = L17_3.KeysAsItem
            L17_3 = L17_3.KeyManagement
            L17_3 = L17_3.DuplicateKeyCost
            L15_3 = L15_3(L16_3, L17_3)
            L16_3 = "]"
            L14_3 = L14_3 .. L15_3 .. L16_3
            L13_3.title = L14_3
            L14_3 = locale
            L15_3 = "keyfob_spare_key"
            L14_3 = L14_3(L15_3)
            L13_3.description = L14_3
            L14_3 = {}
            L15_3 = locale
            L16_3 = "keyfob_menu_metadata_sparekey"
            L15_3, L16_3, L17_3, L18_3 = L15_3(L16_3)
            L14_3[1] = L15_3
            L14_3[2] = L16_3
            L14_3[3] = L17_3
            L14_3[4] = L18_3
            L13_3.metadata = L14_3
            L13_3.icon = "fa-solid fa-key"
            L13_3.serverEvent = "MK_VehicleKeys:Server:AddFob"
            L13_3.args = L8_3
            L14_3 = {}
            L15_3 = locale
            L16_3 = "reprogram_price"
            L15_3 = L15_3(L16_3)
            L16_3 = utils
            L17_3 = L16_3
            L16_3 = L16_3.formatThousand
            L18_3 = Config
            L18_3 = L18_3.KeysAsItem
            L18_3 = L18_3.KeyManagement
            L18_3 = L18_3.ReprogramCost
            L16_3 = L16_3(L17_3, L18_3)
            L17_3 = "]"
            L15_3 = L15_3 .. L16_3 .. L17_3
            L14_3.title = L15_3
            L15_3 = locale
            L16_3 = "reprogram_key"
            L15_3 = L15_3(L16_3)
            L14_3.description = L15_3
            L15_3 = {}
            L16_3 = locale
            L17_3 = "reprogram_key_label"
            L16_3, L17_3, L18_3 = L16_3(L17_3)
            L15_3[1] = L16_3
            L15_3[2] = L17_3
            L15_3[3] = L18_3
            L14_3.metadata = L15_3
            L14_3.icon = "fa-solid fa-key"
            L14_3.event = "MK_VehicleKeys:Client:ConfirmReprogram"
            L14_3.args = L8_3
            L12_3[1] = L13_3
            L12_3[2] = L14_3
            L11_3.options = L12_3
            L10_3(L11_3)
          end
          L3_3 = table
          L3_3 = L3_3.sort
          L4_3 = L2_3
          function L5_3(A0_4, A1_4)
            local L2_4, L3_4
            L2_4 = A0_4.title
            L3_4 = A1_4.title
            L2_4 = L2_4 < L3_4
            return L2_4
          end
          L3_3(L4_3, L5_3)
          L3_3 = lib
          L3_3 = L3_3.registerContext
          L4_3 = {}
          L5_3 = "KeyFobManagement_"
          L6_3 = LocalPlayer
          L6_3 = L6_3.state
          L6_3 = L6_3.mk_identifier
          L5_3 = L5_3 .. L6_3
          L4_3.id = L5_3
          L5_3 = locale
          L6_3 = "keyfob_menu_title"
          L5_3 = L5_3(L6_3)
          L4_3.title = L5_3
          L4_3.canClose = true
          L4_3.options = L2_3
          L3_3(L4_3)
          L3_3 = lib
          L3_3 = L3_3.showContext
          L4_3 = "KeyFobManagement_"
          L5_3 = LocalPlayer
          L5_3 = L5_3.state
          L5_3 = L5_3.mk_identifier
          L4_3 = L4_3 .. L5_3
          L3_3(L4_3)
      end
      else
        L2_3 = utils
        L3_3 = L2_3
        L2_3 = L2_3.notify
        L4_3 = locale
        L5_3 = "no_fobs"
        L4_3 = L4_3(L5_3)
        L5_3 = "error"
        L6_3 = 5000
        L2_3(L3_3, L4_3, L5_3, L6_3)
      end
    end
    L6_2 = LocalPlayer
    L6_2 = L6_2.state
    L6_2 = L6_2.mk_identifier
    L2_2(L3_2, L4_2, L5_2, L6_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "MK_VehicleKeys:Client:ConfirmReprogram"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = lib
  L1_2 = L1_2.alertDialog
  L2_2 = {}
  L3_2 = locale
  L4_2 = "reprogram"
  L3_2 = L3_2(L4_2)
  L4_2 = " ["
  L5_2 = A0_2.plate
  L6_2 = "] "
  L7_2 = A0_2.VehInfo
  L7_2 = L7_2.name
  L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2 .. L7_2
  L2_2.header = L3_2
  L3_2 = locale
  L4_2 = "reprogram_confirm_label"
  L3_2 = L3_2(L4_2)
  L2_2.content = L3_2
  L2_2.centered = true
  L2_2.cancel = true
  L3_2 = {}
  L4_2 = locale
  L5_2 = "reprogram_cancel"
  L4_2 = L4_2(L5_2)
  L3_2.cancel = L4_2
  L4_2 = locale
  L5_2 = "reprogram_confirm"
  L4_2 = L4_2(L5_2)
  L3_2.confirm = L4_2
  L2_2.labels = L3_2
  L1_2 = L1_2(L2_2)
  if L1_2 and "confirm" == L1_2 then
    L2_2 = TriggerServerEvent
    L3_2 = "MK_VehicleKeys:Server:ReprogramKey"
    L4_2 = A0_2
    L2_2(L3_2, L4_2)
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "MK_VehicleKeys:Client:VehInfo"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if A0_2 then
    L1_2 = {}
    L1_2.brand = nil
    L2_2 = framework
    L3_2 = L2_2
    L2_2 = L2_2.getVehicleName
    L4_2 = A0_2
    L5_2 = vehicles
    L5_2 = L5_2[A0_2]
    if L5_2 then
      L5_2 = L5_2.name
    end
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L1_2.name = L2_2
    return L1_2
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "MK_VehicleKeys:CheckWhitelist"
function L2_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = IsThisModelABicycle
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      L1_2 = IsWhitelisted
      L2_2 = A0_2
      L1_2 = L1_2(L2_2)
      if not L1_2 then
        goto lbl_16
      end
    end
    L1_2 = true
    do return L1_2 end
    goto lbl_21
    ::lbl_16::
    L1_2 = false
    return L1_2
  else
    L1_2 = false
    return L1_2
  end
  ::lbl_21::
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "MK_VehicleKeys:Client:UseKeyFob"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = Config
  L1_2 = L1_2.KeysAsItem
  L1_2 = L1_2.PlayerOwned
  L1_2 = L1_2.Enabled
  if L1_2 then
    L1_2 = false
    L2_2 = GetResourceState
    L3_2 = "ox_inventory"
    L2_2 = L2_2(L3_2)
    if "started" == L2_2 then
      L2_2 = A0_2.info
      if not L2_2 then
        L2_2 = {}
        A0_2.info = L2_2
      end
      L2_2 = A0_2.metadata
      if L2_2 then
        L2_2 = A0_2.metadata
        A0_2.info = L2_2
      end
    end
    L2_2 = A0_2.info
    L2_2 = L2_2.plate
    if not L2_2 then
      L2_2 = TriggerServerEvent
      L3_2 = "MK_VehicleKeys:Server:GetPlateByFobId"
      L4_2 = A0_2
      L2_2(L3_2, L4_2)
    end
    L2_2 = Config
    L2_2 = L2_2.CheckRestrictions
    if L2_2 then
      L2_2 = promise
      L2_2 = L2_2.new
      L2_2 = L2_2()
      L4_2 = L2_2
      L3_2 = L2_2.resolve
      L5_2 = framework
      L6_2 = L5_2
      L5_2 = L5_2.isRestricted
      L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L5_2(L6_2)
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L3_2 = Citizen
      L3_2 = L3_2.Await
      L4_2 = L2_2
      L3_2(L4_2)
      if L2_2 then
        L1_2 = L2_2.value
      end
    end
    if not L1_2 then
      L2_2 = IsPedInAnyVehicle
      L3_2 = PlayerPedId
      L3_2 = L3_2()
      L4_2 = false
      L2_2 = L2_2(L3_2, L4_2)
      if L2_2 then
        L2_2 = GetVehiclePedIsIn
        L3_2 = PlayerPedId
        L3_2 = L3_2()
        L4_2 = false
        L2_2 = L2_2(L3_2, L4_2)
        L3_2 = utils
        L4_2 = L3_2
        L3_2 = L3_2.removeTrailSpaces
        L5_2 = GetVehicleNumberPlateText
        L6_2 = L2_2
        L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L5_2(L6_2)
        L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        L4_2 = A0_2.info
        L4_2 = L4_2.plate
        if L4_2 then
          L4_2 = A0_2.info
          L4_2 = L4_2.plate
          if L4_2 ~= L3_2 then
            L4_2 = TriggerServerEvent
            L5_2 = "MK_VehicleKeys:Server:GetPlateByFobId"
            L6_2 = A0_2
            L4_2(L5_2, L6_2)
          end
        else
          L4_2 = TriggerServerEvent
          L5_2 = "MK_VehicleKeys:Server:GetPlateByFobId"
          L6_2 = A0_2
          L4_2(L5_2, L6_2)
        end
        L4_2 = Entity
        L5_2 = L2_2
        L4_2 = L4_2(L5_2)
        L4_2 = L4_2.state
        L4_2 = L4_2.MKFOB
        if nil ~= L4_2 then
          L4_2 = Entity
          L5_2 = L2_2
          L4_2 = L4_2(L5_2)
          L4_2 = L4_2.state
          L4_2 = L4_2.MKFOB
          L5_2 = A0_2.info
          L5_2 = L5_2.id
          if L4_2 == L5_2 then
            L4_2 = TriggerEvent
            L5_2 = "MK_VehicleKeys:Client:ToggleEngine"
            L4_2(L5_2)
          else
            L4_2 = false
            L5_2 = Entity
            L6_2 = L2_2
            L5_2 = L5_2(L6_2)
            L5_2 = L5_2.state
            L5_2 = L5_2.MKOLDFOB
            if nil ~= L5_2 then
              L5_2 = pairs
              L6_2 = Entity
              L7_2 = L2_2
              L6_2 = L6_2(L7_2)
              L6_2 = L6_2.state
              L6_2 = L6_2.MKOLDFOB
              L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
              for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
                L11_2 = A0_2.info
                L11_2 = L11_2.id
                if L10_2 == L11_2 then
                  L4_2 = true
                  break
                end
              end
            end
            if L4_2 then
              L5_2 = utils
              L6_2 = L5_2
              L5_2 = L5_2.notify
              L7_2 = locale
              L8_2 = "old_fob"
              L7_2 = L7_2(L8_2)
              L8_2 = "error"
              L9_2 = 5000
              L5_2(L6_2, L7_2, L8_2, L9_2)
            else
              L5_2 = utils
              L6_2 = L5_2
              L5_2 = L5_2.notify
              L7_2 = locale
              L8_2 = "wrong_vehicle"
              L7_2 = L7_2(L8_2)
              L8_2 = "error"
              L9_2 = 5000
              L5_2(L6_2, L7_2, L8_2, L9_2)
            end
          end
        else
          L4_2 = Entity
          L5_2 = L2_2
          L4_2 = L4_2(L5_2)
          L4_2 = L4_2.state
          L4_2 = L4_2.MK_CheckFobData
          if not L4_2 then
            L4_2 = Entity
            L5_2 = L2_2
            L4_2 = L4_2(L5_2)
            L4_2 = L4_2.state
            L5_2 = L4_2
            L4_2 = L4_2.set
            L6_2 = "MK_CheckFobData"
            L7_2 = true
            L8_2 = true
            L4_2(L5_2, L6_2, L7_2, L8_2)
            L4_2 = promise
            L4_2 = L4_2.new
            L4_2 = L4_2()
            L5_2 = lib
            L5_2 = L5_2.callback
            L6_2 = "MK_VehicleKeys:Server:SetFobDataByPlate"
            L7_2 = false
            function L8_2(A0_3)
              local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
              L1_3 = L4_2
              L2_3 = L1_3
              L1_3 = L1_3.resolve
              L3_3 = A0_3
              L1_3(L2_3, L3_3)
              L1_3 = Citizen
              L1_3 = L1_3.Await
              L2_3 = L4_2
              L1_3(L2_3)
              L1_3 = L4_2
              if L1_3 then
                L1_3 = L4_2.value
                if L1_3 then
                  L1_3 = type
                  L2_3 = L4_2.value
                  L1_3 = L1_3(L2_3)
                  if "boolean" ~= L1_3 then
                    L1_3 = 0
                    while true do
                      L2_3 = Entity
                      L3_3 = L2_2
                      L2_3 = L2_3(L3_3)
                      L2_3 = L2_3.state
                      L2_3 = L2_3.MKFOB
                      if not (nil == L2_3 and L1_3 < 50) then
                        break
                      end
                      L2_3 = Wait
                      L3_3 = 100
                      L2_3(L3_3)
                      L1_3 = L1_3 + 1
                    end
                  end
                  L1_3 = Entity
                  L2_3 = L2_2
                  L1_3 = L1_3(L2_3)
                  L1_3 = L1_3.state
                  L2_3 = L1_3
                  L1_3 = L1_3.set
                  L3_3 = "MK_CheckFobData"
                  L4_3 = false
                  L5_3 = true
                  L1_3(L2_3, L3_3, L4_3, L5_3)
                  L1_3 = HasAuth
                  L2_3 = L2_2
                  L1_3 = L1_3(L2_3)
                  if L1_3 then
                    L1_3 = Wait
                    L2_3 = 300
                    L1_3(L2_3)
                    L1_3 = TriggerEvent
                    L2_3 = "MK_VehicleKeys:Client:ToggleEngine"
                    L1_3(L2_3)
                  else
                    L1_3 = false
                    L2_3 = Entity
                    L3_3 = L2_2
                    L2_3 = L2_3(L3_3)
                    L2_3 = L2_3.state
                    L2_3 = L2_3.MKOLDFOB
                    if nil ~= L2_3 then
                      L2_3 = pairs
                      L3_3 = Entity
                      L4_3 = L2_2
                      L3_3 = L3_3(L4_3)
                      L3_3 = L3_3.state
                      L3_3 = L3_3.MKOLDFOB
                      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
                      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
                        L8_3 = A0_2.info
                        L8_3 = L8_3.id
                        if L7_3 == L8_3 then
                          L1_3 = true
                          break
                        end
                      end
                    end
                    if L1_3 then
                      L2_3 = utils
                      L3_3 = L2_3
                      L2_3 = L2_3.notify
                      L4_3 = locale
                      L5_3 = "old_fob"
                      L4_3 = L4_3(L5_3)
                      L5_3 = "error"
                      L6_3 = 5000
                      L2_3(L3_3, L4_3, L5_3, L6_3)
                    else
                      L2_3 = utils
                      L3_3 = L2_3
                      L2_3 = L2_3.notify
                      L4_3 = locale
                      L5_3 = "wrong_vehicle"
                      L4_3 = L4_3(L5_3)
                      L5_3 = "error"
                      L6_3 = 5000
                      L2_3(L3_3, L4_3, L5_3, L6_3)
                    end
                  end
                else
                  L1_3 = utils
                  L2_3 = L1_3
                  L1_3 = L1_3.notify
                  L3_3 = locale
                  L4_3 = "wrong_vehicle"
                  L3_3 = L3_3(L4_3)
                  L4_3 = "error"
                  L5_3 = 5000
                  L1_3(L2_3, L3_3, L4_3, L5_3)
                end
              else
                L1_3 = utils
                L2_3 = L1_3
                L1_3 = L1_3.notify
                L3_3 = locale
                L4_3 = "wrong_vehicle"
                L3_3 = L3_3(L4_3)
                L4_3 = "error"
                L5_3 = 5000
                L1_3(L2_3, L3_3, L4_3, L5_3)
              end
            end
            L9_2 = utils
            L10_2 = L9_2
            L9_2 = L9_2.removeTrailSpaces
            L11_2 = GetVehicleNumberPlateText
            L12_2 = L2_2
            L11_2, L12_2 = L11_2(L12_2)
            L9_2 = L9_2(L10_2, L11_2, L12_2)
            L10_2 = NetworkGetNetworkIdFromEntity
            L11_2 = L2_2
            L10_2, L11_2, L12_2 = L10_2(L11_2)
            L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
          end
        end
      else
        L2_2 = GetGamePool
        L3_2 = "CVehicle"
        L2_2 = L2_2(L3_2)
        L3_2 = 0
        L4_2 = pairs
        L5_2 = L2_2
        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
        for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
          L10_2 = Entity
          L11_2 = L9_2
          L10_2 = L10_2(L11_2)
          L10_2 = L10_2.state
          L10_2 = L10_2.MKFOB
          if nil ~= L10_2 then
            L10_2 = Entity
            L11_2 = L9_2
            L10_2 = L10_2(L11_2)
            L10_2 = L10_2.state
            L10_2 = L10_2.MKFOB
            L11_2 = A0_2.info
            L11_2 = L11_2.id
            if L10_2 == L11_2 then
              L3_2 = L9_2
              break
            end
          end
        end
        if L3_2 > 0 then
          L4_2 = GetEntityCoords
          L5_2 = PlayerPedId
          L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L5_2()
          L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
          L5_2 = GetEntityCoords
          L6_2 = L3_2
          L5_2 = L5_2(L6_2)
          L6_2 = L4_2 - L5_2
          L6_2 = #L6_2
          L7_2 = Config
          L7_2 = L7_2.KeysAsItem
          L7_2 = L7_2.PlayerOwned
          L7_2 = L7_2.FobRange
          if L7_2 then
            L7_2 = Config
            L7_2 = L7_2.KeysAsItem
            L7_2 = L7_2.PlayerOwned
            L7_2 = L7_2.FobRange
            L8_2 = MaxFobRange
            if L7_2 < L8_2 then
              L7_2 = Config
              L7_2 = L7_2.KeysAsItem
              L7_2 = L7_2.PlayerOwned
              L7_2 = L7_2.FobRange
              if L7_2 then
                goto lbl_254
              end
            end
            L7_2 = 100
            if L7_2 then
              goto lbl_254
            end
          end
          L7_2 = 100
          ::lbl_254::
          if L6_2 <= L7_2 then
            L8_2 = Entity
            L9_2 = L3_2
            L8_2 = L8_2(L9_2)
            L8_2 = L8_2.state
            L8_2 = L8_2.LockBusy
            if not L8_2 then
              L8_2 = TriggerServerEvent
              L9_2 = "MK_VehicleKeys:Server:ToggleLocks"
              L10_2 = NetworkGetNetworkIdFromEntity
              L11_2 = L3_2
              L10_2 = L10_2(L11_2)
              L11_2 = L3_2
              L8_2(L9_2, L10_2, L11_2)
            end
          else
            L8_2 = utils
            L9_2 = L8_2
            L8_2 = L8_2.notify
            L10_2 = locale
            L11_2 = "fob_out_range"
            L10_2 = L10_2(L11_2)
            L11_2 = "error"
            L12_2 = 5000
            L8_2(L9_2, L10_2, L11_2, L12_2)
          end
          L8_2 = utils
          L9_2 = L8_2
          L8_2 = L8_2.removeTrailSpaces
          L10_2 = GetVehicleNumberPlateText
          L11_2 = L3_2
          L10_2, L11_2, L12_2 = L10_2(L11_2)
          L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
          L9_2 = A0_2.info
          L9_2 = L9_2.plate
          if L9_2 then
            L9_2 = A0_2.info
            L9_2 = L9_2.plate
            if L9_2 ~= L8_2 then
              L9_2 = TriggerServerEvent
              L10_2 = "MK_VehicleKeys:Server:GetPlateByFobId"
              L11_2 = A0_2
              L9_2(L10_2, L11_2)
            end
          else
            L9_2 = TriggerServerEvent
            L10_2 = "MK_VehicleKeys:Server:GetPlateByFobId"
            L11_2 = A0_2
            L9_2(L10_2, L11_2)
          end
        else
          L4_2 = promise
          L4_2 = L4_2.new
          L4_2 = L4_2()
          L5_2 = lib
          L5_2 = L5_2.callback
          L6_2 = "MK_VehicleKeys:Server:SetFobDataByFobId"
          L7_2 = false
          function L8_2(A0_3)
            local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
            L1_3 = L4_2
            L2_3 = L1_3
            L1_3 = L1_3.resolve
            L3_3 = A0_3
            L1_3(L2_3, L3_3)
            L1_3 = Citizen
            L1_3 = L1_3.Await
            L2_3 = L4_2
            L1_3(L2_3)
            L1_3 = L4_2
            if L1_3 then
              L1_3 = L4_2.value
              if L1_3 then
                L1_3 = type
                L2_3 = L4_2.value
                L1_3 = L1_3(L2_3)
                if "table" == L1_3 then
                  L1_3 = 0
                  while true do
                    L2_3 = Entity
                    L3_3 = L3_2
                    L2_3 = L2_3(L3_3)
                    L2_3 = L2_3.state
                    L2_3 = L2_3.MKFOB
                    if not (nil == L2_3 and L1_3 < 50) then
                      break
                    end
                    L2_3 = Wait
                    L3_3 = 100
                    L2_3(L3_3)
                    L1_3 = L1_3 + 1
                  end
                  L2_3 = GetGamePool
                  L3_3 = "CVehicle"
                  L2_3 = L2_3(L3_3)
                  L3_3 = 0
                  L4_3 = pairs
                  L5_3 = L2_3
                  L4_3, L5_3, L6_3, L7_3 = L4_3(L5_3)
                  for L8_3, L9_3 in L4_3, L5_3, L6_3, L7_3 do
                    L10_3 = Entity
                    L11_3 = L9_3
                    L10_3 = L10_3(L11_3)
                    L10_3 = L10_3.state
                    L10_3 = L10_3.MKFOB
                    if nil ~= L10_3 then
                      L10_3 = Entity
                      L11_3 = L9_3
                      L10_3 = L10_3(L11_3)
                      L10_3 = L10_3.state
                      L10_3 = L10_3.MKFOB
                      L11_3 = A0_2.info
                      L11_3 = L11_3.id
                      if L10_3 == L11_3 then
                        L3_3 = L9_3
                        break
                      end
                    end
                  end
                  if L3_3 > 0 then
                    L4_3 = GetEntityCoords
                    L5_3 = PlayerPedId
                    L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L5_3()
                    L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
                    L5_3 = GetEntityCoords
                    L6_3 = L3_3
                    L5_3 = L5_3(L6_3)
                    L6_3 = L4_3 - L5_3
                    L6_3 = #L6_3
                    L7_3 = Config
                    L7_3 = L7_3.KeysAsItem
                    L7_3 = L7_3.PlayerOwned
                    L7_3 = L7_3.FobRange
                    if L7_3 then
                      L7_3 = Config
                      L7_3 = L7_3.KeysAsItem
                      L7_3 = L7_3.PlayerOwned
                      L7_3 = L7_3.FobRange
                      L8_3 = MaxFobRange
                      if L7_3 < L8_3 then
                        L7_3 = Config
                        L7_3 = L7_3.KeysAsItem
                        L7_3 = L7_3.PlayerOwned
                        L7_3 = L7_3.FobRange
                        if L7_3 then
                          goto lbl_100
                        end
                      end
                      L7_3 = 100
                      if L7_3 then
                        goto lbl_100
                      end
                    end
                    L7_3 = 100
                    ::lbl_100::
                    if L6_3 <= L7_3 then
                      L8_3 = Entity
                      L9_3 = L3_3
                      L8_3 = L8_3(L9_3)
                      L8_3 = L8_3.state
                      L8_3 = L8_3.LockBusy
                      if not L8_3 then
                        L8_3 = TriggerServerEvent
                        L9_3 = "MK_VehicleKeys:Server:ToggleLocks"
                        L10_3 = NetworkGetNetworkIdFromEntity
                        L11_3 = L3_3
                        L10_3 = L10_3(L11_3)
                        L11_3 = L3_3
                        L8_3(L9_3, L10_3, L11_3)
                      end
                    else
                      L8_3 = utils
                      L9_3 = L8_3
                      L8_3 = L8_3.notify
                      L10_3 = locale
                      L11_3 = "fob_out_range"
                      L10_3 = L10_3(L11_3)
                      L11_3 = "error"
                      L12_3 = 5000
                      L8_3(L9_3, L10_3, L11_3, L12_3)
                    end
                    L8_3 = utils
                    L9_3 = L8_3
                    L8_3 = L8_3.removeTrailSpaces
                    L10_3 = GetVehicleNumberPlateText
                    L11_3 = L3_3
                    L10_3, L11_3, L12_3 = L10_3(L11_3)
                    L8_3 = L8_3(L9_3, L10_3, L11_3, L12_3)
                    L9_3 = A0_2.info
                    L9_3 = L9_3.plate
                    if L9_3 then
                      L9_3 = A0_2.info
                      L9_3 = L9_3.plate
                      if L9_3 ~= L8_3 then
                        L9_3 = TriggerServerEvent
                        L10_3 = "MK_VehicleKeys:Server:GetPlateByFobId"
                        L11_3 = A0_2
                        L9_3(L10_3, L11_3)
                      end
                    else
                      L9_3 = TriggerServerEvent
                      L10_3 = "MK_VehicleKeys:Server:GetPlateByFobId"
                      L11_3 = A0_2
                      L9_3(L10_3, L11_3)
                    end
                  else
                    L4_3 = utils
                    L5_3 = L4_3
                    L4_3 = L4_3.notify
                    L6_3 = locale
                    L7_3 = "fob_out_range"
                    L6_3 = L6_3(L7_3)
                    L7_3 = "error"
                    L8_3 = 5000
                    L4_3(L5_3, L6_3, L7_3, L8_3)
                  end
                else
                  L1_3 = utils
                  L2_3 = L1_3
                  L1_3 = L1_3.notify
                  L3_3 = locale
                  L4_3 = "fob_out_range"
                  L3_3 = L3_3(L4_3)
                  L4_3 = "error"
                  L5_3 = 5000
                  L1_3(L2_3, L3_3, L4_3, L5_3)
                end
              else
                L1_3 = utils
                L2_3 = L1_3
                L1_3 = L1_3.notify
                L3_3 = locale
                L4_3 = "fob_out_range"
                L3_3 = L3_3(L4_3)
                L4_3 = "error"
                L5_3 = 5000
                L1_3(L2_3, L3_3, L4_3, L5_3)
              end
            else
              L1_3 = utils
              L2_3 = L1_3
              L1_3 = L1_3.notify
              L3_3 = locale
              L4_3 = "fob_out_range"
              L3_3 = L3_3(L4_3)
              L4_3 = "error"
              L5_3 = 5000
              L1_3(L2_3, L3_3, L4_3, L5_3)
            end
          end
          L9_2 = A0_2.info
          L9_2 = L9_2.id
          L5_2(L6_2, L7_2, L8_2, L9_2)
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "MK_VehicleKeys:Client:EngineConfig"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if not A0_2 or 0 == A0_2 then
    return
  end
  L1_2 = 0
  L2_2 = 0
  L3_2 = NetworkGetEntityFromNetworkId
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  while 0 == L2_2 and L1_2 < 50 do
    L3_2 = Wait
    L4_2 = 100
    L3_2(L4_2)
    L3_2 = NetworkGetEntityFromNetworkId
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L2_2 = L3_2
    L1_2 = L1_2 + 1
  end
  if L2_2 > 0 then
    L3_2 = GetPedInVehicleSeat
    L4_2 = L2_2
    L5_2 = -1
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = PlayerPedId
    L4_2 = L4_2()
    if L3_2 == L4_2 then
      L3_2 = GetIsVehicleEngineRunning
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      if not L3_2 then
        L3_2 = Config
        L3_2 = L3_2.DisableAutoStartEngine
        if L3_2 then
          L3_2 = SetVehicleEngineOn
          L4_2 = L2_2
          L5_2 = false
          L6_2 = true
          L7_2 = true
          L3_2(L4_2, L5_2, L6_2, L7_2)
        else
          L3_2 = SetVehicleEngineOn
          L4_2 = L2_2
          L5_2 = true
          L6_2 = false
          L7_2 = Config
          L7_2 = L7_2.DisableAutoStartEngine
          if L7_2 then
            L7_2 = true
            if L7_2 then
              goto lbl_64
            end
          end
          L7_2 = false
          ::lbl_64::
          L3_2(L4_2, L5_2, L6_2, L7_2)
        end
      end
    end
  end
end
L0_1(L1_1, L2_1)
L0_1 = lib
L0_1 = L0_1.callback
L0_1 = L0_1.register
L1_1 = "MK_VehicleKeys:Client:GetFlyingAuth"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  if A0_2 then
    L1_2 = HasFlyingAuth
    L2_2 = NetworkGetEntityFromNetworkId
    L3_2 = A0_2
    L2_2, L3_2 = L2_2(L3_2)
    return L1_2(L2_2, L3_2)
  end
end
L0_1(L1_1, L2_1)
