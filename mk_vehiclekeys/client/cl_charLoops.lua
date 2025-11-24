local L0_1, L1_1
function L0_1()
  local L0_2, L1_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    while true do
      L0_3 = LocalPlayer
      L0_3 = L0_3.state
      L0_3 = L0_3.mk_isLoggedIn
      if not L0_3 then
        break
      end
      L0_3 = TakingKeys
      if not L0_3 then
        L0_3 = GetVehiclePedIsTryingToEnter
        L1_3 = PlayerPedId
        L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L1_3()
        L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
        if L0_3 > 0 then
          L0_3 = GetVehiclePedIsTryingToEnter
          L1_3 = PlayerPedId
          L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L1_3()
          L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
          L1_3 = cache
          L1_3 = L1_3.enteringVehicle
          if not L1_3 and L0_3 > 0 then
            L1_3 = cache
            L2_3 = L1_3
            L1_3 = L1_3.set
            L3_3 = "enteringVehicle"
            L4_3 = L0_3
            L1_3(L2_3, L3_3, L4_3)
          end
          L1_3 = GetPedInVehicleSeat
          L2_3 = L0_3
          L3_3 = -1
          L1_3 = L1_3(L2_3, L3_3)
          if not (L1_3 > 0) then
            goto lbl_219
          end
          L2_3 = IsPedAPlayer
          L3_3 = L1_3
          L2_3 = L2_3(L3_3)
          if L2_3 then
            goto lbl_219
          end
          L2_3 = Entity
          L3_3 = L1_3
          L2_3 = L2_3(L3_3)
          L2_3 = L2_3.state
          L2_3 = L2_3.MK_Disable_TakeKeys
          if L2_3 then
            goto lbl_219
          end
          L2_3 = Config
          L2_3 = L2_3.NpcVehicles
          L2_3 = L2_3.StealDriverKeys
          L2_3 = L2_3.Enabled
          if not L2_3 then
            goto lbl_219
          end
          L2_3 = Config
          L2_3 = L2_3.NpcVehicles
          L2_3 = L2_3.StealDriverKeys
          L2_3 = L2_3.RequireDriverDead
          if L2_3 then
            L2_3 = Config
            L2_3 = L2_3.NpcVehicles
            L2_3 = L2_3.StealDriverKeys
            L2_3 = L2_3.RequireDriverDead
            if not L2_3 then
              goto lbl_219
            end
            L2_3 = IsEntityDead
            L3_3 = L1_3
            L2_3 = L2_3(L3_3)
            if not L2_3 then
              L2_3 = GetEntityHealth
              L3_3 = L1_3
              L2_3 = L2_3(L3_3)
              if not (L2_3 <= 0) then
                L2_3 = IsPedDeadOrDying
                L3_3 = L1_3
                L4_3 = 1
                L2_3 = L2_3(L3_3, L4_3)
                if not L2_3 then
                  goto lbl_219
                end
              end
            end
          end
          L2_3 = IsStealDriverKeysBlacklist
          L3_3 = GetEntityModel
          L4_3 = L0_3
          L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L3_3(L4_3)
          L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
          if L2_3 then
            return
          end
          L2_3 = GetEntityCoords
          L3_3 = PlayerPedId
          L3_3 = L3_3()
          L4_3 = true
          L2_3 = L2_3(L3_3, L4_3)
          L3_3 = GetEntityCoords
          L4_3 = L1_3
          L5_3 = false
          L3_3 = L3_3(L4_3, L5_3)
          L4_3 = L2_3 - L3_3
          L4_3 = #L4_3
          L5_3 = GetVehicleDoorAngleRatio
          L6_3 = L0_3
          L7_3 = 0
          L5_3 = L5_3(L6_3, L7_3)
          if not (L5_3 > 0.0) then
            L5_3 = 1.5
            if not (L4_3 < L5_3) then
              goto lbl_219
            end
          end
          L5_3 = GetVehicleDoorLockStatus
          L6_3 = L0_3
          L5_3 = L5_3(L6_3)
          if 1 ~= L5_3 then
            goto lbl_219
          end
          TakingKeys = true
          L5_3 = "progressBar"
          L6_3 = nil
          L7_3 = Config
          L7_3 = L7_3.ProgressCircle
          if L7_3 then
            L5_3 = "progressCircle"
            L7_3 = Config
            L7_3 = L7_3.ProgressCirclePosition
            if L7_3 then
              L7_3 = Config
              L7_3 = L7_3.ProgressCirclePosition
              if L7_3 then
                goto lbl_133
                L6_3 = L7_3 or L6_3
              end
            end
            L6_3 = "middle"
          end
          ::lbl_133::
          L7_3 = lib
          L7_3 = L7_3[L5_3]
          L8_3 = {}
          L8_3.duration = 3000
          L9_3 = locale
          L10_3 = "taking_keys"
          L9_3 = L9_3(L10_3)
          L8_3.label = L9_3
          L8_3.position = L6_3
          L8_3.useWhileDead = false
          L8_3.canCancel = false
          L7_3 = L7_3(L8_3)
          if not L7_3 then
            goto lbl_219
          end
          L7_3 = SetEntityAsMissionEntity
          L8_3 = L0_3
          L9_3 = true
          L10_3 = true
          L7_3(L8_3, L9_3, L10_3)
          L7_3 = TriggerServerEvent
          L8_3 = "MK_VehicleKeys:Server:AddKey"
          L9_3 = NetworkGetNetworkIdFromEntity
          L10_3 = L0_3
          L9_3, L10_3, L11_3, L12_3, L13_3 = L9_3(L10_3)
          L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
          L7_3 = GetLabelText
          L8_3 = GetDisplayNameFromVehicleModel
          L9_3 = GetEntityModel
          L10_3 = L0_3
          L9_3, L10_3, L11_3, L12_3, L13_3 = L9_3(L10_3)
          L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
          L7_3 = L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
          if L7_3 then
            L7_3 = GetLabelText
            L8_3 = GetDisplayNameFromVehicleModel
            L9_3 = GetEntityModel
            L10_3 = L0_3
            L9_3, L10_3, L11_3, L12_3, L13_3 = L9_3(L10_3)
            L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
            L7_3 = L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
            if L7_3 then
              goto lbl_178
            end
          end
          L7_3 = "Unknown"
          ::lbl_178::
          L8_3 = Config
          L8_3 = L8_3.NpcVehicles
          L8_3 = L8_3.StealDriverKeys
          L8_3 = L8_3.SuccessFunction
          L9_3 = L0_3
          L10_3 = utils
          L11_3 = L10_3
          L10_3 = L10_3.removeTrailSpaces
          L12_3 = GetVehicleNumberPlateText
          L13_3 = L0_3
          L12_3, L13_3 = L12_3(L13_3)
          L10_3 = L10_3(L11_3, L12_3, L13_3)
          L11_3 = GetEntityCoords
          L12_3 = L0_3
          L13_3 = false
          L11_3 = L11_3(L12_3, L13_3)
          L12_3 = L7_3
          L8_3(L9_3, L10_3, L11_3, L12_3)
          L8_3 = SetVehicleEngineOn
          L9_3 = L0_3
          L10_3 = true
          L11_3 = false
          L12_3 = Config
          L12_3 = L12_3.DisableAutoStartEngine
          if L12_3 then
            L12_3 = true
            if L12_3 then
              goto lbl_207
            end
          end
          L12_3 = false
          ::lbl_207::
          L8_3(L9_3, L10_3, L11_3, L12_3)
          TakingKeys = false
        else
          L0_3 = cache
          L0_3 = L0_3.enteringVehicle
          if L0_3 then
            L0_3 = cache
            L1_3 = L0_3
            L0_3 = L0_3.set
            L2_3 = "enteringVehicle"
            L3_3 = false
            L0_3(L1_3, L2_3, L3_3)
          end
        end
      end
      ::lbl_219::
      L0_3 = Wait
      L1_3 = 250
      L0_3(L1_3)
    end
  end
  L0_2(L1_2)
end
StartLoops = L0_1
function L0_1()
  local L0_2, L1_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3
    while true do
      L0_3 = LocalPlayer
      L0_3 = L0_3.state
      L0_3 = L0_3.mk_isLoggedIn
      if not L0_3 then
        break
      end
      L0_3 = Armed
      if not L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 20
      L0_3(L1_3)
      L0_3 = IsPedInAnyVehicle
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = true
      L0_3 = L0_3(L1_3, L2_3)
      if not L0_3 then
        L0_3 = IsPlayerFreeAiming
        L1_3 = PlayerId
        L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L1_3()
        L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
        if L0_3 then
          L0_3 = GetEntityPlayerIsFreeAimingAt
          L1_3 = PlayerId
          L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L1_3()
          L0_3, L1_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
          L2_3 = IsPedArmed
          L3_3 = PlayerPedId
          L3_3 = L3_3()
          L4_3 = 4
          L2_3 = L2_3(L3_3, L4_3)
          if L2_3 then
            L2_3 = IsPedFleeing
            L3_3 = L1_3
            L2_3 = L2_3(L3_3)
            if not L2_3 then
              L2_3 = IsPedAPlayer
              L3_3 = L1_3
              L2_3 = L2_3(L3_3)
              if not L2_3 and L0_3 then
                L2_3 = PlayerPedId
                L2_3 = L2_3()
                L3_3 = GetEntityCoords
                L4_3 = L2_3
                L5_3 = true
                L3_3 = L3_3(L4_3, L5_3)
                L4_3 = GetEntityCoords
                L5_3 = L1_3
                L6_3 = true
                L4_3 = L4_3(L5_3, L6_3)
                L5_3 = DoesEntityExist
                L6_3 = L1_3
                L5_3 = L5_3(L6_3)
                if L5_3 then
                  L5_3 = IsEntityAPed
                  L6_3 = L1_3
                  L5_3 = L5_3(L6_3)
                  if L5_3 then
                    L5_3 = IsPedDeadOrDying
                    L6_3 = L1_3
                    L5_3 = L5_3(L6_3)
                    if not L5_3 then
                      L5_3 = GetEntityHealth
                      L6_3 = L1_3
                      L5_3 = L5_3(L6_3)
                      if L5_3 > 0 then
                        L5_3 = Entity
                        L6_3 = L1_3
                        L5_3 = L5_3(L6_3)
                        L5_3 = L5_3.state
                        L5_3 = L5_3.MK_Disable_CarJack
                        if not L5_3 then
                          L5_3 = L3_3 - L4_3
                          L5_3 = #L5_3
                          if L5_3 <= 6.0 then
                            L5_3 = IsPedInAnyVehicle
                            L6_3 = L1_3
                            L7_3 = true
                            L5_3 = L5_3(L6_3, L7_3)
                            if L5_3 then
                              L5_3 = IsCarjackBlacklist
                              L6_3 = GetEntityModel
                              L7_3 = GetVehiclePedIsIn
                              L8_3 = L1_3
                              L9_3 = false
                              L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L7_3(L8_3, L9_3)
                              L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                              L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                              if not L5_3 then
                                L5_3 = GetVehiclePedIsIn
                                L6_3 = L1_3
                                L7_3 = false
                                L5_3 = L5_3(L6_3, L7_3)
                                L6_3 = GetPedInVehicleSeat
                                L7_3 = L5_3
                                L8_3 = -1
                                L6_3 = L6_3(L7_3, L8_3)
                                if L6_3 == L1_3 then
                                  L6_3 = IsVehicleStopped
                                  L7_3 = L5_3
                                  L6_3 = L6_3(L7_3)
                                  if L6_3 then
                                    L6_3 = TaskLeaveVehicle
                                    L7_3 = L1_3
                                    L8_3 = L5_3
                                    L9_3 = 1
                                    L6_3(L7_3, L8_3, L9_3)
                                    L6_3 = 0
                                    while true do
                                      L7_3 = IsPedInAnyVehicle
                                      L8_3 = L1_3
                                      L9_3 = false
                                      L7_3 = L7_3(L8_3, L9_3)
                                      if not L7_3 then
                                        break
                                      end
                                      L7_3 = 1000
                                      if not (L6_3 < L7_3) then
                                        break
                                      end
                                      L7_3 = Wait
                                      L8_3 = 5
                                      L7_3(L8_3)
                                      L6_3 = L6_3 + 1
                                    end
                                    L7_3 = GetVehicleMaxNumberOfPassengers
                                    L8_3 = L5_3
                                    L7_3 = L7_3(L8_3)
                                    if L7_3 > 0 then
                                      L8_3 = 0
                                      repeat
                                        L9_3 = GetPedInVehicleSeat
                                        L10_3 = L5_3
                                        L11_3 = L8_3
                                        L9_3 = L9_3(L10_3, L11_3)
                                        if L9_3 > 0 then
                                          L9_3 = GetPedInVehicleSeat
                                          L10_3 = L5_3
                                          L11_3 = L8_3
                                          L9_3 = L9_3(L10_3, L11_3)
                                          L10_3 = IsPedAPlayer
                                          L11_3 = L9_3
                                          L10_3 = L10_3(L11_3)
                                          if not L10_3 then
                                            L10_3 = TaskLeaveVehicle
                                            L11_3 = L9_3
                                            L12_3 = L5_3
                                            L13_3 = 1
                                            L10_3(L11_3, L12_3, L13_3)
                                            L10_3 = 0
                                            while true do
                                              L11_3 = IsPedInAnyVehicle
                                              L12_3 = L9_3
                                              L13_3 = false
                                              L11_3 = L11_3(L12_3, L13_3)
                                              if not L11_3 then
                                                break
                                              end
                                              L11_3 = 1000
                                              if not (L10_3 < L11_3) then
                                                break
                                              end
                                              L11_3 = Wait
                                              L12_3 = 5
                                              L11_3(L12_3)
                                              L10_3 = L10_3 + 1
                                            end
                                            L11_3 = SetPedDropsWeaponsWhenDead
                                            L12_3 = L9_3
                                            L13_3 = false
                                            L11_3(L12_3, L13_3)
                                            L11_3 = ClearPedTasksImmediately
                                            L12_3 = L9_3
                                            L11_3(L12_3)
                                            L11_3 = TaskSetBlockingOfNonTemporaryEvents
                                            L12_3 = L9_3
                                            L13_3 = true
                                            L11_3(L12_3, L13_3)
                                            L11_3 = SetPedCombatAttributes
                                            L12_3 = L9_3
                                            L13_3 = 1
                                            L14_3 = false
                                            L11_3(L12_3, L13_3, L14_3)
                                            L11_3 = SetPedCombatAttributes
                                            L12_3 = L9_3
                                            L13_3 = 46
                                            L14_3 = false
                                            L11_3(L12_3, L13_3, L14_3)
                                            L11_3 = ResetPedLastVehicle
                                            L12_3 = L9_3
                                            L11_3(L12_3)
                                            L11_3 = TaskReactAndFleePed
                                            L12_3 = L9_3
                                            L13_3 = PlayerPedId
                                            L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L13_3()
                                            L11_3(L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                            L11_3 = SetPedKeepTask
                                            L12_3 = L9_3
                                            L13_3 = true
                                            L11_3(L12_3, L13_3)
                                          end
                                        end
                                        L8_3 = L8_3 + 1
                                        L9_3 = Wait
                                        L10_3 = 100
                                        L9_3(L10_3)
                                      until L8_3 == L7_3
                                    end
                                    L8_3 = RequestAnimDict
                                    L9_3 = "missfbi5ig_22"
                                    L8_3(L9_3)
                                    while true do
                                      L8_3 = HasAnimDictLoaded
                                      L9_3 = "missfbi5ig_22"
                                      L8_3 = L8_3(L9_3)
                                      if L8_3 then
                                        break
                                      end
                                      L8_3 = RequestAnimDict
                                      L9_3 = "missfbi5ig_22"
                                      L8_3(L9_3)
                                      L8_3 = Wait
                                      L9_3 = 100
                                      L8_3(L9_3)
                                    end
                                    L8_3 = RequestAnimDict
                                    L9_3 = "mp_common"
                                    L8_3(L9_3)
                                    while true do
                                      L8_3 = HasAnimDictLoaded
                                      L9_3 = "mp_common"
                                      L8_3 = L8_3(L9_3)
                                      if L8_3 then
                                        break
                                      end
                                      L8_3 = RequestAnimDict
                                      L9_3 = "mp_common"
                                      L8_3(L9_3)
                                      L8_3 = Wait
                                      L9_3 = 100
                                      L8_3(L9_3)
                                    end
                                    L8_3 = Config
                                    L8_3 = L8_3.PoliceNotify
                                    if L8_3 then
                                      L8_3 = Config
                                      L8_3 = L8_3.PoliceNotify
                                      L8_3 = L8_3.Chance
                                      if L8_3 then
                                        L8_3 = Config
                                        L8_3 = L8_3.PoliceNotify
                                        L8_3 = L8_3.AlertTimeout
                                        if L8_3 then
                                          L8_3 = AlertCooldown
                                          if L8_3 then
                                            goto lbl_358
                                          end
                                          L8_3 = math
                                          L8_3 = L8_3.random
                                          L9_3 = 1
                                          L10_3 = 100
                                          L8_3 = L8_3(L9_3, L10_3)
                                          L9_3 = Config
                                          L9_3 = L9_3.PoliceNotify
                                          L9_3 = L9_3.Chance
                                          if not (L8_3 < L9_3) then
                                            goto lbl_358
                                          end
                                          L9_3 = utils
                                          L10_3 = L9_3
                                          L9_3 = L9_3.removeTrailSpaces
                                          L11_3 = GetVehicleNumberPlateText
                                          L12_3 = L5_3
                                          L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L11_3(L12_3)
                                          L9_3 = L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                          L10_3 = GetEntityCoords
                                          L11_3 = L5_3
                                          L10_3 = L10_3(L11_3)
                                          L11_3 = GetLabelText
                                          L12_3 = GetDisplayNameFromVehicleModel
                                          L13_3 = GetEntityModel
                                          L14_3 = L5_3
                                          L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L13_3(L14_3)
                                          L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                          L11_3 = L11_3(L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                          if L11_3 then
                                            L11_3 = GetLabelText
                                            L12_3 = GetDisplayNameFromVehicleModel
                                            L13_3 = GetEntityModel
                                            L14_3 = L5_3
                                            L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L13_3(L14_3)
                                            L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                            L11_3 = L11_3(L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                            if L11_3 then
                                              goto lbl_309
                                            end
                                          end
                                          L11_3 = "Unknown"
                                          ::lbl_309::
                                          AlertCooldown = true
                                          L12_3 = framework
                                          L13_3 = L12_3
                                          L12_3 = L12_3.policeDispatchNotify
                                          L14_3 = {}
                                          L14_3.coords = L10_3
                                          L14_3.plate = L9_3
                                          L14_3.vehicleName = L11_3
                                          L14_3.vehicle = L5_3
                                          L15_3 = locale
                                          L16_3 = "dispatch_alert_message"
                                          L15_3 = L15_3(L16_3)
                                          L14_3.message = L15_3
                                          L15_3 = locale
                                          L16_3 = "dispatch_alert_blip_text"
                                          L15_3 = L15_3(L16_3)
                                          L14_3.blipText = L15_3
                                          L15_3 = GetEntityModel
                                          L16_3 = L5_3
                                          L15_3 = L15_3(L16_3)
                                          L14_3.modelHash = L15_3
                                          L15_3 = vehicles
                                          L16_3 = GetEntityModel
                                          L17_3 = L5_3
                                          L16_3 = L16_3(L17_3)
                                          L15_3 = L15_3[L16_3]
                                          if L15_3 then
                                            L15_3 = L15_3.name
                                          end
                                          L14_3.modelString = L15_3
                                          L12_3(L13_3, L14_3)
                                          L12_3 = SetTimeout
                                          L13_3 = Config
                                          L13_3 = L13_3.PoliceNotify
                                          L13_3 = L13_3.AlertTimeout
                                          L13_3 = L13_3 * 1000
                                          function L14_3()
                                            local L0_4, L1_4
                                            AlertCooldown = false
                                          end
                                          L12_3(L13_3, L14_3)
                                      end
                                      else
                                        L8_3 = utils
                                        L8_3 = L8_3.logger
                                        L9_3 = L8_3
                                        L8_3 = L8_3.error
                                        L10_3 = "VehicleKeys"
                                        L11_3 = "^5Police Notify not setup properly; See Config.^7"
                                        L12_3 = {}
                                        L12_3.console = true
                                        L8_3(L9_3, L10_3, L11_3, L12_3)
                                      end
                                    end
                                    ::lbl_358::
                                    L8_3 = SetPedDropsWeaponsWhenDead
                                    L9_3 = L1_3
                                    L10_3 = false
                                    L8_3(L9_3, L10_3)
                                    L8_3 = ClearPedTasksImmediately
                                    L9_3 = L1_3
                                    L8_3(L9_3)
                                    L8_3 = TaskTurnPedToFaceEntity
                                    L9_3 = L1_3
                                    L10_3 = PlayerPedId
                                    L10_3 = L10_3()
                                    L11_3 = 3.0
                                    L8_3(L9_3, L10_3, L11_3)
                                    L8_3 = TaskSetBlockingOfNonTemporaryEvents
                                    L9_3 = L1_3
                                    L10_3 = true
                                    L8_3(L9_3, L10_3)
                                    L8_3 = SetPedFleeAttributes
                                    L9_3 = L1_3
                                    L10_3 = 0
                                    L11_3 = 0
                                    L8_3(L9_3, L10_3, L11_3)
                                    L8_3 = SetPedCombatAttributes
                                    L9_3 = L1_3
                                    L10_3 = 17
                                    L11_3 = 1
                                    L8_3(L9_3, L10_3, L11_3)
                                    L8_3 = SetPedCombatAttributes
                                    L9_3 = L1_3
                                    L10_3 = 46
                                    L11_3 = false
                                    L8_3(L9_3, L10_3, L11_3)
                                    L8_3 = ResetPedLastVehicle
                                    L9_3 = L1_3
                                    L8_3(L9_3)
                                    L8_3 = SetPedSeeingRange
                                    L9_3 = L1_3
                                    L10_3 = 0.0
                                    L8_3(L9_3, L10_3)
                                    L8_3 = SetPedHearingRange
                                    L9_3 = L1_3
                                    L10_3 = 0.0
                                    L8_3(L9_3, L10_3)
                                    L8_3 = SetPedAlertness
                                    L9_3 = L1_3
                                    L10_3 = 0
                                    L8_3(L9_3, L10_3)
                                    L8_3 = SetPedKeepTask
                                    L9_3 = L1_3
                                    L10_3 = true
                                    L8_3(L9_3, L10_3)
                                    L8_3 = TaskPlayAnim
                                    L9_3 = L1_3
                                    L10_3 = "missfbi5ig_22"
                                    L11_3 = "hands_up_anxious_scientist"
                                    L12_3 = 8.0
                                    L13_3 = -8
                                    L14_3 = -1
                                    L15_3 = 12
                                    L16_3 = 1
                                    L17_3 = 0
                                    L18_3 = 0
                                    L19_3 = 0
                                    L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
                                    L8_3 = Wait
                                    L9_3 = 1500
                                    L8_3(L9_3)
                                    L8_3 = TaskPlayAnim
                                    L9_3 = L1_3
                                    L10_3 = "missfbi5ig_22"
                                    L11_3 = "hands_up_anxious_scientist"
                                    L12_3 = 8.0
                                    L13_3 = -8
                                    L14_3 = -1
                                    L15_3 = 12
                                    L16_3 = 1
                                    L17_3 = 0
                                    L18_3 = 0
                                    L19_3 = 0
                                    L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
                                    L8_3 = Wait
                                    L9_3 = 2500
                                    L8_3(L9_3)
                                    L8_3 = GetEntityCoords
                                    L9_3 = PlayerPedId
                                    L9_3 = L9_3()
                                    L10_3 = true
                                    L8_3 = L8_3(L9_3, L10_3)
                                    L9_3 = GetEntityCoords
                                    L10_3 = L5_3
                                    L11_3 = true
                                    L9_3 = L9_3(L10_3, L11_3)
                                    L8_3 = L8_3 - L9_3
                                    L8_3 = #L8_3
                                    L9_3 = IsEntityDead
                                    L10_3 = L1_3
                                    L9_3 = L9_3(L10_3)
                                    if not L9_3 then
                                      L9_3 = DoesEntityExist
                                      L10_3 = L1_3
                                      L9_3 = L9_3(L10_3)
                                      if L9_3 then
                                        L9_3 = IsPedDeadOrDying
                                        L10_3 = L1_3
                                        L11_3 = 1
                                        L9_3 = L9_3(L10_3, L11_3)
                                        if not L9_3 then
                                          L9_3 = GetEntityHealth
                                          L10_3 = L1_3
                                          L9_3 = L9_3(L10_3)
                                          if L9_3 > 0.0 and L8_3 < 12 then
                                            L9_3 = TaskPlayAnim
                                            L10_3 = L1_3
                                            L11_3 = "mp_common"
                                            L12_3 = "givetake1_a"
                                            L13_3 = 8.0
                                            L14_3 = -8
                                            L15_3 = -1
                                            L16_3 = 12
                                            L17_3 = 1
                                            L18_3 = 0
                                            L19_3 = 0
                                            L20_3 = 0
                                            L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                            L9_3 = Wait
                                            L10_3 = 750
                                            L9_3(L10_3)
                                            L9_3 = SetEntityAsMissionEntity
                                            L10_3 = L5_3
                                            L11_3 = true
                                            L12_3 = true
                                            L9_3(L10_3, L11_3, L12_3)
                                            L9_3 = TriggerServerEvent
                                            L10_3 = "MK_VehicleKeys:Server:AddKey"
                                            L11_3 = NetworkGetNetworkIdFromEntity
                                            L12_3 = L5_3
                                            L11_3 = L11_3(L12_3)
                                            L12_3 = false
                                            L13_3 = false
                                            L14_3 = false
                                            L15_3 = true
                                            L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
                                            L9_3 = GetLabelText
                                            L10_3 = GetDisplayNameFromVehicleModel
                                            L11_3 = GetEntityModel
                                            L12_3 = L5_3
                                            L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L11_3(L12_3)
                                            L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                            L9_3 = L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                            if L9_3 then
                                              L9_3 = GetLabelText
                                              L10_3 = GetDisplayNameFromVehicleModel
                                              L11_3 = GetEntityModel
                                              L12_3 = L5_3
                                              L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L11_3(L12_3)
                                              L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                              L9_3 = L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                              if L9_3 then
                                                goto lbl_526
                                              end
                                            end
                                            L9_3 = "Unknown"
                                            ::lbl_526::
                                            L10_3 = Config
                                            L10_3 = L10_3.NpcVehicles
                                            L10_3 = L10_3.Carjacking
                                            L10_3 = L10_3.SuccessFunction
                                            L11_3 = L5_3
                                            L12_3 = utils
                                            L13_3 = L12_3
                                            L12_3 = L12_3.removeTrailSpaces
                                            L14_3 = GetVehicleNumberPlateText
                                            L15_3 = L5_3
                                            L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L14_3(L15_3)
                                            L12_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                            L13_3 = GetEntityCoords
                                            L14_3 = L5_3
                                            L15_3 = false
                                            L13_3 = L13_3(L14_3, L15_3)
                                            L14_3 = L9_3
                                            L10_3(L11_3, L12_3, L13_3, L14_3)
                                            L10_3 = SetVehicleEngineOn
                                            L11_3 = L5_3
                                            L12_3 = true
                                            L13_3 = false
                                            L14_3 = Config
                                            L14_3 = L14_3.DisableAutoStartEngine
                                            if L14_3 then
                                              L14_3 = true
                                              if L14_3 then
                                                goto lbl_555
                                              end
                                            end
                                            L14_3 = false
                                            ::lbl_555::
                                            L10_3(L11_3, L12_3, L13_3, L14_3)
                                            L10_3 = Wait
                                            L11_3 = 500
                                            L10_3(L11_3)
                                            L10_3 = TaskReactAndFleePed
                                            L11_3 = L1_3
                                            L12_3 = PlayerPedId
                                            L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L12_3()
                                            L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                            L10_3 = SetPedKeepTask
                                            L11_3 = L1_3
                                            L12_3 = true
                                            L10_3(L11_3, L12_3)
                                            L10_3 = Wait
                                            L11_3 = 2500
                                            L10_3(L11_3)
                                            L10_3 = TaskReactAndFleePed
                                            L11_3 = L1_3
                                            L12_3 = PlayerPedId
                                            L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L12_3()
                                            L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                            L10_3 = SetPedKeepTask
                                            L11_3 = L1_3
                                            L12_3 = true
                                            L10_3(L11_3, L12_3)
                                            L10_3 = Wait
                                            L11_3 = 2500
                                            L10_3(L11_3)
                                            L10_3 = TaskReactAndFleePed
                                            L11_3 = L1_3
                                            L12_3 = PlayerPedId
                                            L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L12_3()
                                            L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                            L10_3 = SetPedKeepTask
                                            L11_3 = L1_3
                                            L12_3 = true
                                            L10_3(L11_3, L12_3)
                                            L10_3 = Wait
                                            L11_3 = 2500
                                            L10_3(L11_3)
                                            L10_3 = TaskReactAndFleePed
                                            L11_3 = L1_3
                                            L12_3 = PlayerPedId
                                            L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3 = L12_3()
                                            L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                                            L10_3 = SetPedKeepTask
                                            L11_3 = L1_3
                                            L12_3 = true
                                            L10_3(L11_3, L12_3)
                                          end
                                        end
                                      end
                                    end
                                    L9_3 = ClearPedTasks
                                    L10_3 = L1_3
                                    L9_3(L10_3)
                                    L9_3 = Wait
                                    L10_3 = 1000
                                    L9_3(L10_3)
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
              end
            end
          end
        end
      end
    end
    L0_3 = Armed
    if L0_3 then
      Armed = false
    end
  end
  L0_2(L1_2)
end
WeaponLoop = L0_1
