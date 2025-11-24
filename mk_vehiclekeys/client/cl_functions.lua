local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = false
L1_1 = false
L2_1 = false
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if not A0_2 then
    L1_2 = false
    return L1_2
  end
  if 0 == A0_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = IsThisModelABicycle
  L2_2 = GetEntityModel
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L2_2(L3_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  if not L1_2 then
    L1_2 = IsWhitelisted
    L2_2 = GetEntityModel
    L3_2 = A0_2
    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L2_2(L3_2)
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
    if not L1_2 then
      goto lbl_32
    end
  end
  L1_2 = true
  do return L1_2 end
  ::lbl_32::
  L1_2 = false
  L2_2 = Config
  L2_2 = L2_2.KeysAsItem
  L2_2 = L2_2.PlayerOwned
  L2_2 = L2_2.Enabled
  if L2_2 then
    L2_2 = Entity
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L2_2 = L2_2.state
    L2_2 = L2_2.MKFOB
    if nil == L2_2 then
      L2_2 = Entity
      L3_2 = A0_2
      L2_2 = L2_2(L3_2)
      L2_2 = L2_2.state
      L2_2 = L2_2.Keys
      if L2_2 then
        L2_2 = pairs
        L3_2 = Entity
        L4_2 = A0_2
        L3_2 = L3_2(L4_2)
        L3_2 = L3_2.state
        L3_2 = L3_2.Keys
        L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
        for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
          L8_2 = LocalPlayer
          L8_2 = L8_2.state
          L8_2 = L8_2.mk_identifier
          if L7_2 == L8_2 then
            L1_2 = true
            break
          end
        end
        return L1_2
      else
        L2_2 = false
        return L2_2
      end
    else
      L2_2 = inventory
      L3_2 = L2_2
      L2_2 = L2_2.hasItem
      L4_2 = Config
      L4_2 = L4_2.KeysAsItem
      L4_2 = L4_2.PlayerOwned
      L4_2 = L4_2.ItemName
      L5_2 = {}
      L6_2 = Entity
      L7_2 = A0_2
      L6_2 = L6_2(L7_2)
      L6_2 = L6_2.state
      L6_2 = L6_2.MKFOB
      L5_2.id = L6_2
      L6_2 = true
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
      if L2_2 then
        L2_2 = true
        return L2_2
      else
        L2_2 = Entity
        L3_2 = A0_2
        L2_2 = L2_2(L3_2)
        L2_2 = L2_2.state
        L2_2 = L2_2.Keys
        if L2_2 then
          L2_2 = pairs
          L3_2 = Entity
          L4_2 = A0_2
          L3_2 = L3_2(L4_2)
          L3_2 = L3_2.state
          L3_2 = L3_2.Keys
          L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
          for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
            L8_2 = LocalPlayer
            L8_2 = L8_2.state
            L8_2 = L8_2.mk_identifier
            if L7_2 == L8_2 then
              L1_2 = true
              break
            end
          end
          return L1_2
        else
          L2_2 = false
          return L2_2
        end
      end
    end
  else
    L2_2 = Entity
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L2_2 = L2_2.state
    L2_2 = L2_2.Keys
    if L2_2 then
      L2_2 = pairs
      L3_2 = Entity
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      L3_2 = L3_2.state
      L3_2 = L3_2.Keys
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = LocalPlayer
        L8_2 = L8_2.state
        L8_2 = L8_2.mk_identifier
        if L7_2 == L8_2 then
          L1_2 = true
          break
        end
      end
      return L1_2
    else
      L2_2 = false
      return L2_2
    end
  end
end
HasAuth = L3_1
L3_1 = exports
L4_1 = "HasKey"
L5_1 = HasAuth
L3_1(L4_1, L5_1)
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if not A0_2 then
    L1_2 = utils
    L2_2 = L1_2
    L1_2 = L1_2.notify
    L3_2 = locale
    L4_2 = "cant_find_veh"
    L3_2 = L3_2(L4_2)
    L4_2 = "primary"
    L5_2 = 5000
    L1_2(L2_2, L3_2, L4_2, L5_2)
    return
  end
  if 0 == A0_2 then
    L1_2 = utils
    L2_2 = L1_2
    L1_2 = L1_2.notify
    L3_2 = locale
    L4_2 = "cant_find_veh"
    L3_2 = L3_2(L4_2)
    L4_2 = "primary"
    L5_2 = 5000
    L1_2(L2_2, L3_2, L4_2, L5_2)
    return
  end
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = utils
    L2_2 = L1_2
    L1_2 = L1_2.notify
    L3_2 = locale
    L4_2 = "cant_find_veh"
    L3_2 = L3_2(L4_2)
    L4_2 = "primary"
    L5_2 = 5000
    L1_2(L2_2, L3_2, L4_2, L5_2)
    return
  end
  L1_2 = IsEntityAMissionEntity
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = SetEntityAsMissionEntity
    L2_2 = A0_2
    L3_2 = true
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
  end
  L1_2 = 0
  while true do
    L2_2 = DoesEntityExist
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if not (not L2_2 and L1_2 < 30) then
      break
    end
    L2_2 = Wait
    L3_2 = 100
    L2_2(L3_2)
    L1_2 = L1_2 + 1
  end
  L2_2 = IsThisModelABicycle
  L3_2 = GetEntityModel
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  if not L2_2 then
    L2_2 = IsWhitelisted
    L3_2 = GetEntityModel
    L4_2 = A0_2
    L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L3_2(L4_2)
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
    if not L2_2 then
      goto lbl_76
    end
  end
  do return end
  ::lbl_76::
  L2_2 = Config
  L2_2 = L2_2.KeysAsItem
  L2_2 = L2_2.PlayerOwned
  L2_2 = L2_2.Enabled
  if L2_2 then
    L2_2 = 0
    while true do
      L3_2 = NetworkGetEntityOwner
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      L4_2 = PlayerId
      L4_2 = L4_2()
      if not (L3_2 ~= L4_2 and L2_2 < 50) then
        break
      end
      L3_2 = Wait
      L4_2 = 100
      L3_2(L4_2)
      L2_2 = L2_2 + 1
    end
    L3_2 = CheckFob
    L4_2 = A0_2
    L5_2 = utils
    L6_2 = L5_2
    L5_2 = L5_2.removeTrailSpaces
    L7_2 = GetVehicleNumberPlateText
    L8_2 = A0_2
    L7_2, L8_2 = L7_2(L8_2)
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2)
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    if L3_2 then
      goto lbl_200
    end
    L3_2 = TriggerServerEvent
    L4_2 = "MK_VehicleKeys:Server:AddKey"
    L5_2 = NetworkGetNetworkIdFromEntity
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    L6_2 = false
    L7_2 = false
    L3_2(L4_2, L5_2, L6_2, L7_2)
    L3_2 = GetPedInVehicleSeat
    L4_2 = A0_2
    L5_2 = -1
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = PlayerPedId
    L4_2 = L4_2()
    if L3_2 ~= L4_2 then
      goto lbl_200
    end
    L3_2 = GetIsVehicleEngineRunning
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_200
    end
    L3_2 = Config
    L3_2 = L3_2.DisableAutoStartEngine
    if L3_2 then
      L3_2 = SetVehicleEngineOn
      L4_2 = A0_2
      L5_2 = false
      L6_2 = true
      L7_2 = true
      L3_2(L4_2, L5_2, L6_2, L7_2)
    else
      L3_2 = SetVehicleEngineOn
      L4_2 = A0_2
      L5_2 = true
      L6_2 = false
      L7_2 = Config
      L7_2 = L7_2.DisableAutoStartEngine
      if L7_2 then
        L7_2 = true
        if L7_2 then
          goto lbl_153
        end
      end
      L7_2 = false
      ::lbl_153::
      L3_2(L4_2, L5_2, L6_2, L7_2)
    end
  else
    L2_2 = TriggerServerEvent
    L3_2 = "MK_VehicleKeys:Server:AddKey"
    L4_2 = NetworkGetNetworkIdFromEntity
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L5_2 = false
    L6_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = GetPedInVehicleSeat
    L3_2 = A0_2
    L4_2 = -1
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = PlayerPedId
    L3_2 = L3_2()
    if L2_2 == L3_2 then
      L2_2 = GetIsVehicleEngineRunning
      L3_2 = A0_2
      L2_2 = L2_2(L3_2)
      if not L2_2 then
        L2_2 = Config
        L2_2 = L2_2.DisableAutoStartEngine
        if L2_2 then
          L2_2 = SetVehicleEngineOn
          L3_2 = A0_2
          L4_2 = false
          L5_2 = true
          L6_2 = true
          L2_2(L3_2, L4_2, L5_2, L6_2)
        else
          L2_2 = SetVehicleEngineOn
          L3_2 = A0_2
          L4_2 = true
          L5_2 = false
          L6_2 = Config
          L6_2 = L6_2.DisableAutoStartEngine
          if L6_2 then
            L6_2 = true
            if L6_2 then
              goto lbl_199
            end
          end
          L6_2 = false
          ::lbl_199::
          L2_2(L3_2, L4_2, L5_2, L6_2)
        end
      end
    end
  end
  ::lbl_200::
end
AddKey = L3_1
L3_1 = exports
L4_1 = "AddKey"
L5_1 = AddKey
L3_1(L4_1, L5_1)
L3_1 = exports
L4_1 = "GiveKey"
L5_1 = AddKey
L3_1(L4_1, L5_1)
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if not A0_2 then
    L1_2 = utils
    L2_2 = L1_2
    L1_2 = L1_2.notify
    L3_2 = locale
    L4_2 = "cant_find_veh"
    L3_2 = L3_2(L4_2)
    L4_2 = "primary"
    L5_2 = 5000
    L1_2(L2_2, L3_2, L4_2, L5_2)
    return
  end
  if 0 == A0_2 then
    L1_2 = utils
    L2_2 = L1_2
    L1_2 = L1_2.notify
    L3_2 = locale
    L4_2 = "cant_find_veh"
    L3_2 = L3_2(L4_2)
    L4_2 = "primary"
    L5_2 = 5000
    L1_2(L2_2, L3_2, L4_2, L5_2)
    return
  end
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = utils
    L2_2 = L1_2
    L1_2 = L1_2.notify
    L3_2 = locale
    L4_2 = "cant_find_veh"
    L3_2 = L3_2(L4_2)
    L4_2 = "primary"
    L5_2 = 5000
    L1_2(L2_2, L3_2, L4_2, L5_2)
    return
  end
  if 0 ~= A0_2 then
    L1_2 = tonumber
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_53
    end
  end
  L1_2 = utils
  L2_2 = L1_2
  L1_2 = L1_2.notify
  L3_2 = locale
  L4_2 = "cant_find_veh"
  L3_2 = L3_2(L4_2)
  L4_2 = "primary"
  L5_2 = 5000
  L1_2(L2_2, L3_2, L4_2, L5_2)
  do return end
  ::lbl_53::
  L1_2 = SetEntityAsMissionEntity
  L2_2 = A0_2
  L3_2 = true
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = 0
  while true do
    L2_2 = DoesEntityExist
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if not (not L2_2 and L1_2 < 30) then
      break
    end
    L2_2 = Wait
    L3_2 = 100
    L2_2(L3_2)
    L1_2 = L1_2 + 1
  end
  L2_2 = Config
  L2_2 = L2_2.KeysAsItem
  L2_2 = L2_2.PlayerOwned
  L2_2 = L2_2.Enabled
  if L2_2 then
    L2_2 = 0
    while true do
      L3_2 = NetworkGetEntityOwner
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      L4_2 = PlayerId
      L4_2 = L4_2()
      if not (L3_2 ~= L4_2 and L2_2 < 50) then
        break
      end
      L3_2 = Wait
      L4_2 = 100
      L3_2(L4_2)
      L2_2 = L2_2 + 1
    end
    L3_2 = Wait
    L4_2 = 2000
    L3_2(L4_2)
    L3_2 = CheckFob
    L4_2 = A0_2
    L5_2 = utils
    L6_2 = L5_2
    L5_2 = L5_2.removeTrailSpaces
    L7_2 = GetVehicleNumberPlateText
    L8_2 = A0_2
    L7_2, L8_2 = L7_2(L8_2)
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L6_2 = true
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    if L3_2 then
      goto lbl_218
    end
    L3_2 = Entity
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L3_2 = L3_2.state
    L4_2 = L3_2
    L3_2 = L3_2.set
    L5_2 = "Keys"
    L6_2 = nil
    L7_2 = true
    L3_2(L4_2, L5_2, L6_2, L7_2)
    L3_2 = TriggerServerEvent
    L4_2 = "MK_VehicleKeys:Server:AddKey"
    L5_2 = NetworkGetNetworkIdFromEntity
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    L6_2 = false
    L7_2 = false
    L3_2(L4_2, L5_2, L6_2, L7_2)
    L3_2 = GetPedInVehicleSeat
    L4_2 = A0_2
    L5_2 = -1
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = PlayerPedId
    L4_2 = L4_2()
    if L3_2 ~= L4_2 then
      goto lbl_218
    end
    L3_2 = GetIsVehicleEngineRunning
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_218
    end
    L3_2 = Config
    L3_2 = L3_2.DisableAutoStartEngine
    if L3_2 then
      L3_2 = SetVehicleEngineOn
      L4_2 = A0_2
      L5_2 = false
      L6_2 = true
      L7_2 = true
      L3_2(L4_2, L5_2, L6_2, L7_2)
    else
      L3_2 = SetVehicleEngineOn
      L4_2 = A0_2
      L5_2 = true
      L6_2 = false
      L7_2 = Config
      L7_2 = L7_2.DisableAutoStartEngine
      if L7_2 then
        L7_2 = true
        if L7_2 then
          goto lbl_162
        end
      end
      L7_2 = false
      ::lbl_162::
      L3_2(L4_2, L5_2, L6_2, L7_2)
    end
  else
    L2_2 = Entity
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L2_2 = L2_2.state
    L3_2 = L2_2
    L2_2 = L2_2.set
    L4_2 = "Keys"
    L5_2 = nil
    L6_2 = true
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = TriggerServerEvent
    L3_2 = "MK_VehicleKeys:Server:AddKey"
    L4_2 = NetworkGetNetworkIdFromEntity
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L5_2 = false
    L6_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = GetPedInVehicleSeat
    L3_2 = A0_2
    L4_2 = -1
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = PlayerPedId
    L3_2 = L3_2()
    if L2_2 == L3_2 then
      L2_2 = GetIsVehicleEngineRunning
      L3_2 = A0_2
      L2_2 = L2_2(L3_2)
      if not L2_2 then
        L2_2 = Config
        L2_2 = L2_2.DisableAutoStartEngine
        if L2_2 then
          L2_2 = SetVehicleEngineOn
          L3_2 = A0_2
          L4_2 = false
          L5_2 = true
          L6_2 = true
          L2_2(L3_2, L4_2, L5_2, L6_2)
        else
          L2_2 = SetVehicleEngineOn
          L3_2 = A0_2
          L4_2 = true
          L5_2 = false
          L6_2 = Config
          L6_2 = L6_2.DisableAutoStartEngine
          if L6_2 then
            L6_2 = true
            if L6_2 then
              goto lbl_217
            end
          end
          L6_2 = false
          ::lbl_217::
          L2_2(L3_2, L4_2, L5_2, L6_2)
        end
      end
    end
  end
  ::lbl_218::
end
ChangeOwner = L3_1
L3_1 = exports
L4_1 = "ChangeOwner"
L5_1 = ChangeOwner
L3_1(L4_1, L5_1)
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if not A0_2 then
    L1_2 = utils
    L2_2 = L1_2
    L1_2 = L1_2.notify
    L3_2 = locale
    L4_2 = "cant_find_veh"
    L3_2 = L3_2(L4_2)
    L4_2 = "primary"
    L5_2 = 5000
    L1_2(L2_2, L3_2, L4_2, L5_2)
    return
  end
  if 0 == A0_2 then
    L1_2 = utils
    L2_2 = L1_2
    L1_2 = L1_2.notify
    L3_2 = locale
    L4_2 = "cant_find_veh"
    L3_2 = L3_2(L4_2)
    L4_2 = "primary"
    L5_2 = 5000
    L1_2(L2_2, L3_2, L4_2, L5_2)
    return
  end
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = utils
    L2_2 = L1_2
    L1_2 = L1_2.notify
    L3_2 = locale
    L4_2 = "cant_find_veh"
    L3_2 = L3_2(L4_2)
    L4_2 = "primary"
    L5_2 = 5000
    L1_2(L2_2, L3_2, L4_2, L5_2)
    return
  end
  L1_2 = LocalPlayer
  L1_2 = L1_2.state
  L1_2 = L1_2.mk_isLoggedIn
  if L1_2 then
    L1_2 = A0_2
    L2_2 = false
    L3_2 = Config
    L3_2 = L3_2.CheckRestrictions
    if L3_2 then
      L3_2 = promise
      L3_2 = L3_2.new
      L3_2 = L3_2()
      L5_2 = L3_2
      L4_2 = L3_2.resolve
      L6_2 = framework
      L7_2 = L6_2
      L6_2 = L6_2.isRestricted
      L6_2, L7_2, L8_2 = L6_2(L7_2)
      L4_2(L5_2, L6_2, L7_2, L8_2)
      L4_2 = Citizen
      L4_2 = L4_2.Await
      L5_2 = L3_2
      L4_2(L5_2)
      if L3_2 then
        L2_2 = L3_2.value
      end
    end
    if not L2_2 then
      L3_2 = GetEntityCoords
      L4_2 = PlayerPedId
      L4_2 = L4_2()
      L5_2 = true
      L3_2 = L3_2(L4_2, L5_2)
      L4_2 = GetEntityCoords
      L5_2 = L1_2
      L4_2 = L4_2(L5_2)
      if L1_2 > 0 then
        L5_2 = L3_2 - L4_2
        L5_2 = #L5_2
        L6_2 = 7.5
        if L5_2 < L6_2 then
          L5_2 = HasAuth
          L6_2 = L1_2
          L5_2 = L5_2(L6_2)
          if L5_2 then
            L5_2 = Entity
            L6_2 = L1_2
            L5_2 = L5_2(L6_2)
            L5_2 = L5_2.state
            L5_2 = L5_2.LockBusy
            if not L5_2 then
              L5_2 = TriggerServerEvent
              L6_2 = "MK_VehicleKeys:Server:ToggleLocks"
              L7_2 = NetworkGetNetworkIdFromEntity
              L8_2 = L1_2
              L7_2 = L7_2(L8_2)
              L8_2 = L1_2
              L5_2(L6_2, L7_2, L8_2)
            end
          end
        end
      end
    end
  end
end
ToggleLocks = L3_1
L3_1 = exports
L4_1 = "ToggleLocks"
L5_1 = ToggleLocks
L3_1(L4_1, L5_1)
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = nil
  if not A0_2 or 0 == A0_2 then
    L2_2 = utils
    L3_2 = L2_2
    L2_2 = L2_2.getClosestVehicle
    L2_2, L3_2 = L2_2(L3_2)
    if L2_2 and L3_2 then
      L1_2 = L2_2
    else
      L4_2 = utils
      L5_2 = L4_2
      L4_2 = L4_2.notify
      L6_2 = locale
      L7_2 = "cant_find_veh"
      L6_2 = L6_2(L7_2)
      L7_2 = "primary"
      L8_2 = 5000
      L4_2(L5_2, L6_2, L7_2, L8_2)
      return
    end
  else
    L1_2 = A0_2
  end
  L2_2 = LocalPlayer
  L2_2 = L2_2.state
  L2_2 = L2_2.mk_isLoggedIn
  if L2_2 then
    L2_2 = false
    L3_2 = Config
    L3_2 = L3_2.CheckRestrictions
    if L3_2 then
      L3_2 = promise
      L3_2 = L3_2.new
      L3_2 = L3_2()
      L5_2 = L3_2
      L4_2 = L3_2.resolve
      L6_2 = framework
      L7_2 = L6_2
      L6_2 = L6_2.isRestricted
      L6_2, L7_2, L8_2 = L6_2(L7_2)
      L4_2(L5_2, L6_2, L7_2, L8_2)
      L4_2 = Citizen
      L4_2 = L4_2.Await
      L5_2 = L3_2
      L4_2(L5_2)
      if L3_2 then
        L2_2 = L3_2.value
      end
    end
    if not L2_2 then
      L3_2 = GetEntityCoords
      L4_2 = PlayerPedId
      L4_2 = L4_2()
      L5_2 = true
      L3_2 = L3_2(L4_2, L5_2)
      L4_2 = GetEntityCoords
      L5_2 = L1_2
      L4_2 = L4_2(L5_2)
      if L1_2 > 0 then
        L5_2 = L3_2 - L4_2
        L5_2 = #L5_2
        L6_2 = 7.5
        if L5_2 < L6_2 then
          L5_2 = SetEntityAsMissionEntity
          L6_2 = L1_2
          L7_2 = true
          L8_2 = true
          L5_2(L6_2, L7_2, L8_2)
          L5_2 = Entity
          L6_2 = L1_2
          L5_2 = L5_2(L6_2)
          L5_2 = L5_2.state
          L5_2 = L5_2.LockBusy
          if not L5_2 then
            L5_2 = TriggerServerEvent
            L6_2 = "MK_VehicleKeys:Server:UnlockVehicle"
            L7_2 = NetworkGetNetworkIdFromEntity
            L8_2 = L1_2
            L7_2 = L7_2(L8_2)
            L8_2 = L1_2
            L5_2(L6_2, L7_2, L8_2)
          end
        end
      end
    end
  end
end
UnlockVehicle = L3_1
L3_1 = exports
L4_1 = "UnlockVehicle"
L5_1 = UnlockVehicle
L3_1(L4_1, L5_1)
function L3_1()
  local L0_2, L1_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3
    L0_3 = cache
    L0_3 = L0_3.vehicle
    if not L0_3 then
      return
    end
    L0_3 = 250
    L1_3 = PlayerPedId
    L1_3 = L1_3()
    L2_3 = GetEntityModel
    L3_3 = cache
    L3_3 = L3_3.vehicle
    L2_3 = L2_3(L3_3)
    L3_3 = GetVehicleClass
    L4_3 = cache
    L4_3 = L4_3.vehicle
    L3_3 = L3_3(L4_3)
    L4_3 = lib
    L4_3 = L4_3.isTextUIOpen
    L4_3 = L4_3()
    if L4_3 then
      L4_3 = lib
      L4_3 = L4_3.hideTextUI
      L4_3()
    end
    L4_3 = false
    L5_3 = false
    L6_3 = 2500
    DisableLockpick = true
    L7_3 = GetEntityPopulationType
    L8_3 = cache
    L8_3 = L8_3.vehicle
    L7_3 = L7_3(L8_3)
    if 7 == L7_3 then
      if 7 ~= L7_3 then
        goto lbl_63
      end
      L8_3 = Entity
      L9_3 = cache
      L9_3 = L9_3.vehicle
      L8_3 = L8_3(L9_3)
      L8_3 = L8_3.state
      L8_3 = L8_3.mk_scriptOwned
      if nil ~= L8_3 then
        L8_3 = Entity
        L9_3 = cache
        L9_3 = L9_3.vehicle
        L8_3 = L8_3(L9_3)
        L8_3 = L8_3.state
        L8_3 = L8_3.mk_scriptOwned
        if not L8_3 then
          goto lbl_63
        end
        L8_3 = Entity
        L9_3 = cache
        L9_3 = L9_3.vehicle
        L8_3 = L8_3(L9_3)
        L8_3 = L8_3.state
        L8_3 = L8_3.mk_scriptOwnedSpawnTimer
        if not L8_3 then
          goto lbl_63
        end
      end
    end
    L6_3 = false
    DisableLockpick = false
    ::lbl_63::
    L8_3 = IsEntityAMissionEntity
    L9_3 = cache
    L9_3 = L9_3.vehicle
    L8_3 = L8_3(L9_3)
    if not L8_3 then
      L8_3 = SetEntityAsMissionEntity
      L9_3 = cache
      L9_3 = L9_3.vehicle
      L10_3 = true
      L11_3 = true
      L8_3(L9_3, L10_3, L11_3)
    end
    while true do
      L8_3 = LocalPlayer
      L8_3 = L8_3.state
      L8_3 = L8_3.mk_isLoggedIn
      if not L8_3 then
        break
      end
      L8_3 = cache
      L8_3 = L8_3.vehicle
      if not L8_3 then
        break
      end
      L0_3 = 250
      L8_3 = Config
      L8_3 = L8_3.CheckRestrictions
      if L8_3 then
        L8_3 = promise
        L8_3 = L8_3.new
        L8_3 = L8_3()
        L10_3 = L8_3
        L9_3 = L8_3.resolve
        L11_3 = framework
        L12_3 = L11_3
        L11_3 = L11_3.isRestricted
        L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3 = L11_3(L12_3)
        L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
        L9_3 = Citizen
        L9_3 = L9_3.Await
        L10_3 = L8_3
        L9_3(L10_3)
        if L8_3 then
          L9_3 = L8_3.value
          if L9_3 then
            break
          end
        end
      end
      L8_3 = cache
      L8_3 = L8_3.vehicle
      if not L8_3 then
        break
      end
      if not L5_3 then
        L8_3 = Entity
        L9_3 = cache
        L9_3 = L9_3.vehicle
        L8_3 = L8_3(L9_3)
        L8_3 = L8_3.state
        L8_3 = L8_3.MKOLDFOB
        if L8_3 and not L4_3 then
          L4_3 = true
          L8_3 = false
          L9_3 = pairs
          L10_3 = Entity
          L11_3 = cache
          L11_3 = L11_3.vehicle
          L10_3 = L10_3(L11_3)
          L10_3 = L10_3.state
          L10_3 = L10_3.MKOLDFOB
          L9_3, L10_3, L11_3, L12_3 = L9_3(L10_3)
          for L13_3, L14_3 in L9_3, L10_3, L11_3, L12_3 do
            L15_3 = inventory
            L16_3 = L15_3
            L15_3 = L15_3.hasItem
            L17_3 = Config
            L17_3 = L17_3.KeysAsItem
            L17_3 = L17_3.PlayerOwned
            L17_3 = L17_3.ItemName
            L18_3 = {}
            L18_3.id = L14_3
            L19_3 = true
            L15_3 = L15_3(L16_3, L17_3, L18_3, L19_3)
            if L15_3 then
              L8_3 = true
              break
            end
          end
          if L8_3 then
            L9_3 = utils
            L10_3 = L9_3
            L9_3 = L9_3.notify
            L11_3 = locale
            L12_3 = "old_fob"
            L11_3 = L11_3(L12_3)
            L12_3 = "error"
            L13_3 = 5000
            L9_3(L10_3, L11_3, L12_3, L13_3)
            L5_3 = true
            L4_3 = false
          else
            L5_3 = true
            L4_3 = false
          end
        end
      end
      L8_3 = cache
      L8_3 = L8_3.vehicle
      if not L8_3 then
        break
      end
      L8_3 = HasAuth
      L9_3 = cache
      L9_3 = L9_3.vehicle
      L8_3 = L8_3(L9_3)
      if not L8_3 then
        L8_3 = SetVehicleEngineOn
        L9_3 = cache
        L9_3 = L9_3.vehicle
        L10_3 = false
        L11_3 = true
        L12_3 = true
        L8_3(L9_3, L10_3, L11_3, L12_3)
        if 15 == L3_3 then
          L8_3 = SetVehicleUndriveable
          L9_3 = cache
          L9_3 = L9_3.vehicle
          L10_3 = true
          L8_3(L9_3, L10_3)
          L8_3 = SetVehicleEngineOn
          L9_3 = cache
          L9_3 = L9_3.vehicle
          L10_3 = false
          L11_3 = true
          L12_3 = true
          L8_3(L9_3, L10_3, L11_3, L12_3)
        elseif 16 == L3_3 then
          L8_3 = SetVehicleUndriveable
          L9_3 = cache
          L9_3 = L9_3.vehicle
          L10_3 = true
          L8_3(L9_3, L10_3)
          L8_3 = SetVehicleEngineOn
          L9_3 = cache
          L9_3 = L9_3.vehicle
          L10_3 = false
          L11_3 = true
          L12_3 = true
          L8_3(L9_3, L10_3, L11_3, L12_3)
        end
        L8_3 = IsLockpicking
        if not L8_3 then
          L8_3 = IsHotwiring
          if not L8_3 then
            L8_3 = TakingKeys
            if not L8_3 then
              L8_3 = GetIsVehicleEngineRunning
              L9_3 = cache
              L9_3 = L9_3.vehicle
              L8_3 = L8_3(L9_3)
              if L8_3 then
                L8_3 = IsThisModelAHeli
                L9_3 = L2_3
                L8_3 = L8_3(L9_3)
                if not L8_3 then
                  L8_3 = IsThisModelAPlane
                  L9_3 = L2_3
                  L8_3 = L8_3(L9_3)
                  if not L8_3 then
                    goto lbl_250
                  end
                end
                L8_3 = SetVehicleEngineOn
                L9_3 = cache
                L9_3 = L9_3.vehicle
                L10_3 = false
                L11_3 = true
                L12_3 = true
                L8_3(L9_3, L10_3, L11_3, L12_3)
                L8_3 = SetVehicleUndriveable
                L9_3 = cache
                L9_3 = L9_3.vehicle
                L10_3 = true
                L8_3(L9_3, L10_3)
                goto lbl_257
                ::lbl_250::
                L8_3 = SetVehicleEngineOn
                L9_3 = cache
                L9_3 = L9_3.vehicle
                L10_3 = false
                L11_3 = true
                L12_3 = true
                L8_3(L9_3, L10_3, L11_3, L12_3)
              end
              ::lbl_257::
              if L6_3 then
                goto lbl_530
              end
              if 15 == L3_3 or 16 == L3_3 then
                if 15 == L3_3 then
                  L8_3 = Config
                  L8_3 = L8_3.Licenses
                  L8_3 = L8_3.Helicopter
                  L8_3 = L8_3.CanHotwire
                  if L8_3 then
                    goto lbl_279
                  end
                end
                if 16 ~= L3_3 then
                  goto lbl_530
                end
                L8_3 = Config
                L8_3 = L8_3.Licenses
                L8_3 = L8_3.Plane
                L8_3 = L8_3.CanHotwire
                if not L8_3 then
                  goto lbl_530
                end
              end
              ::lbl_279::
              L8_3 = Config
              L8_3 = L8_3.EnableHotwiring
              if L8_3 then
                L8_3 = Entity
                L9_3 = cache
                L9_3 = L9_3.vehicle
                L8_3 = L8_3(L9_3)
                L8_3 = L8_3.state
                L8_3 = L8_3.MKFOB
                if nil ~= L8_3 then
                  L8_3 = Entity
                  L9_3 = cache
                  L9_3 = L9_3.vehicle
                  L8_3 = L8_3(L9_3)
                  L8_3 = L8_3.state
                  L8_3 = L8_3.MKFOB
                  if not L8_3 then
                    goto lbl_428
                  end
                  L8_3 = Config
                  L8_3 = L8_3.KeysAsItem
                  L8_3 = L8_3.PlayerOwned
                  L8_3 = L8_3.CanHotwire
                  if not L8_3 then
                    goto lbl_428
                  end
                end
                L8_3 = Entity
                L9_3 = cache
                L9_3 = L9_3.vehicle
                L8_3 = L8_3(L9_3)
                L8_3 = L8_3.state
                L8_3 = L8_3.Hotwired
                if nil == L8_3 then
                  L8_3 = Entity
                  L9_3 = cache
                  L9_3 = L9_3.vehicle
                  L8_3 = L8_3(L9_3)
                  L8_3 = L8_3.state
                  L9_3 = L8_3
                  L8_3 = L8_3.set
                  L10_3 = "Hotwired"
                  L11_3 = false
                  L12_3 = false
                  L8_3(L9_3, L10_3, L11_3, L12_3)
                else
                  L8_3 = type
                  L9_3 = Entity
                  L10_3 = cache
                  L10_3 = L10_3.vehicle
                  L9_3 = L9_3(L10_3)
                  L9_3 = L9_3.state
                  L9_3 = L9_3.Hotwired
                  L8_3 = L8_3(L9_3)
                  if "boolean" == L8_3 then
                    L8_3 = Entity
                    L9_3 = cache
                    L9_3 = L9_3.vehicle
                    L8_3 = L8_3(L9_3)
                    L8_3 = L8_3.state
                    L8_3 = L8_3.Hotwired
                    if not L8_3 then
                      L8_3 = IsHotwiring
                      if not L8_3 then
                        L8_3 = IsLockpicking
                        if not L8_3 then
                          L8_3 = TakingKeys
                          if not L8_3 then
                            L8_3 = lib
                            L8_3 = L8_3.isTextUIOpen
                            L8_3 = L8_3()
                            if not L8_3 then
                              L8_3 = GetVehiclePedIsEntering
                              L9_3 = PlayerPedId
                              L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3 = L9_3()
                              L8_3 = L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
                              if 0 == L8_3 then
                                L8_3 = lib
                                L8_3 = L8_3.showTextUI
                                L9_3 = locale
                                L10_3 = "hotwire_veh"
                                L9_3 = L9_3(L10_3)
                                L10_3 = {}
                                L11_3 = Config
                                L11_3 = L11_3.HotwireTextUI
                                L11_3 = L11_3.Position
                                L10_3.position = L11_3
                                L11_3 = Config
                                L11_3 = L11_3.HotwireTextUI
                                L11_3 = L11_3.Icon
                                L11_3 = L11_3.Icon
                                L10_3.icon = L11_3
                                L11_3 = Config
                                L11_3 = L11_3.HotwireTextUI
                                L11_3 = L11_3.Icon
                                L11_3 = L11_3.Color
                                L10_3.iconColor = L11_3
                                L11_3 = Config
                                L11_3 = L11_3.HotwireTextUI
                                L11_3 = L11_3.Style
                                L10_3.style = L11_3
                                L8_3(L9_3, L10_3)
                                canHotwire = true
                                L8_3 = CreateThread
                                function L9_3()
                                  local L0_4, L1_4, L2_4, L3_4, L4_4
                                  while true do
                                    L0_4 = LocalPlayer
                                    L0_4 = L0_4.state
                                    L0_4 = L0_4.mk_isLoggedIn
                                    if not L0_4 then
                                      break
                                    end
                                    L0_4 = cache
                                    L0_4 = L0_4.vehicle
                                    if not L0_4 then
                                      break
                                    end
                                    L0_4 = cache
                                    L0_4 = L0_4.seat
                                    if -1 ~= L0_4 then
                                      break
                                    end
                                    L0_4 = lib
                                    L0_4 = L0_4.isTextUIOpen
                                    L0_4 = L0_4()
                                    if not L0_4 then
                                      break
                                    end
                                    L0_4 = IsLockpicking
                                    if L0_4 then
                                      break
                                    end
                                    L0_4 = SetVehicleEngineOn
                                    L1_4 = cache
                                    L1_4 = L1_4.vehicle
                                    L2_4 = false
                                    L3_4 = true
                                    L4_4 = true
                                    L0_4(L1_4, L2_4, L3_4, L4_4)
                                    L0_4 = Wait
                                    L1_4 = 100
                                    L0_4(L1_4)
                                  end
                                  canHotwire = false
                                  L0_4 = lib
                                  L0_4 = L0_4.isTextUIOpen
                                  L0_4 = L0_4()
                                  if L0_4 then
                                    L0_4 = lib
                                    L0_4 = L0_4.hideTextUI
                                    L0_4()
                                  end
                                end
                                L8_3(L9_3)
                              end
                          end
                        end
                      end
                    end
                  end
                  else
                    L8_3 = type
                    L9_3 = Entity
                    L10_3 = cache
                    L10_3 = L10_3.vehicle
                    L9_3 = L9_3(L10_3)
                    L9_3 = L9_3.state
                    L9_3 = L9_3.Hotwired
                    L8_3 = L8_3(L9_3)
                    if "string" == L8_3 then
                      L8_3 = Entity
                      L9_3 = cache
                      L9_3 = L9_3.vehicle
                      L8_3 = L8_3(L9_3)
                      L8_3 = L8_3.state
                      L8_3 = L8_3.Hotwired
                      if "Failed" ~= L8_3 then
                        L8_3 = IsLockpicking
                        if not L8_3 then
                          L8_3 = IsHotwiring
                          if not L8_3 then
                            L8_3 = TakingKeys
                            if not L8_3 then
                              L8_3 = SetVehicleEngineOn
                              L9_3 = cache
                              L9_3 = L9_3.vehicle
                              L10_3 = false
                              L11_3 = true
                              L12_3 = true
                              L8_3(L9_3, L10_3, L11_3, L12_3)
                              goto lbl_530
                              ::lbl_428::
                              L8_3 = lib
                              L8_3 = L8_3.isTextUIOpen
                              L8_3 = L8_3()
                              if L8_3 then
                                L8_3 = lib
                                L8_3 = L8_3.hideTextUI
                                L8_3()
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              else
                L8_3 = canHotwire
                if L8_3 then
                  canHotwire = false
                end
              end
          end
        end
        else
          L8_3 = IsLockpicking
          if not L8_3 then
            L8_3 = IsHotwiring
          end
          if L8_3 then
            L8_3 = SetVehicleEngineOn
            L9_3 = cache
            L9_3 = L9_3.vehicle
            L10_3 = false
            L11_3 = true
            L12_3 = true
            L8_3(L9_3, L10_3, L11_3, L12_3)
          end
        end
      else
        L8_3 = lib
        L8_3 = L8_3.isTextUIOpen
        L8_3 = L8_3()
        if L8_3 then
          L8_3 = lib
          L8_3 = L8_3.hideTextUI
          L8_3()
        end
        L8_3 = SetVehicleKeepEngineOnWhenAbandoned
        L9_3 = cache
        L9_3 = L9_3.vehicle
        L10_3 = Config
        L10_3 = L10_3.LeaveEngineRunning
        if L10_3 then
          L10_3 = true
          if L10_3 then
            goto lbl_475
          end
        end
        L10_3 = false
        ::lbl_475::
        L8_3(L9_3, L10_3)
        if 15 ~= L3_3 and 16 ~= L3_3 then
          break
        end
        if 15 == L3_3 then
          L8_3 = Config
          L8_3 = L8_3.Licenses
          L8_3 = L8_3.Helicopter
          L8_3 = L8_3.CanHotwire
          if L8_3 then
            break
          end
          L8_3 = Config
          L8_3 = L8_3.Licenses
          L8_3 = L8_3.Helicopter
          L8_3 = L8_3.CanLockpick
          if L8_3 then
            break
          end
        end
        if 16 == L3_3 then
          L8_3 = Config
          L8_3 = L8_3.Licenses
          L8_3 = L8_3.Plane
          L8_3 = L8_3.CanHotwire
          if L8_3 then
            break
          end
          L8_3 = Config
          L8_3 = L8_3.Licenses
          L8_3 = L8_3.Plane
          L8_3 = L8_3.CanLockpick
        end
        if not L8_3 then
          L8_3 = HasFlyingAuth
          L9_3 = cache
          L9_3 = L9_3.vehicle
          L8_3 = L8_3(L9_3)
          if not L8_3 then
            L8_3 = SetVehicleUndriveable
            L9_3 = cache
            L9_3 = L9_3.vehicle
            L10_3 = true
            L8_3(L9_3, L10_3)
            L8_3 = SetVehicleEngineOn
            L9_3 = cache
            L9_3 = L9_3.vehicle
            L10_3 = false
            L11_3 = true
            L12_3 = true
            L8_3(L9_3, L10_3, L11_3, L12_3)
          else
            break
          end
        else
          break
        end
      end
      ::lbl_530::
      if L6_3 then
        L6_3 = L6_3 - L0_3
        if L6_3 <= 0 then
          L6_3 = false
          DisableLockpick = false
        end
      end
      L8_3 = Wait
      L9_3 = L0_3
      L8_3(L9_3)
    end
    L8_3 = lib
    L8_3 = L8_3.isTextUIOpen
    L8_3 = L8_3()
    if L8_3 then
      L8_3 = lib
      L8_3 = L8_3.hideTextUI
      L8_3()
    end
    DisableLockpick = false
  end
  L0_2(L1_2)
end
RunVehicleThread = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if not A0_2 then
    L1_2 = utils
    L2_2 = L1_2
    L1_2 = L1_2.notify
    L3_2 = locale
    L4_2 = "hotwire_fail"
    L3_2 = L3_2(L4_2)
    L4_2 = "error"
    L5_2 = 5000
    L1_2(L2_2, L3_2, L4_2, L5_2)
    return
  end
  L1_2 = A0_2
  L2_2 = Config
  L2_2 = L2_2.HotwireCustomAuth
  L3_2 = L1_2
  L4_2 = utils
  L5_2 = L4_2
  L4_2 = L4_2.removeTrailSpaces
  L6_2 = GetVehicleNumberPlateText
  L7_2 = L1_2
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2(L7_2)
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  if not L2_2 then
    IsHotwiring = false
    return
  end
  L2_2 = Config
  L2_2 = L2_2.PoliceNotify
  if L2_2 then
    L2_2 = Config
    L2_2 = L2_2.PoliceNotify
    L2_2 = L2_2.Chance
    if L2_2 then
      L2_2 = Config
      L2_2 = L2_2.PoliceNotify
      L2_2 = L2_2.AlertTimeout
      if L2_2 then
        L2_2 = AlertCooldown
        if L2_2 then
          goto lbl_131
        end
        L2_2 = math
        L2_2 = L2_2.random
        L3_2 = 1
        L4_2 = 100
        L2_2 = L2_2(L3_2, L4_2)
        L3_2 = Config
        L3_2 = L3_2.PoliceNotify
        L3_2 = L3_2.Chance
        if not (L2_2 < L3_2) then
          goto lbl_131
        end
        L3_2 = utils
        L4_2 = L3_2
        L3_2 = L3_2.removeTrailSpaces
        L5_2 = GetVehicleNumberPlateText
        L6_2 = L1_2
        L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L5_2(L6_2)
        L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
        L4_2 = GetEntityCoords
        L5_2 = L1_2
        L4_2 = L4_2(L5_2)
        L5_2 = GetLabelText
        L6_2 = GetDisplayNameFromVehicleModel
        L7_2 = GetEntityModel
        L8_2 = L1_2
        L7_2, L8_2, L9_2, L10_2, L11_2 = L7_2(L8_2)
        L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
        L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
        if L5_2 then
          L5_2 = GetLabelText
          L6_2 = GetDisplayNameFromVehicleModel
          L7_2 = GetEntityModel
          L8_2 = L1_2
          L7_2, L8_2, L9_2, L10_2, L11_2 = L7_2(L8_2)
          L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
          L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
          if L5_2 then
            goto lbl_82
          end
        end
        L5_2 = "Unknown"
        ::lbl_82::
        AlertCooldown = true
        L6_2 = framework
        L7_2 = L6_2
        L6_2 = L6_2.policeDispatchNotify
        L8_2 = {}
        L8_2.coords = L4_2
        L8_2.plate = L3_2
        L8_2.vehicleName = L5_2
        L8_2.vehicle = L1_2
        L9_2 = locale
        L10_2 = "dispatch_alert_message"
        L9_2 = L9_2(L10_2)
        L8_2.message = L9_2
        L9_2 = locale
        L10_2 = "dispatch_alert_blip_text"
        L9_2 = L9_2(L10_2)
        L8_2.blipText = L9_2
        L9_2 = GetEntityModel
        L10_2 = L1_2
        L9_2 = L9_2(L10_2)
        L8_2.modelHash = L9_2
        L9_2 = vehicles
        L10_2 = GetEntityModel
        L11_2 = L1_2
        L10_2 = L10_2(L11_2)
        L9_2 = L9_2[L10_2]
        if L9_2 then
          L9_2 = L9_2.name
        end
        L8_2.modelString = L9_2
        L6_2(L7_2, L8_2)
        L6_2 = SetTimeout
        L7_2 = Config
        L7_2 = L7_2.PoliceNotify
        L7_2 = L7_2.AlertTimeout
        L7_2 = L7_2 * 1000
        function L8_2()
          local L0_3, L1_3
          AlertCooldown = false
        end
        L6_2(L7_2, L8_2)
    end
    else
      L2_2 = utils
      L2_2 = L2_2.logger
      L3_2 = L2_2
      L2_2 = L2_2.info
      L4_2 = "VehicleKeys"
      L5_2 = "^5Police Notify not setup properly; See Config.^7"
      L6_2 = {}
      L6_2.console = true
      L2_2(L3_2, L4_2, L5_2, L6_2)
    end
  end
  ::lbl_131::
  L2_2 = Config
  L2_2 = L2_2.HotwireGame
  L2_2 = L2_2.UseGame
  if not L2_2 then
    L2_2 = CreateThread
    function L3_2()
      local L0_3, L1_3, L2_3
      while true do
        L0_3 = LocalPlayer
        L0_3 = L0_3.state
        L0_3 = L0_3.mk_isLoggedIn
        if not L0_3 then
          break
        end
        L0_3 = IsEntityDead
        L1_3 = PlayerPedId
        L1_3, L2_3 = L1_3()
        L0_3 = L0_3(L1_3, L2_3)
        if L0_3 then
          break
        end
        L0_3 = IsHotwiring
        if not L0_3 then
          break
        end
        L0_3 = Wait
        L1_3 = 10
        L0_3(L1_3)
        L0_3 = GetVehiclePedIsIn
        L1_3 = PlayerPedId
        L1_3 = L1_3()
        L2_3 = false
        L0_3 = L0_3(L1_3, L2_3)
        L1_3 = L1_2
        if L0_3 == L1_3 then
          L0_3 = GetPedInVehicleSeat
          L1_3 = L1_2
          L2_3 = -1
          L0_3 = L0_3(L1_3, L2_3)
          L1_3 = PlayerPedId
          L1_3 = L1_3()
          if L0_3 == L1_3 then
            goto lbl_44
          end
        end
        L0_3 = lib
        L0_3 = L0_3.progressActive
        L0_3 = L0_3()
        if L0_3 then
          L0_3 = lib
          L0_3 = L0_3.cancelProgress
          L0_3()
          IsHotwiring = false
        end
        do break end
        ::lbl_44::
      end
      L0_3 = LocalPlayer
      L0_3 = L0_3.state
      L0_3 = L0_3.mk_isLoggedIn
      if L0_3 then
        L0_3 = IsEntityDead
        L1_3 = PlayerPedId
        L1_3, L2_3 = L1_3()
        L0_3 = L0_3(L1_3, L2_3)
        if not L0_3 then
          goto lbl_65
        end
      end
      L0_3 = lib
      L0_3 = L0_3.progressActive
      L0_3 = L0_3()
      if L0_3 then
        L0_3 = lib
        L0_3 = L0_3.cancelProgress
        L0_3()
        IsHotwiring = false
      end
      ::lbl_65::
    end
    L2_2(L3_2)
    L2_2 = math
    L2_2 = L2_2.random
    L3_2 = 1
    L4_2 = 100
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = math
    L3_2 = L3_2.random
    L4_2 = Config
    L4_2 = L4_2.HotwireTime
    L4_2 = L4_2.Min
    L4_2 = L4_2 * 1000
    L5_2 = Config
    L5_2 = L5_2.HotwireTime
    L5_2 = L5_2.Max
    L5_2 = L5_2 * 1000
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = SetVehicleAlarm
    L5_2 = L1_2
    L6_2 = true
    L4_2(L5_2, L6_2)
    L4_2 = SetVehicleAlarmTimeLeft
    L5_2 = L1_2
    L6_2 = L3_2
    L4_2(L5_2, L6_2)
    L4_2 = "progressBar"
    L5_2 = nil
    L6_2 = Config
    L6_2 = L6_2.ProgressCircle
    if L6_2 then
      L4_2 = "progressCircle"
      L6_2 = Config
      L6_2 = L6_2.ProgressCirclePosition
      if L6_2 then
        L6_2 = Config
        L6_2 = L6_2.ProgressCirclePosition
        if L6_2 then
          goto lbl_181
          L5_2 = L6_2 or L5_2
        end
      end
      L5_2 = "middle"
    end
    ::lbl_181::
    L6_2 = lib
    L6_2 = L6_2[L4_2]
    L7_2 = {}
    L7_2.duration = L3_2
    L8_2 = locale
    L9_2 = "attempt_hotwire"
    L8_2 = L8_2(L9_2)
    L7_2.label = L8_2
    L7_2.position = L5_2
    L7_2.useWhileDead = false
    L7_2.canCancel = true
    L8_2 = {}
    L8_2.move = true
    L8_2.car = true
    L7_2.disable = L8_2
    L8_2 = {}
    L8_2.dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
    L8_2.clip = "machinic_loop_mechandplayer"
    L8_2.flag = 16
    L7_2.anim = L8_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = Config
      L6_2 = L6_2.HotwireFailChance
      if L2_2 < L6_2 then
        L6_2 = utils
        L7_2 = L6_2
        L6_2 = L6_2.notify
        L8_2 = locale
        L9_2 = "hotwire_fail"
        L8_2 = L8_2(L9_2)
        L9_2 = "error"
        L10_2 = 5000
        L6_2(L7_2, L8_2, L9_2, L10_2)
        L6_2 = Entity
        L7_2 = L1_2
        L6_2 = L6_2(L7_2)
        L6_2 = L6_2.state
        L7_2 = L6_2
        L6_2 = L6_2.set
        L8_2 = "Hotwired"
        L9_2 = "Failed"
        L10_2 = false
        L6_2(L7_2, L8_2, L9_2, L10_2)
      else
        L6_2 = GetVehicleClass
        L7_2 = L1_2
        L6_2 = L6_2(L7_2)
        if 15 ~= L6_2 then
          L6_2 = GetVehicleClass
          L7_2 = L1_2
          L6_2 = L6_2(L7_2)
          if 16 ~= L6_2 then
            goto lbl_244
          end
        end
        L6_2 = Entity
        L7_2 = L1_2
        L6_2 = L6_2(L7_2)
        L6_2 = L6_2.state
        L6_2.mk_hotwired_flying = true
        ::lbl_244::
        L6_2 = Entity
        L7_2 = L1_2
        L6_2 = L6_2(L7_2)
        L6_2 = L6_2.state
        L7_2 = L6_2
        L6_2 = L6_2.set
        L8_2 = "Hotwired"
        L9_2 = true
        L10_2 = false
        L6_2(L7_2, L8_2, L9_2, L10_2)
        L6_2 = SetEntityAsMissionEntity
        L7_2 = L1_2
        L8_2 = true
        L9_2 = true
        L6_2(L7_2, L8_2, L9_2)
        L6_2 = TriggerServerEvent
        L7_2 = "MK_VehicleKeys:Server:AddKey"
        L8_2 = NetworkGetNetworkIdFromEntity
        L9_2 = A0_2
        L8_2 = L8_2(L9_2)
        L9_2 = false
        L10_2 = true
        L6_2(L7_2, L8_2, L9_2, L10_2)
        L6_2 = SetVehicleUndriveable
        L7_2 = L1_2
        L8_2 = false
        L6_2(L7_2, L8_2)
        L6_2 = GetIsVehicleEngineRunning
        L7_2 = L1_2
        L6_2 = L6_2(L7_2)
        if not L6_2 then
          L6_2 = Config
          L6_2 = L6_2.DisableAutoStartEngine
          if L6_2 then
            L6_2 = SetVehicleEngineOn
            L7_2 = L1_2
            L8_2 = false
            L9_2 = true
            L10_2 = true
            L6_2(L7_2, L8_2, L9_2, L10_2)
          else
            L6_2 = SetVehicleEngineOn
            L7_2 = L1_2
            L8_2 = true
            L9_2 = false
            L10_2 = Config
            L10_2 = L10_2.DisableAutoStartEngine
            if L10_2 then
              L10_2 = true
              if L10_2 then
                goto lbl_298
              end
            end
            L10_2 = false
            ::lbl_298::
            L6_2(L7_2, L8_2, L9_2, L10_2)
          end
        end
        L6_2 = Config
        L6_2 = L6_2.HotwireEvent
        L7_2 = L1_2
        L8_2 = utils
        L9_2 = L8_2
        L8_2 = L8_2.removeTrailSpaces
        L10_2 = GetVehicleNumberPlateText
        L11_2 = L1_2
        L10_2, L11_2 = L10_2(L11_2)
        L8_2 = L8_2(L9_2, L10_2, L11_2)
        L9_2 = GetEntityCoords
        L10_2 = L1_2
        L9_2, L10_2, L11_2 = L9_2(L10_2)
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
      end
      IsHotwiring = false
    else
      IsHotwiring = false
    end
  else
    L2_2 = Config
    L2_2 = L2_2.HotwireGame
    L2_2 = L2_2.StartGame
    if L2_2 then
      L2_2 = Config
      L2_2 = L2_2.HotwireGame
      L2_2 = L2_2.StopGame
      if L2_2 then
        L2_2 = CreateThread
        function L3_2()
          local L0_3, L1_3, L2_3
          while true do
            L0_3 = LocalPlayer
            L0_3 = L0_3.state
            L0_3 = L0_3.mk_isLoggedIn
            if not L0_3 then
              break
            end
            L0_3 = IsEntityDead
            L1_3 = PlayerPedId
            L1_3, L2_3 = L1_3()
            L0_3 = L0_3(L1_3, L2_3)
            if L0_3 then
              break
            end
            L0_3 = IsHotwiring
            if not L0_3 then
              break
            end
            L0_3 = Wait
            L1_3 = 10
            L0_3(L1_3)
            L0_3 = GetVehiclePedIsIn
            L1_3 = PlayerPedId
            L1_3 = L1_3()
            L2_3 = false
            L0_3 = L0_3(L1_3, L2_3)
            L1_3 = L1_2
            if L0_3 == L1_3 then
              L0_3 = GetPedInVehicleSeat
              L1_3 = L1_2
              L2_3 = -1
              L0_3 = L0_3(L1_3, L2_3)
              L1_3 = PlayerPedId
              L1_3 = L1_3()
              if L0_3 == L1_3 then
                goto lbl_39
              end
            end
            L0_3 = Config
            L0_3 = L0_3.HotwireGame
            L0_3 = L0_3.StopGame
            L0_3()
            IsHotwiring = false
            ::lbl_39::
          end
          L0_3 = LocalPlayer
          L0_3 = L0_3.state
          L0_3 = L0_3.mk_isLoggedIn
          if L0_3 then
            L0_3 = IsEntityDead
            L1_3 = PlayerPedId
            L1_3, L2_3 = L1_3()
            L0_3 = L0_3(L1_3, L2_3)
            if not L0_3 then
              goto lbl_56
            end
          end
          L0_3 = Config
          L0_3 = L0_3.HotwireGame
          L0_3 = L0_3.StopGame
          L0_3()
          IsHotwiring = false
          ::lbl_56::
        end
        L2_2(L3_2)
      end
      L2_2 = LockpickIgnitionAnim
      L2_2()
      L2_2 = SetVehicleAlarm
      L3_2 = L1_2
      L4_2 = true
      L2_2(L3_2, L4_2)
      L2_2 = SetVehicleAlarmTimeLeft
      L3_2 = L1_2
      L4_2 = 15000
      L2_2(L3_2, L4_2)
      L2_2 = Config
      L2_2 = L2_2.HotwireGame
      L2_2 = L2_2.StartGame
      function L3_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
        if A0_3 then
          L1_3 = GetVehicleClass
          L2_3 = L1_2
          L1_3 = L1_3(L2_3)
          if 15 ~= L1_3 then
            L1_3 = GetVehicleClass
            L2_3 = L1_2
            L1_3 = L1_3(L2_3)
            if 16 ~= L1_3 then
              goto lbl_18
            end
          end
          L1_3 = Entity
          L2_3 = L1_2
          L1_3 = L1_3(L2_3)
          L1_3 = L1_3.state
          L1_3.mk_hotwired_flying = true
          ::lbl_18::
          L1_3 = false
          L0_1 = L1_3
          L1_3 = StopAnimTask
          L2_3 = PlayerPedId
          L2_3 = L2_3()
          L3_3 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
          L4_3 = "machinic_loop_mechandplayer"
          L5_3 = 1.0
          L1_3(L2_3, L3_3, L4_3, L5_3)
          L1_3 = Wait
          L2_3 = 0
          L1_3(L2_3)
          L1_3 = Entity
          L2_3 = L1_2
          L1_3 = L1_3(L2_3)
          L1_3 = L1_3.state
          L2_3 = L1_3
          L1_3 = L1_3.set
          L3_3 = "Hotwired"
          L4_3 = true
          L5_3 = false
          L1_3(L2_3, L3_3, L4_3, L5_3)
          L1_3 = SetEntityAsMissionEntity
          L2_3 = L1_2
          L3_3 = true
          L4_3 = true
          L1_3(L2_3, L3_3, L4_3)
          L1_3 = TriggerServerEvent
          L2_3 = "MK_VehicleKeys:Server:AddKey"
          L3_3 = NetworkGetNetworkIdFromEntity
          L4_3 = A0_2
          L3_3 = L3_3(L4_3)
          L4_3 = false
          L5_3 = true
          L1_3(L2_3, L3_3, L4_3, L5_3)
          L1_3 = SetVehicleUndriveable
          L2_3 = L1_2
          L3_3 = false
          L1_3(L2_3, L3_3)
          L1_3 = GetIsVehicleEngineRunning
          L2_3 = L1_2
          L1_3 = L1_3(L2_3)
          if not L1_3 then
            L1_3 = Config
            L1_3 = L1_3.DisableAutoStartEngine
            if L1_3 then
              L1_3 = SetVehicleEngineOn
              L2_3 = L1_2
              L3_3 = false
              L4_3 = true
              L5_3 = true
              L1_3(L2_3, L3_3, L4_3, L5_3)
            else
              L1_3 = SetVehicleEngineOn
              L2_3 = L1_2
              L3_3 = true
              L4_3 = false
              L5_3 = Config
              L5_3 = L5_3.DisableAutoStartEngine
              if L5_3 then
                L5_3 = true
                if L5_3 then
                  goto lbl_84
                end
              end
              L5_3 = false
              ::lbl_84::
              L1_3(L2_3, L3_3, L4_3, L5_3)
            end
          end
          L1_3 = Config
          L1_3 = L1_3.HotwireEvent
          L2_3 = L1_2
          L3_3 = utils
          L4_3 = L3_3
          L3_3 = L3_3.removeTrailSpaces
          L5_3 = GetVehicleNumberPlateText
          L6_3 = L1_2
          L5_3, L6_3 = L5_3(L6_3)
          L3_3 = L3_3(L4_3, L5_3, L6_3)
          L4_3 = GetEntityCoords
          L5_3 = L1_2
          L4_3, L5_3, L6_3 = L4_3(L5_3)
          L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
          IsHotwiring = false
        else
          L1_3 = false
          L0_1 = L1_3
          L1_3 = StopAnimTask
          L2_3 = PlayerPedId
          L2_3 = L2_3()
          L3_3 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
          L4_3 = "machinic_loop_mechandplayer"
          L5_3 = 1.0
          L1_3(L2_3, L3_3, L4_3, L5_3)
          L1_3 = Wait
          L2_3 = 0
          L1_3(L2_3)
          L1_3 = utils
          L2_3 = L1_3
          L1_3 = L1_3.notify
          L3_3 = locale
          L4_3 = "hotwire_fail"
          L3_3 = L3_3(L4_3)
          L4_3 = "error"
          L5_3 = 5000
          L1_3(L2_3, L3_3, L4_3, L5_3)
          L1_3 = Entity
          L2_3 = L1_2
          L1_3 = L1_3(L2_3)
          L1_3 = L1_3.state
          L2_3 = L1_3
          L1_3 = L1_3.set
          L3_3 = "Hotwired"
          L4_3 = "Failed"
          L5_3 = false
          L1_3(L2_3, L3_3, L4_3, L5_3)
          IsHotwiring = false
        end
      end
      L2_2(L3_2)
    else
      IsHotwiring = false
      L2_2 = utils
      L2_2 = L2_2.logger
      L3_2 = L2_2
      L2_2 = L2_2.info
      L4_2 = "VehicleKeys"
      L5_2 = "^5Game function not setup; See Config.^7"
      L6_2 = {}
      L6_2.console = true
      L2_2(L3_2, L4_2, L5_2, L6_2)
    end
  end
end
HotwireVehicle = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if not A0_2 then
    L1_2 = utils
    L2_2 = L1_2
    L1_2 = L1_2.notify
    L3_2 = locale
    L4_2 = "cant_find_veh"
    L3_2 = L3_2(L4_2)
    L4_2 = "primary"
    L5_2 = 5000
    L1_2(L2_2, L3_2, L4_2, L5_2)
    L1_2 = false
    return L1_2
  end
  if 0 == A0_2 then
    L1_2 = utils
    L2_2 = L1_2
    L1_2 = L1_2.notify
    L3_2 = locale
    L4_2 = "cant_find_veh"
    L3_2 = L3_2(L4_2)
    L4_2 = "primary"
    L5_2 = 5000
    L1_2(L2_2, L3_2, L4_2, L5_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = utils
    L2_2 = L1_2
    L1_2 = L1_2.notify
    L3_2 = locale
    L4_2 = "cant_find_veh"
    L3_2 = L3_2(L4_2)
    L4_2 = "primary"
    L5_2 = 5000
    L1_2(L2_2, L3_2, L4_2, L5_2)
    L1_2 = false
    return L1_2
  end
  L1_2 = A0_2
  L2_2 = GetVehicleClass
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = false
  if 15 == L2_2 or 16 == L2_2 then
    if 15 == L2_2 then
      L4_2 = Config
      L4_2 = L4_2.Licenses
      L4_2 = L4_2.Helicopter
      L4_2 = L4_2.CheckJob
      if not L4_2 then
        L4_2 = Config
        L4_2 = L4_2.Licenses
        L4_2 = L4_2.Helicopter
        L4_2 = L4_2.CheckLicense
        if not L4_2 then
          L4_2 = Config
          L4_2 = L4_2.Licenses
          L4_2 = L4_2.Helicopter
          L4_2 = L4_2.UseCustomJobCheck
          if not L4_2 then
            L4_2 = true
            return L4_2
          end
        end
      end
      L4_2 = Entity
      L5_2 = A0_2
      L4_2 = L4_2(L5_2)
      L4_2 = L4_2.state
      L4_2 = L4_2.mk_lockpicked_flying
      if L4_2 then
        L4_2 = true
        return L4_2
      end
      L4_2 = Entity
      L5_2 = A0_2
      L4_2 = L4_2(L5_2)
      L4_2 = L4_2.state
      L4_2 = L4_2.mk_hotwired_flying
      if L4_2 then
        L4_2 = true
        return L4_2
      end
      L4_2 = Config
      L4_2 = L4_2.Licenses
      L4_2 = L4_2.Helicopter
      L4_2 = L4_2.CheckJob
      if L4_2 then
        L4_2 = Config
        L4_2 = L4_2.Licenses
        L4_2 = L4_2.Helicopter
        L4_2 = L4_2.UseCustomJobCheck
        if L4_2 then
          L4_2 = promise
          L4_2 = L4_2.new
          L4_2 = L4_2()
          L5_2 = Config
          L5_2 = L5_2.Licenses
          L5_2 = L5_2.Helicopter
          L5_2 = L5_2.CheckJobFunction
          function L6_2(A0_3)
            local L1_3, L2_3, L3_3
            L1_3 = L4_2
            L2_3 = L1_3
            L1_3 = L1_3.resolve
            L3_3 = A0_3
            L1_3(L2_3, L3_3)
          end
          L5_2(L6_2)
          L5_2 = Citizen
          L5_2 = L5_2.Await
          L6_2 = L4_2
          L5_2(L6_2)
          if L4_2 then
            L3_2 = L4_2.value
            if L3_2 then
              L5_2 = HasAuth
              L6_2 = L1_2
              L5_2 = L5_2(L6_2)
              if not L5_2 then
                L5_2 = AddKey
                L6_2 = L1_2
                L5_2(L6_2)
                L5_2 = SetVehicleEngineOn
                L6_2 = L1_2
                L7_2 = true
                L8_2 = false
                L9_2 = Config
                L9_2 = L9_2.DisableAutoStartEngine
                if L9_2 then
                  L9_2 = true
                  if L9_2 then
                    goto lbl_139
                  end
                end
                L9_2 = false
                ::lbl_139::
                L5_2(L6_2, L7_2, L8_2, L9_2)
              end
              L5_2 = SetVehicleUndriveable
              L6_2 = L1_2
              L7_2 = false
              L5_2(L6_2, L7_2)
            end
          end
        else
          L4_2 = Config
          L4_2 = L4_2.Licenses
          L4_2 = L4_2.Helicopter
          L4_2 = L4_2.AuthorizedJobs
          if L4_2 then
            L4_2 = framework
            L5_2 = L4_2
            L4_2 = L4_2.getJob
            L4_2, L5_2 = L4_2(L5_2)
            if L4_2 then
              L6_2 = type
              L7_2 = Config
              L7_2 = L7_2.Licenses
              L7_2 = L7_2.Helicopter
              L7_2 = L7_2.AuthorizedJobs
              L6_2 = L6_2(L7_2)
              if "string" == L6_2 then
                L6_2 = Config
                L6_2 = L6_2.Licenses
                L6_2 = L6_2.Helicopter
                L6_2 = L6_2.AuthorizedJobs
                if L4_2 ~= L6_2 then
                  goto lbl_254
                end
                L3_2 = true
                L6_2 = HasAuth
                L7_2 = L1_2
                L6_2 = L6_2(L7_2)
                if not L6_2 then
                  L6_2 = AddKey
                  L7_2 = L1_2
                  L6_2(L7_2)
                  L6_2 = SetVehicleEngineOn
                  L7_2 = L1_2
                  L8_2 = true
                  L9_2 = false
                  L10_2 = Config
                  L10_2 = L10_2.DisableAutoStartEngine
                  if L10_2 then
                    L10_2 = true
                    if L10_2 then
                      goto lbl_192
                    end
                  end
                  L10_2 = false
                  ::lbl_192::
                  L6_2(L7_2, L8_2, L9_2, L10_2)
                end
                L6_2 = SetVehicleUndriveable
                L7_2 = L1_2
                L8_2 = false
                L6_2(L7_2, L8_2)
              else
                L6_2 = type
                L7_2 = Config
                L7_2 = L7_2.Licenses
                L7_2 = L7_2.Helicopter
                L7_2 = L7_2.AuthorizedJobs
                L6_2 = L6_2(L7_2)
                if "table" == L6_2 then
                  L6_2 = next
                  L7_2 = L6_2
                  L8_2 = Config
                  L8_2 = L8_2.Licenses
                  L8_2 = L8_2.Helicopter
                  L8_2 = L8_2.AuthorizedJobs
                  L7_2 = L7_2(L8_2)
                  if nil ~= L7_2 then
                    L7_2 = pairs
                    L8_2 = Config
                    L8_2 = L8_2.Licenses
                    L8_2 = L8_2.Helicopter
                    L8_2 = L8_2.AuthorizedJobs
                    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
                    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
                      if L4_2 == L12_2 then
                        L3_2 = true
                        L13_2 = HasAuth
                        L14_2 = L1_2
                        L13_2 = L13_2(L14_2)
                        if not L13_2 then
                          L13_2 = AddKey
                          L14_2 = L1_2
                          L13_2(L14_2)
                          L13_2 = SetVehicleEngineOn
                          L14_2 = L1_2
                          L15_2 = true
                          L16_2 = false
                          L17_2 = Config
                          L17_2 = L17_2.DisableAutoStartEngine
                          if L17_2 then
                            L17_2 = true
                            if L17_2 then
                              goto lbl_245
                            end
                          end
                          L17_2 = false
                          ::lbl_245::
                          L13_2(L14_2, L15_2, L16_2, L17_2)
                        end
                        L13_2 = SetVehicleUndriveable
                        L14_2 = L1_2
                        L15_2 = false
                        L13_2(L14_2, L15_2)
                        break
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      ::lbl_254::
      if not L3_2 then
        L4_2 = Config
        L4_2 = L4_2.Licenses
        L4_2 = L4_2.Helicopter
        L4_2 = L4_2.CheckLicense
        if L4_2 then
          L4_2 = promise
          L4_2 = L4_2.new
          L4_2 = L4_2()
          L5_2 = Config
          L5_2 = L5_2.Licenses
          L5_2 = L5_2.Helicopter
          L5_2 = L5_2.CheckLicenseFunction
          function L6_2(A0_3)
            local L1_3, L2_3, L3_3
            L1_3 = L4_2
            L2_3 = L1_3
            L1_3 = L1_3.resolve
            L3_3 = A0_3
            L1_3(L2_3, L3_3)
          end
          L5_2(L6_2)
          L5_2 = Citizen
          L5_2 = L5_2.Await
          L6_2 = L4_2
          L5_2(L6_2)
          if L4_2 then
            L3_2 = L4_2.value
          end
        end
      end
      L4_2 = L3_2 or L4_2
      if not L3_2 or not L3_2 then
        L4_2 = false
      end
      return L4_2
    else
      if 16 ~= L2_2 then
        goto lbl_525
      end
      L4_2 = Config
      L4_2 = L4_2.Licenses
      L4_2 = L4_2.Plane
      L4_2 = L4_2.CheckJob
      if not L4_2 then
        L4_2 = Config
        L4_2 = L4_2.Licenses
        L4_2 = L4_2.Plane
        L4_2 = L4_2.CheckLicense
        if not L4_2 then
          L4_2 = Config
          L4_2 = L4_2.Licenses
          L4_2 = L4_2.Plane
          L4_2 = L4_2.UseCustomJobCheck
          if not L4_2 then
            L4_2 = true
            return L4_2
          end
        end
      end
      L4_2 = Entity
      L5_2 = A0_2
      L4_2 = L4_2(L5_2)
      L4_2 = L4_2.state
      L4_2 = L4_2.mk_lockpicked_flying
      if L4_2 then
        L4_2 = true
        return L4_2
      end
      L4_2 = Entity
      L5_2 = A0_2
      L4_2 = L4_2(L5_2)
      L4_2 = L4_2.state
      L4_2 = L4_2.mk_hotwired_flying
      if L4_2 then
        L4_2 = true
        return L4_2
      end
      L4_2 = Config
      L4_2 = L4_2.Licenses
      L4_2 = L4_2.Plane
      L4_2 = L4_2.CheckJob
      if L4_2 then
        L4_2 = Config
        L4_2 = L4_2.Licenses
        L4_2 = L4_2.Plane
        L4_2 = L4_2.UseCustomJobCheck
        if L4_2 then
          L4_2 = promise
          L4_2 = L4_2.new
          L4_2 = L4_2()
          L5_2 = Config
          L5_2 = L5_2.Licenses
          L5_2 = L5_2.Plane
          L5_2 = L5_2.CheckJobFunction
          function L6_2(A0_3)
            local L1_3, L2_3, L3_3
            L1_3 = L4_2
            L2_3 = L1_3
            L1_3 = L1_3.resolve
            L3_3 = A0_3
            L1_3(L2_3, L3_3)
          end
          L5_2(L6_2)
          L5_2 = Citizen
          L5_2 = L5_2.Await
          L6_2 = L4_2
          L5_2(L6_2)
          if L4_2 then
            L3_2 = L4_2.value
            if L3_2 then
              L5_2 = HasAuth
              L6_2 = L1_2
              L5_2 = L5_2(L6_2)
              if not L5_2 then
                L5_2 = AddKey
                L6_2 = L1_2
                L5_2(L6_2)
                L5_2 = SetVehicleEngineOn
                L6_2 = L1_2
                L7_2 = true
                L8_2 = false
                L9_2 = Config
                L9_2 = L9_2.DisableAutoStartEngine
                if L9_2 then
                  L9_2 = true
                  if L9_2 then
                    goto lbl_376
                  end
                end
                L9_2 = false
                ::lbl_376::
                L5_2(L6_2, L7_2, L8_2, L9_2)
              end
              L5_2 = SetVehicleUndriveable
              L6_2 = L1_2
              L7_2 = false
              L5_2(L6_2, L7_2)
            end
          end
        else
          L4_2 = Config
          L4_2 = L4_2.Licenses
          L4_2 = L4_2.Plane
          L4_2 = L4_2.AuthorizedJobs
          if L4_2 then
            L4_2 = framework
            L5_2 = L4_2
            L4_2 = L4_2.getJob
            L4_2, L5_2 = L4_2(L5_2)
            if L4_2 then
              L6_2 = type
              L7_2 = Config
              L7_2 = L7_2.Licenses
              L7_2 = L7_2.Plane
              L7_2 = L7_2.AuthorizedJobs
              L6_2 = L6_2(L7_2)
              if "string" == L6_2 then
                L6_2 = Config
                L6_2 = L6_2.Licenses
                L6_2 = L6_2.Plane
                L6_2 = L6_2.AuthorizedJobs
                if L4_2 ~= L6_2 then
                  goto lbl_491
                end
                L3_2 = true
                L6_2 = HasAuth
                L7_2 = L1_2
                L6_2 = L6_2(L7_2)
                if not L6_2 then
                  L6_2 = AddKey
                  L7_2 = L1_2
                  L6_2(L7_2)
                  L6_2 = SetVehicleEngineOn
                  L7_2 = L1_2
                  L8_2 = true
                  L9_2 = false
                  L10_2 = Config
                  L10_2 = L10_2.DisableAutoStartEngine
                  if L10_2 then
                    L10_2 = true
                    if L10_2 then
                      goto lbl_429
                    end
                  end
                  L10_2 = false
                  ::lbl_429::
                  L6_2(L7_2, L8_2, L9_2, L10_2)
                end
                L6_2 = SetVehicleUndriveable
                L7_2 = L1_2
                L8_2 = false
                L6_2(L7_2, L8_2)
              else
                L6_2 = type
                L7_2 = Config
                L7_2 = L7_2.Licenses
                L7_2 = L7_2.Plane
                L7_2 = L7_2.AuthorizedJobs
                L6_2 = L6_2(L7_2)
                if "table" == L6_2 then
                  L6_2 = next
                  L7_2 = L6_2
                  L8_2 = Config
                  L8_2 = L8_2.Licenses
                  L8_2 = L8_2.Plane
                  L8_2 = L8_2.AuthorizedJobs
                  L7_2 = L7_2(L8_2)
                  if nil ~= L7_2 then
                    L7_2 = pairs
                    L8_2 = Config
                    L8_2 = L8_2.Licenses
                    L8_2 = L8_2.Plane
                    L8_2 = L8_2.AuthorizedJobs
                    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
                    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
                      if L4_2 == L12_2 then
                        L3_2 = true
                        L13_2 = HasAuth
                        L14_2 = L1_2
                        L13_2 = L13_2(L14_2)
                        if not L13_2 then
                          L13_2 = AddKey
                          L14_2 = L1_2
                          L13_2(L14_2)
                          L13_2 = SetVehicleEngineOn
                          L14_2 = L1_2
                          L15_2 = true
                          L16_2 = false
                          L17_2 = Config
                          L17_2 = L17_2.DisableAutoStartEngine
                          if L17_2 then
                            L17_2 = true
                            if L17_2 then
                              goto lbl_482
                            end
                          end
                          L17_2 = false
                          ::lbl_482::
                          L13_2(L14_2, L15_2, L16_2, L17_2)
                        end
                        L13_2 = SetVehicleUndriveable
                        L14_2 = L1_2
                        L15_2 = false
                        L13_2(L14_2, L15_2)
                        break
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      ::lbl_491::
      if not L3_2 then
        L4_2 = Config
        L4_2 = L4_2.Licenses
        L4_2 = L4_2.Plane
        L4_2 = L4_2.CheckLicense
        if L4_2 then
          L4_2 = promise
          L4_2 = L4_2.new
          L4_2 = L4_2()
          L5_2 = Config
          L5_2 = L5_2.Licenses
          L5_2 = L5_2.Plane
          L5_2 = L5_2.CheckLicenseFunction
          function L6_2(A0_3)
            local L1_3, L2_3, L3_3
            L1_3 = L4_2
            L2_3 = L1_3
            L1_3 = L1_3.resolve
            L3_3 = A0_3
            L1_3(L2_3, L3_3)
          end
          L5_2(L6_2)
          L5_2 = Citizen
          L5_2 = L5_2.Await
          L6_2 = L4_2
          L5_2(L6_2)
          if L4_2 then
            L3_2 = L4_2.value
          end
        end
      end
      L4_2 = L3_2 or L4_2
      if not L3_2 or not L3_2 then
        L4_2 = false
      end
      return L4_2
    end
  else
    L4_2 = false
    return L4_2
  end
  ::lbl_525::
end
HasFlyingAuth = L3_1
L3_1 = exports
L4_1 = "HasFlyingAuth"
L5_1 = HasFlyingAuth
L3_1(L4_1, L5_1)
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = Config
  L2_2 = L2_2.Lockpick
  L2_2 = L2_2.LockpickIgnition
  if not L2_2 then
    return
  end
  L2_2 = GetVehiclePedIsIn
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = false
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 > 0 then
    L3_2 = GetPedInVehicleSeat
    L4_2 = L2_2
    L5_2 = -1
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = PlayerPedId
    L4_2 = L4_2()
    if L3_2 == L4_2 then
      L3_2 = Entity
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      L3_2 = L3_2.state
      L3_2 = L3_2.LockpickDisabled
      if not L3_2 then
        L3_2 = HasAuth
        L4_2 = L2_2
        L3_2 = L3_2(L4_2)
        if not L3_2 then
          L3_2 = IsLockpicking
          if not L3_2 then
            L3_2 = IsHotwiring
            if not L3_2 then
              L3_2 = Config
              L3_2 = L3_2.LockpickIgnitionCustomAuth
              L4_2 = L2_2
              L5_2 = utils
              L6_2 = L5_2
              L5_2 = L5_2.removeTrailSpaces
              L7_2 = GetVehicleNumberPlateText
              L8_2 = L2_2
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2)
              L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
              L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
              if not L3_2 then
                return
              end
              L3_2 = Entity
              L4_2 = L2_2
              L3_2 = L3_2(L4_2)
              L3_2 = L3_2.state
              L3_2 = L3_2.MKFOB
              if nil ~= L3_2 then
                L3_2 = Entity
                L4_2 = L2_2
                L3_2 = L3_2(L4_2)
                L3_2 = L3_2.state
                L3_2 = L3_2.MKFOB
                if not L3_2 then
                  goto lbl_463
                end
                L3_2 = Config
                L3_2 = L3_2.KeysAsItem
                L3_2 = L3_2.PlayerOwned
                L3_2 = L3_2.CanLockpickIgnition
                if not L3_2 then
                  goto lbl_463
                end
              end
              L3_2 = SetEntityAsMissionEntity
              L4_2 = L2_2
              L5_2 = true
              L6_2 = true
              L3_2(L4_2, L5_2, L6_2)
              IsLockpicking = true
              L3_2 = Config
              L3_2 = L3_2.PoliceNotify
              if L3_2 then
                L3_2 = Config
                L3_2 = L3_2.PoliceNotify
                L3_2 = L3_2.Chance
                if L3_2 then
                  L3_2 = Config
                  L3_2 = L3_2.PoliceNotify
                  L3_2 = L3_2.AlertTimeout
                  if L3_2 then
                    L3_2 = AlertCooldown
                    if L3_2 then
                      goto lbl_183
                    end
                    L3_2 = math
                    L3_2 = L3_2.random
                    L4_2 = 1
                    L5_2 = 100
                    L3_2 = L3_2(L4_2, L5_2)
                    L4_2 = Config
                    L4_2 = L4_2.PoliceNotify
                    L4_2 = L4_2.Chance
                    if not (L3_2 < L4_2) then
                      goto lbl_183
                    end
                    L4_2 = utils
                    L5_2 = L4_2
                    L4_2 = L4_2.removeTrailSpaces
                    L6_2 = GetVehicleNumberPlateText
                    L7_2 = L2_2
                    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2)
                    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                    L5_2 = GetEntityCoords
                    L6_2 = L2_2
                    L5_2 = L5_2(L6_2)
                    L6_2 = GetLabelText
                    L7_2 = GetDisplayNameFromVehicleModel
                    L8_2 = GetEntityModel
                    L9_2 = L2_2
                    L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2)
                    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
                    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                    if L6_2 then
                      L6_2 = GetLabelText
                      L7_2 = GetDisplayNameFromVehicleModel
                      L8_2 = GetEntityModel
                      L9_2 = L2_2
                      L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2)
                      L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
                      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                      if L6_2 then
                        goto lbl_134
                      end
                    end
                    L6_2 = "Unknown"
                    ::lbl_134::
                    AlertCooldown = true
                    L7_2 = framework
                    L8_2 = L7_2
                    L7_2 = L7_2.policeDispatchNotify
                    L9_2 = {}
                    L9_2.coords = L5_2
                    L9_2.plate = L4_2
                    L9_2.vehicleName = L6_2
                    L9_2.vehicle = L2_2
                    L10_2 = locale
                    L11_2 = "dispatch_alert_message"
                    L10_2 = L10_2(L11_2)
                    L9_2.message = L10_2
                    L10_2 = locale
                    L11_2 = "dispatch_alert_blip_text"
                    L10_2 = L10_2(L11_2)
                    L9_2.blipText = L10_2
                    L10_2 = GetEntityModel
                    L11_2 = L2_2
                    L10_2 = L10_2(L11_2)
                    L9_2.modelHash = L10_2
                    L10_2 = vehicles
                    L11_2 = GetEntityModel
                    L12_2 = L2_2
                    L11_2 = L11_2(L12_2)
                    L10_2 = L10_2[L11_2]
                    if L10_2 then
                      L10_2 = L10_2.name
                    end
                    L9_2.modelString = L10_2
                    L7_2(L8_2, L9_2)
                    L7_2 = SetTimeout
                    L8_2 = Config
                    L8_2 = L8_2.PoliceNotify
                    L8_2 = L8_2.AlertTimeout
                    L8_2 = L8_2 * 1000
                    function L9_2()
                      local L0_3, L1_3
                      AlertCooldown = false
                    end
                    L7_2(L8_2, L9_2)
                end
                else
                  L3_2 = utils
                  L3_2 = L3_2.logger
                  L4_2 = L3_2
                  L3_2 = L3_2.info
                  L5_2 = "VehicleKeys"
                  L6_2 = "^5Police Notify not setup properly; See Config.^7"
                  L7_2 = {}
                  L7_2.console = true
                  L3_2(L4_2, L5_2, L6_2, L7_2)
                end
              end
              ::lbl_183::
              L3_2 = Config
              L3_2 = L3_2.Lockpick
              L3_2 = L3_2.Game
              L3_2 = L3_2.Ignition
              L3_2 = L3_2.UseGame
              if not L3_2 then
                L3_2 = CreateThread
                function L4_2()
                  local L0_3, L1_3, L2_3
                  while true do
                    L0_3 = LocalPlayer
                    L0_3 = L0_3.state
                    L0_3 = L0_3.mk_isLoggedIn
                    if not L0_3 then
                      break
                    end
                    L0_3 = IsEntityDead
                    L1_3 = PlayerPedId
                    L1_3, L2_3 = L1_3()
                    L0_3 = L0_3(L1_3, L2_3)
                    if L0_3 then
                      break
                    end
                    L0_3 = IsLockpicking
                    if not L0_3 then
                      break
                    end
                    L0_3 = Wait
                    L1_3 = 10
                    L0_3(L1_3)
                    L0_3 = GetVehiclePedIsIn
                    L1_3 = PlayerPedId
                    L1_3 = L1_3()
                    L2_3 = false
                    L0_3 = L0_3(L1_3, L2_3)
                    L1_3 = L2_2
                    if L0_3 == L1_3 then
                      L0_3 = GetPedInVehicleSeat
                      L1_3 = L2_2
                      L2_3 = -1
                      L0_3 = L0_3(L1_3, L2_3)
                      L1_3 = PlayerPedId
                      L1_3 = L1_3()
                      if L0_3 == L1_3 then
                        goto lbl_44
                      end
                    end
                    L0_3 = lib
                    L0_3 = L0_3.skillCheckActive
                    L0_3 = L0_3()
                    if L0_3 then
                      L0_3 = lib
                      L0_3 = L0_3.cancelSkillCheck
                      L0_3()
                      IsLockpicking = false
                    end
                    do break end
                    ::lbl_44::
                  end
                  L0_3 = LocalPlayer
                  L0_3 = L0_3.state
                  L0_3 = L0_3.mk_isLoggedIn
                  if L0_3 then
                    L0_3 = IsEntityDead
                    L1_3 = PlayerPedId
                    L1_3, L2_3 = L1_3()
                    L0_3 = L0_3(L1_3, L2_3)
                    if not L0_3 then
                      goto lbl_65
                    end
                  end
                  L0_3 = lib
                  L0_3 = L0_3.skillCheckActive
                  L0_3 = L0_3()
                  if L0_3 then
                    L0_3 = lib
                    L0_3 = L0_3.cancelSkillCheck
                    L0_3()
                    IsLockpicking = false
                  end
                  ::lbl_65::
                end
                L3_2(L4_2)
                L3_2 = LockpickIgnitionAnim
                L3_2()
                L3_2 = SetVehicleAlarm
                L4_2 = L2_2
                L5_2 = true
                L3_2(L4_2, L5_2)
                L3_2 = SetVehicleAlarmTimeLeft
                L4_2 = L2_2
                L5_2 = 15000
                L3_2(L4_2, L5_2)
                L3_2 = nil
                if A0_2 then
                  L4_2 = lib
                  L4_2 = L4_2.skillCheck
                  L5_2 = {}
                  L6_2 = "easy"
                  L7_2 = "easy"
                  L8_2 = "easy"
                  L5_2[1] = L6_2
                  L5_2[2] = L7_2
                  L5_2[3] = L8_2
                  L4_2 = L4_2(L5_2)
                  L3_2 = L4_2
                else
                  L4_2 = lib
                  L4_2 = L4_2.skillCheck
                  L5_2 = {}
                  L6_2 = "easy"
                  L7_2 = "medium"
                  L8_2 = "hard"
                  L5_2[1] = L6_2
                  L5_2[2] = L7_2
                  L5_2[3] = L8_2
                  L4_2 = L4_2(L5_2)
                  L3_2 = L4_2
                end
                if L3_2 then
                  L4_2 = GetVehicleClass
                  L5_2 = L2_2
                  L4_2 = L4_2(L5_2)
                  if 15 ~= L4_2 then
                    L4_2 = GetVehicleClass
                    L5_2 = L2_2
                    L4_2 = L4_2(L5_2)
                    if 16 ~= L4_2 then
                      goto lbl_244
                    end
                  end
                  L4_2 = Entity
                  L5_2 = L2_2
                  L4_2 = L4_2(L5_2)
                  L4_2 = L4_2.state
                  L4_2.mk_lockpicked_flying = true
                  ::lbl_244::
                  L4_2 = false
                  L0_1 = L4_2
                  L4_2 = StopAnimTask
                  L5_2 = PlayerPedId
                  L5_2 = L5_2()
                  L6_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
                  L7_2 = "machinic_loop_mechandplayer"
                  L8_2 = 1.0
                  L4_2(L5_2, L6_2, L7_2, L8_2)
                  L4_2 = Wait
                  L5_2 = 0
                  L4_2(L5_2)
                  L4_2 = SetVehicleAlarm
                  L5_2 = L2_2
                  L6_2 = false
                  L4_2(L5_2, L6_2)
                  L4_2 = SetVehicleAlarmTimeLeft
                  L5_2 = L2_2
                  L6_2 = 0
                  L4_2(L5_2, L6_2)
                  L4_2 = TriggerServerEvent
                  L5_2 = "MK_VehicleKeys:Server:AddKey"
                  L6_2 = NetworkGetNetworkIdFromEntity
                  L7_2 = L2_2
                  L6_2 = L6_2(L7_2)
                  L7_2 = false
                  L8_2 = false
                  L9_2 = true
                  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
                  L4_2 = SetVehicleUndriveable
                  L5_2 = L2_2
                  L6_2 = false
                  L4_2(L5_2, L6_2)
                  L4_2 = GetIsVehicleEngineRunning
                  L5_2 = L2_2
                  L4_2 = L4_2(L5_2)
                  if not L4_2 then
                    L4_2 = Config
                    L4_2 = L4_2.DisableAutoStartEngine
                    if L4_2 then
                      L4_2 = SetVehicleEngineOn
                      L5_2 = L2_2
                      L6_2 = false
                      L7_2 = true
                      L8_2 = true
                      L4_2(L5_2, L6_2, L7_2, L8_2)
                    else
                      L4_2 = SetVehicleEngineOn
                      L5_2 = L2_2
                      L6_2 = true
                      L7_2 = false
                      L8_2 = Config
                      L8_2 = L8_2.DisableAutoStartEngine
                      if L8_2 then
                        L8_2 = true
                        if L8_2 then
                          goto lbl_305
                        end
                      end
                      L8_2 = false
                      ::lbl_305::
                      L4_2(L5_2, L6_2, L7_2, L8_2)
                    end
                  end
                  L4_2 = Config
                  L4_2 = L4_2.Lockpick
                  L4_2 = L4_2.IgnitionBreakPick
                  L4_2 = L4_2.OnSuccess
                  L4_2 = L4_2.Break
                  if L4_2 then
                    L4_2 = math
                    L4_2 = L4_2.random
                    L5_2 = 1
                    L6_2 = 100
                    L4_2 = L4_2(L5_2, L6_2)
                    if A0_2 then
                      L5_2 = math
                      L5_2 = L5_2.ceil
                      L6_2 = Config
                      L6_2 = L6_2.Lockpick
                      L6_2 = L6_2.IgnitionBreakPick
                      L6_2 = L6_2.OnSuccess
                      L6_2 = L6_2.Chance
                      L6_2 = L6_2 * 0.5
                      L5_2 = L5_2(L6_2)
                      if L5_2 then
                        goto lbl_337
                      end
                    end
                    L5_2 = Config
                    L5_2 = L5_2.Lockpick
                    L5_2 = L5_2.IgnitionBreakPick
                    L5_2 = L5_2.OnSuccess
                    L5_2 = L5_2.Chance
                    ::lbl_337::
                    if L4_2 <= L5_2 then
                      L6_2 = TriggerServerEvent
                      L7_2 = "MK_VehicleKeys:Server:BrokenLockpick"
                      L8_2 = A1_2
                      L6_2(L7_2, L8_2)
                    end
                  end
                  L4_2 = Config
                  L4_2 = L4_2.LockpickIgnitionEvent
                  L5_2 = L2_2
                  L6_2 = utils
                  L7_2 = L6_2
                  L6_2 = L6_2.removeTrailSpaces
                  L8_2 = GetVehicleNumberPlateText
                  L9_2 = L2_2
                  L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2)
                  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                  L7_2 = GetEntityCoords
                  L8_2 = L2_2
                  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2)
                  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
                  IsLockpicking = false
                else
                  L4_2 = false
                  L0_1 = L4_2
                  L4_2 = StopAnimTask
                  L5_2 = PlayerPedId
                  L5_2 = L5_2()
                  L6_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
                  L7_2 = "machinic_loop_mechandplayer"
                  L8_2 = 1.0
                  L4_2(L5_2, L6_2, L7_2, L8_2)
                  L4_2 = Wait
                  L5_2 = 10
                  L4_2(L5_2)
                  L4_2 = utils
                  L5_2 = L4_2
                  L4_2 = L4_2.notify
                  L6_2 = locale
                  L7_2 = "ignition_fail"
                  L6_2 = L6_2(L7_2)
                  L7_2 = "error"
                  L8_2 = 5000
                  L4_2(L5_2, L6_2, L7_2, L8_2)
                  L4_2 = Config
                  L4_2 = L4_2.Lockpick
                  L4_2 = L4_2.IgnitionBreakPick
                  L4_2 = L4_2.OnFail
                  L4_2 = L4_2.Break
                  if L4_2 then
                    L4_2 = math
                    L4_2 = L4_2.random
                    L5_2 = 1
                    L6_2 = 100
                    L4_2 = L4_2(L5_2, L6_2)
                    if A0_2 then
                      L5_2 = math
                      L5_2 = L5_2.ceil
                      L6_2 = Config
                      L6_2 = L6_2.Lockpick
                      L6_2 = L6_2.IgnitionBreakPick
                      L6_2 = L6_2.OnFail
                      L6_2 = L6_2.Chance
                      L6_2 = L6_2 * 0.5
                      L5_2 = L5_2(L6_2)
                      if L5_2 then
                        goto lbl_409
                      end
                    end
                    L5_2 = Config
                    L5_2 = L5_2.Lockpick
                    L5_2 = L5_2.IgnitionBreakPick
                    L5_2 = L5_2.OnFail
                    L5_2 = L5_2.Chance
                    ::lbl_409::
                    if L4_2 <= L5_2 then
                      L6_2 = TriggerServerEvent
                      L7_2 = "MK_VehicleKeys:Server:BrokenLockpick"
                      L8_2 = A1_2
                      L6_2(L7_2, L8_2)
                    end
                  end
                  IsLockpicking = false
                end
              else
                L3_2 = Config
                L3_2 = L3_2.Lockpick
                L3_2 = L3_2.Game
                L3_2 = L3_2.Ignition
                L3_2 = L3_2.StartGame
                if L3_2 then
                  L3_2 = Config
                  L3_2 = L3_2.Lockpick
                  L3_2 = L3_2.Game
                  L3_2 = L3_2.Ignition
                  L3_2 = L3_2.StopGame
                  if L3_2 then
                    L3_2 = CreateThread
                    function L4_2()
                      local L0_3, L1_3, L2_3
                      while true do
                        L0_3 = LocalPlayer
                        L0_3 = L0_3.state
                        L0_3 = L0_3.mk_isLoggedIn
                        if not L0_3 then
                          break
                        end
                        L0_3 = IsEntityDead
                        L1_3 = PlayerPedId
                        L1_3, L2_3 = L1_3()
                        L0_3 = L0_3(L1_3, L2_3)
                        if L0_3 then
                          break
                        end
                        L0_3 = IsLockpicking
                        if not L0_3 then
                          break
                        end
                        L0_3 = Wait
                        L1_3 = 10
                        L0_3(L1_3)
                        L0_3 = GetVehiclePedIsIn
                        L1_3 = PlayerPedId
                        L1_3 = L1_3()
                        L2_3 = false
                        L0_3 = L0_3(L1_3, L2_3)
                        L1_3 = L2_2
                        if L0_3 == L1_3 then
                          L0_3 = GetPedInVehicleSeat
                          L1_3 = L2_2
                          L2_3 = -1
                          L0_3 = L0_3(L1_3, L2_3)
                          L1_3 = PlayerPedId
                          L1_3 = L1_3()
                          if L0_3 == L1_3 then
                            goto lbl_41
                          end
                        end
                        L0_3 = Config
                        L0_3 = L0_3.Lockpick
                        L0_3 = L0_3.Game
                        L0_3 = L0_3.Ignition
                        L0_3 = L0_3.StopGame
                        L0_3()
                        IsLockpicking = false
                        ::lbl_41::
                      end
                      L0_3 = LocalPlayer
                      L0_3 = L0_3.state
                      L0_3 = L0_3.mk_isLoggedIn
                      if L0_3 then
                        L0_3 = IsEntityDead
                        L1_3 = PlayerPedId
                        L1_3, L2_3 = L1_3()
                        L0_3 = L0_3(L1_3, L2_3)
                        if not L0_3 then
                          goto lbl_60
                        end
                      end
                      L0_3 = Config
                      L0_3 = L0_3.Lockpick
                      L0_3 = L0_3.Game
                      L0_3 = L0_3.Ignition
                      L0_3 = L0_3.StopGame
                      L0_3()
                      IsLockpicking = false
                      ::lbl_60::
                    end
                    L3_2(L4_2)
                  end
                  L3_2 = LockpickIgnitionAnim
                  L3_2()
                  L3_2 = SetVehicleAlarm
                  L4_2 = L2_2
                  L5_2 = true
                  L3_2(L4_2, L5_2)
                  L3_2 = SetVehicleAlarmTimeLeft
                  L4_2 = L2_2
                  L5_2 = 15000
                  L3_2(L4_2, L5_2)
                  L3_2 = Config
                  L3_2 = L3_2.Lockpick
                  L3_2 = L3_2.Game
                  L3_2 = L3_2.Ignition
                  L3_2 = L3_2.StartGame
                  L4_2 = A0_2
                  function L5_2(A0_3)
                    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
                    if A0_3 then
                      L1_3 = GetVehicleClass
                      L2_3 = L2_2
                      L1_3 = L1_3(L2_3)
                      if 15 ~= L1_3 then
                        L1_3 = GetVehicleClass
                        L2_3 = L2_2
                        L1_3 = L1_3(L2_3)
                        if 16 ~= L1_3 then
                          goto lbl_18
                        end
                      end
                      L1_3 = Entity
                      L2_3 = L2_2
                      L1_3 = L1_3(L2_3)
                      L1_3 = L1_3.state
                      L1_3.mk_lockpicked_flying = true
                      ::lbl_18::
                      L1_3 = false
                      L0_1 = L1_3
                      L1_3 = StopAnimTask
                      L2_3 = PlayerPedId
                      L2_3 = L2_3()
                      L3_3 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
                      L4_3 = "machinic_loop_mechandplayer"
                      L5_3 = 1.0
                      L1_3(L2_3, L3_3, L4_3, L5_3)
                      L1_3 = Wait
                      L2_3 = 0
                      L1_3(L2_3)
                      L1_3 = SetVehicleAlarm
                      L2_3 = L2_2
                      L3_3 = false
                      L1_3(L2_3, L3_3)
                      L1_3 = SetVehicleAlarmTimeLeft
                      L2_3 = L2_2
                      L3_3 = 0
                      L1_3(L2_3, L3_3)
                      L1_3 = TriggerServerEvent
                      L2_3 = "MK_VehicleKeys:Server:AddKey"
                      L3_3 = NetworkGetNetworkIdFromEntity
                      L4_3 = L2_2
                      L3_3 = L3_3(L4_3)
                      L4_3 = false
                      L5_3 = false
                      L6_3 = true
                      L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
                      L1_3 = SetVehicleUndriveable
                      L2_3 = L2_2
                      L3_3 = false
                      L1_3(L2_3, L3_3)
                      L1_3 = GetIsVehicleEngineRunning
                      L2_3 = L2_2
                      L1_3 = L1_3(L2_3)
                      if not L1_3 then
                        L1_3 = Config
                        L1_3 = L1_3.DisableAutoStartEngine
                        if L1_3 then
                          L1_3 = SetVehicleEngineOn
                          L2_3 = L2_2
                          L3_3 = false
                          L4_3 = true
                          L5_3 = true
                          L1_3(L2_3, L3_3, L4_3, L5_3)
                        else
                          L1_3 = SetVehicleEngineOn
                          L2_3 = L2_2
                          L3_3 = true
                          L4_3 = false
                          L5_3 = Config
                          L5_3 = L5_3.DisableAutoStartEngine
                          if L5_3 then
                            L5_3 = true
                            if L5_3 then
                              goto lbl_79
                            end
                          end
                          L5_3 = false
                          ::lbl_79::
                          L1_3(L2_3, L3_3, L4_3, L5_3)
                        end
                      end
                      L1_3 = Config
                      L1_3 = L1_3.Lockpick
                      L1_3 = L1_3.IgnitionBreakPick
                      L1_3 = L1_3.OnSuccess
                      L1_3 = L1_3.Break
                      if L1_3 then
                        L1_3 = math
                        L1_3 = L1_3.random
                        L2_3 = 1
                        L3_3 = 100
                        L1_3 = L1_3(L2_3, L3_3)
                        L2_3 = A0_2
                        if L2_3 then
                          L2_3 = math
                          L2_3 = L2_3.ceil
                          L3_3 = Config
                          L3_3 = L3_3.Lockpick
                          L3_3 = L3_3.IgnitionBreakPick
                          L3_3 = L3_3.OnSuccess
                          L3_3 = L3_3.Chance
                          L3_3 = L3_3 * 0.5
                          L2_3 = L2_3(L3_3)
                          if L2_3 then
                            goto lbl_112
                          end
                        end
                        L2_3 = Config
                        L2_3 = L2_3.Lockpick
                        L2_3 = L2_3.IgnitionBreakPick
                        L2_3 = L2_3.OnSuccess
                        L2_3 = L2_3.Chance
                        ::lbl_112::
                        if L1_3 <= L2_3 then
                          L3_3 = TriggerServerEvent
                          L4_3 = "MK_VehicleKeys:Server:BrokenLockpick"
                          L5_3 = A1_2
                          L3_3(L4_3, L5_3)
                        end
                      end
                      L1_3 = Config
                      L1_3 = L1_3.LockpickIgnitionEvent
                      L2_3 = L2_2
                      L3_3 = utils
                      L4_3 = L3_3
                      L3_3 = L3_3.removeTrailSpaces
                      L5_3 = GetVehicleNumberPlateText
                      L6_3 = L2_2
                      L5_3, L6_3 = L5_3(L6_3)
                      L3_3 = L3_3(L4_3, L5_3, L6_3)
                      L4_3 = GetEntityCoords
                      L5_3 = L2_2
                      L4_3, L5_3, L6_3 = L4_3(L5_3)
                      L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
                      IsLockpicking = false
                    else
                      L1_3 = false
                      L0_1 = L1_3
                      L1_3 = StopAnimTask
                      L2_3 = PlayerPedId
                      L2_3 = L2_3()
                      L3_3 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
                      L4_3 = "machinic_loop_mechandplayer"
                      L5_3 = 1.0
                      L1_3(L2_3, L3_3, L4_3, L5_3)
                      L1_3 = Wait
                      L2_3 = 0
                      L1_3(L2_3)
                      L1_3 = utils
                      L2_3 = L1_3
                      L1_3 = L1_3.notify
                      L3_3 = locale
                      L4_3 = "ignition_fail"
                      L3_3 = L3_3(L4_3)
                      L4_3 = "error"
                      L5_3 = 5000
                      L1_3(L2_3, L3_3, L4_3, L5_3)
                      L1_3 = Config
                      L1_3 = L1_3.Lockpick
                      L1_3 = L1_3.IgnitionBreakPick
                      L1_3 = L1_3.OnFail
                      L1_3 = L1_3.Break
                      if L1_3 then
                        L1_3 = math
                        L1_3 = L1_3.random
                        L2_3 = 1
                        L3_3 = 100
                        L1_3 = L1_3(L2_3, L3_3)
                        L2_3 = A0_2
                        if L2_3 then
                          L2_3 = math
                          L2_3 = L2_3.ceil
                          L3_3 = Config
                          L3_3 = L3_3.Lockpick
                          L3_3 = L3_3.IgnitionBreakPick
                          L3_3 = L3_3.OnFail
                          L3_3 = L3_3.Chance
                          L3_3 = L3_3 * 0.5
                          L2_3 = L2_3(L3_3)
                          if L2_3 then
                            goto lbl_185
                          end
                        end
                        L2_3 = Config
                        L2_3 = L2_3.Lockpick
                        L2_3 = L2_3.IgnitionBreakPick
                        L2_3 = L2_3.OnFail
                        L2_3 = L2_3.Chance
                        ::lbl_185::
                        if L1_3 <= L2_3 then
                          L3_3 = TriggerServerEvent
                          L4_3 = "MK_VehicleKeys:Server:BrokenLockpick"
                          L5_3 = A1_2
                          L3_3(L4_3, L5_3)
                        end
                      end
                      IsLockpicking = false
                    end
                  end
                  L3_2(L4_2, L5_2)
                else
                  IsLockpicking = false
                  L3_2 = utils
                  L3_2 = L3_2.logger
                  L4_2 = L3_2
                  L3_2 = L3_2.info
                  L5_2 = "VehicleKeys"
                  L6_2 = "^5Game function not setup; See Config.^7"
                  L7_2 = {}
                  L7_2.console = true
                  L3_2(L4_2, L5_2, L6_2, L7_2)
                end
              end
            end
          end
        end
      end
    end
  end
  ::lbl_463::
end
LockpickIgnition = L3_1
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = Config
  L2_2 = L2_2.Lockpick
  L2_2 = L2_2.LockpickVehicleDoors
  if not L2_2 then
    return
  end
  L2_2 = utils
  L3_2 = L2_2
  L2_2 = L2_2.getClosestVehicle
  L2_2, L3_2 = L2_2(L3_2)
  if L2_2 and L3_2 then
    L4_2 = Entity
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    L4_2 = L4_2.state
    L4_2 = L4_2.LockpickDisabled
    if not L4_2 and L3_2 < 5.0 then
      L4_2 = Config
      L4_2 = L4_2.LockpickDoorCustomAuth
      L5_2 = L2_2
      L6_2 = utils
      L7_2 = L6_2
      L6_2 = L6_2.removeTrailSpaces
      L8_2 = GetVehicleNumberPlateText
      L9_2 = L2_2
      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L8_2(L9_2)
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      if not L4_2 then
        return
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
        if not L4_2 then
          goto lbl_677
        end
        L4_2 = Config
        L4_2 = L4_2.KeysAsItem
        L4_2 = L4_2.PlayerOwned
        L4_2 = L4_2.CanLockpickDoor
        if not L4_2 then
          goto lbl_677
        end
      end
      L4_2 = GetEntityCoords
      L5_2 = L2_2
      L4_2 = L4_2(L5_2)
      L5_2 = GetEntityCoords
      L6_2 = PlayerPedId
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L6_2()
      L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      L6_2 = false
      L7_2 = false
      L8_2 = {}
      L9_2 = "door_dside_f"
      L10_2 = "door_dside_r"
      L11_2 = "door_pside_f"
      L12_2 = "door_pside_r"
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L8_2[4] = L12_2
      L9_2 = pairs
      L10_2 = L8_2
      L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
      for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
        L15_2 = GetEntityBoneIndexByName
        L16_2 = L2_2
        L17_2 = L14_2
        L15_2 = L15_2(L16_2, L17_2)
        if -1 ~= L15_2 then
          L7_2 = true
          L15_2 = GetWorldPositionOfEntityBone
          L16_2 = L2_2
          L17_2 = GetEntityBoneIndexByName
          L18_2 = L2_2
          L19_2 = L14_2
          L17_2, L18_2, L19_2 = L17_2(L18_2, L19_2)
          L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2)
          L16_2 = L5_2 - L15_2
          L16_2 = #L16_2
          L17_2 = 2.5
          if L16_2 < L17_2 then
            L6_2 = true
            break
          end
        end
      end
      if not L7_2 then
        L9_2 = L5_2 - L4_2
        L9_2 = #L9_2
        L10_2 = 2.5
      end
      if L9_2 < L10_2 or L7_2 and L6_2 then
        L9_2 = HasAuth
        L10_2 = L2_2
        L9_2 = L9_2(L10_2)
        if L9_2 then
          goto lbl_677
        end
        L9_2 = IsVehicleSeatFree
        L10_2 = L2_2
        L11_2 = -1
        L9_2 = L9_2(L10_2, L11_2)
        if L9_2 then
          L9_2 = GetVehicleNumberOfPassengers
          L10_2 = L2_2
          L9_2 = L9_2(L10_2)
          if 0 == L9_2 then
            goto lbl_168
          end
        end
        L9_2 = GetPedInVehicleSeat
        L10_2 = L2_2
        L11_2 = -1
        L9_2 = L9_2(L10_2, L11_2)
        if not (L9_2 > 0) then
          goto lbl_677
        end
        L9_2 = IsPedAPlayer
        L10_2 = GetPedInVehicleSeat
        L11_2 = L2_2
        L12_2 = -1
        L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L10_2(L11_2, L12_2)
        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
        if L9_2 then
          goto lbl_677
        end
        L9_2 = IsEntityDead
        L10_2 = GetPedInVehicleSeat
        L11_2 = L2_2
        L12_2 = -1
        L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L10_2(L11_2, L12_2)
        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
        if not L9_2 then
          L9_2 = GetEntityHealth
          L10_2 = GetPedInVehicleSeat
          L11_2 = L2_2
          L12_2 = -1
          L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L10_2(L11_2, L12_2)
          L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
          if not (L9_2 <= 0) then
            L9_2 = IsPedDeadOrDying
            L10_2 = GetPedInVehicleSeat
            L11_2 = L2_2
            L12_2 = -1
            L10_2 = L10_2(L11_2, L12_2)
            L11_2 = 1
            L9_2 = L9_2(L10_2, L11_2)
            if not L9_2 then
              goto lbl_677
            end
          end
        end
        ::lbl_168::
        L9_2 = GetVehicleNumberOfPassengers
        L10_2 = L2_2
        L9_2 = L9_2(L10_2)
        if L9_2 > 0 then
          L9_2 = GetVehicleMaxNumberOfPassengers
          L10_2 = localvehicle
          L9_2 = L9_2(L10_2)
          L10_2 = 0
          repeat
            L11_2 = GetPedInVehicleSeat
            L12_2 = localvehicle
            L13_2 = L10_2
            L11_2 = L11_2(L12_2, L13_2)
            if L11_2 > 0 then
              L11_2 = GetPedInVehicleSeat
              L12_2 = localvehicle
              L13_2 = L10_2
              L11_2 = L11_2(L12_2, L13_2)
              L12_2 = IsPedAPlayer
              L13_2 = L11_2
              L12_2 = L12_2(L13_2)
              if not L12_2 then
                L12_2 = TaskLeaveVehicle
                L13_2 = L11_2
                L14_2 = localvehicle
                L15_2 = 1
                L12_2(L13_2, L14_2, L15_2)
                L12_2 = 0
                while true do
                  L13_2 = IsPedInAnyVehicle
                  L14_2 = L11_2
                  L15_2 = false
                  L13_2 = L13_2(L14_2, L15_2)
                  if not L13_2 then
                    break
                  end
                  L13_2 = 1000
                  if not (L12_2 < L13_2) then
                    break
                  end
                  L13_2 = Wait
                  L14_2 = 5
                  L13_2(L14_2)
                  L12_2 = L12_2 + 1
                end
                L13_2 = SetPedDropsWeaponsWhenDead
                L14_2 = L11_2
                L15_2 = false
                L13_2(L14_2, L15_2)
                L13_2 = ClearPedTasksImmediately
                L14_2 = L11_2
                L13_2(L14_2)
                L13_2 = TaskSetBlockingOfNonTemporaryEvents
                L14_2 = L11_2
                L15_2 = true
                L13_2(L14_2, L15_2)
                L13_2 = SetPedCombatAttributes
                L14_2 = L11_2
                L15_2 = 1
                L16_2 = false
                L13_2(L14_2, L15_2, L16_2)
                L13_2 = SetPedCombatAttributes
                L14_2 = L11_2
                L15_2 = 46
                L16_2 = false
                L13_2(L14_2, L15_2, L16_2)
                L13_2 = ResetPedLastVehicle
                L14_2 = L11_2
                L13_2(L14_2)
                L13_2 = TaskReactAndFleePed
                L14_2 = L11_2
                L15_2 = PlayerPedId
                L15_2, L16_2, L17_2, L18_2, L19_2 = L15_2()
                L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
                L13_2 = SetPedKeepTask
                L14_2 = L11_2
                L15_2 = true
                L13_2(L14_2, L15_2)
              end
            end
            L10_2 = L10_2 + 1
          until L9_2 <= L10_2
        end
        L9_2 = SetEntityAsMissionEntity
        L10_2 = L2_2
        L11_2 = true
        L12_2 = true
        L9_2(L10_2, L11_2, L12_2)
        L9_2 = GetVehicleDoorLockStatus
        L10_2 = L2_2
        L9_2 = L9_2(L10_2)
        if 2 == L9_2 or L9_2 > 3 then
          IsLockpicking = true
          L10_2 = TaskTurnPedToFaceEntity
          L11_2 = PlayerPedId
          L11_2 = L11_2()
          L12_2 = L2_2
          L13_2 = 1000
          L10_2(L11_2, L12_2, L13_2)
          L10_2 = Wait
          L11_2 = 1000
          L10_2(L11_2)
          L10_2 = Config
          L10_2 = L10_2.PoliceNotify
          if L10_2 then
            L10_2 = Config
            L10_2 = L10_2.PoliceNotify
            L10_2 = L10_2.Chance
            if L10_2 then
              L10_2 = Config
              L10_2 = L10_2.PoliceNotify
              L10_2 = L10_2.AlertTimeout
              if L10_2 then
                L10_2 = AlertCooldown
                if L10_2 then
                  goto lbl_376
                end
                L10_2 = math
                L10_2 = L10_2.random
                L11_2 = 1
                L12_2 = 100
                L10_2 = L10_2(L11_2, L12_2)
                L11_2 = Config
                L11_2 = L11_2.PoliceNotify
                L11_2 = L11_2.Chance
                if not (L10_2 < L11_2) then
                  goto lbl_376
                end
                L11_2 = utils
                L12_2 = L11_2
                L11_2 = L11_2.removeTrailSpaces
                L13_2 = GetVehicleNumberPlateText
                L14_2 = L2_2
                L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L13_2(L14_2)
                L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
                L12_2 = GetEntityCoords
                L13_2 = L2_2
                L12_2 = L12_2(L13_2)
                L13_2 = GetLabelText
                L14_2 = GetDisplayNameFromVehicleModel
                L15_2 = GetEntityModel
                L16_2 = L2_2
                L15_2, L16_2, L17_2, L18_2, L19_2 = L15_2(L16_2)
                L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
                L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
                if L13_2 then
                  L13_2 = GetLabelText
                  L14_2 = GetDisplayNameFromVehicleModel
                  L15_2 = GetEntityModel
                  L16_2 = L2_2
                  L15_2, L16_2, L17_2, L18_2, L19_2 = L15_2(L16_2)
                  L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
                  L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
                  if L13_2 then
                    goto lbl_327
                  end
                end
                L13_2 = "Unknown"
                ::lbl_327::
                AlertCooldown = true
                L14_2 = framework
                L15_2 = L14_2
                L14_2 = L14_2.policeDispatchNotify
                L16_2 = {}
                L16_2.coords = L12_2
                L16_2.plate = L11_2
                L16_2.vehicleName = L13_2
                L16_2.vehicle = L2_2
                L17_2 = locale
                L18_2 = "dispatch_alert_message"
                L17_2 = L17_2(L18_2)
                L16_2.message = L17_2
                L17_2 = locale
                L18_2 = "dispatch_alert_blip_text"
                L17_2 = L17_2(L18_2)
                L16_2.blipText = L17_2
                L17_2 = GetEntityModel
                L18_2 = L2_2
                L17_2 = L17_2(L18_2)
                L16_2.modelHash = L17_2
                L17_2 = vehicles
                L18_2 = GetEntityModel
                L19_2 = L2_2
                L18_2 = L18_2(L19_2)
                L17_2 = L17_2[L18_2]
                if L17_2 then
                  L17_2 = L17_2.name
                end
                L16_2.modelString = L17_2
                L14_2(L15_2, L16_2)
                L14_2 = SetTimeout
                L15_2 = Config
                L15_2 = L15_2.PoliceNotify
                L15_2 = L15_2.AlertTimeout
                L15_2 = L15_2 * 1000
                function L16_2()
                  local L0_3, L1_3
                  AlertCooldown = false
                end
                L14_2(L15_2, L16_2)
            end
            else
              L10_2 = utils
              L10_2 = L10_2.logger
              L11_2 = L10_2
              L10_2 = L10_2.info
              L12_2 = "VehicleKeys"
              L13_2 = "^5Police Notify not setup properly; See Config.^7"
              L14_2 = {}
              L14_2.console = true
              L10_2(L11_2, L12_2, L13_2, L14_2)
            end
          end
          ::lbl_376::
          L10_2 = Config
          L10_2 = L10_2.Lockpick
          L10_2 = L10_2.Game
          L10_2 = L10_2.VehicleDoors
          L10_2 = L10_2.UseGame
          if not L10_2 then
            L10_2 = math
            L10_2 = L10_2.random
            L11_2 = Config
            L11_2 = L11_2.Lockpick
            L11_2 = L11_2.DoorsTime
            L11_2 = L11_2.Min
            L11_2 = L11_2 * 1000
            L12_2 = Config
            L12_2 = L12_2.Lockpick
            L12_2 = L12_2.DoorsTime
            L12_2 = L12_2.Max
            L12_2 = L12_2 * 1000
            L10_2 = L10_2(L11_2, L12_2)
            if A0_2 then
              L11_2 = math
              L11_2 = L11_2.ceil
              L12_2 = L10_2 * 0.5
              L11_2 = L11_2(L12_2)
              L10_2 = L11_2
            end
            L11_2 = CreateThread
            function L12_2()
              local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
              L0_3 = GetEntityCoords
              L1_3 = L2_2
              L0_3 = L0_3(L1_3)
              L1_3 = GetEntityCoords
              L2_3 = PlayerPedId
              L2_3, L3_3, L4_3, L5_3, L6_3 = L2_3()
              L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
              while true do
                L2_3 = LocalPlayer
                L2_3 = L2_3.state
                L2_3 = L2_3.mk_isLoggedIn
                if not L2_3 then
                  break
                end
                L2_3 = IsEntityDead
                L3_3 = PlayerPedId
                L3_3, L4_3, L5_3, L6_3 = L3_3()
                L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3)
                if L2_3 then
                  break
                end
                L2_3 = IsLockpicking
                if not L2_3 then
                  break
                end
                L2_3 = GetEntityCoords
                L3_3 = L2_2
                L2_3 = L2_3(L3_3)
                L0_3 = L2_3
                L2_3 = GetEntityCoords
                L3_3 = PlayerPedId
                L3_3, L4_3, L5_3, L6_3 = L3_3()
                L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3)
                L1_3 = L2_3
                L2_3 = Wait
                L3_3 = 10
                L2_3(L3_3)
                L2_3 = L1_3 - L0_3
                L2_3 = #L2_3
                if L2_3 > 10.0 then
                  L2_3 = lib
                  L2_3 = L2_3.progressActive
                  L2_3 = L2_3()
                  if L2_3 then
                    L2_3 = lib
                    L2_3 = L2_3.cancelProgress
                    L2_3()
                  end
                  L2_3 = false
                  L0_1 = L2_3
                  L2_3 = StopAnimTask
                  L3_3 = PlayerPedId
                  L3_3 = L3_3()
                  L4_3 = "veh@break_in@0h@p_m_one@"
                  L5_3 = "low_force_entry_ds"
                  L6_3 = 1.0
                  L2_3(L3_3, L4_3, L5_3, L6_3)
                  L2_3 = Wait
                  L3_3 = 0
                  L2_3(L3_3)
                  IsLockpicking = false
                  break
                end
              end
              L2_3 = LocalPlayer
              L2_3 = L2_3.state
              L2_3 = L2_3.mk_isLoggedIn
              if L2_3 then
                L2_3 = IsEntityDead
                L3_3 = PlayerPedId
                L3_3, L4_3, L5_3, L6_3 = L3_3()
                L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3)
                if not L2_3 then
                  goto lbl_82
                end
              end
              L2_3 = lib
              L2_3 = L2_3.progressActive
              L2_3 = L2_3()
              if L2_3 then
                L2_3 = lib
                L2_3 = L2_3.cancelProgress
                L2_3()
              end
              IsLockpicking = false
              ::lbl_82::
              L2_3 = false
              L0_1 = L2_3
              L2_3 = StopAnimTask
              L3_3 = PlayerPedId
              L3_3 = L3_3()
              L4_3 = "veh@break_in@0h@p_m_one@"
              L5_3 = "low_force_entry_ds"
              L6_3 = 1.0
              L2_3(L3_3, L4_3, L5_3, L6_3)
              L2_3 = Wait
              L3_3 = 0
              L2_3(L3_3)
            end
            L11_2(L12_2)
            L11_2 = LockpickDoorAnim
            L12_2 = L10_2
            L11_2(L12_2)
            L11_2 = SetVehicleAlarm
            L12_2 = L2_2
            L13_2 = true
            L11_2(L12_2, L13_2)
            L11_2 = SetVehicleAlarmTimeLeft
            L12_2 = L2_2
            L13_2 = L10_2
            L11_2(L12_2, L13_2)
            L11_2 = "progressBar"
            L12_2 = nil
            L13_2 = Config
            L13_2 = L13_2.ProgressCircle
            if L13_2 then
              L11_2 = "progressCircle"
              L13_2 = Config
              L13_2 = L13_2.ProgressCirclePosition
              if L13_2 then
                L13_2 = Config
                L13_2 = L13_2.ProgressCirclePosition
                if L13_2 then
                  goto lbl_436
                  L12_2 = L13_2 or L12_2
                end
              end
              L12_2 = "middle"
            end
            ::lbl_436::
            L13_2 = lib
            L13_2 = L13_2[L11_2]
            L14_2 = {}
            L14_2.duration = L10_2
            L15_2 = locale
            L16_2 = "attempt_lockpick_door"
            L15_2 = L15_2(L16_2)
            L14_2.label = L15_2
            L14_2.position = L12_2
            L14_2.useWhileDead = false
            L14_2.canCancel = true
            L15_2 = {}
            L15_2.move = true
            L15_2.car = true
            L14_2.disable = L15_2
            L13_2 = L13_2(L14_2)
            if L13_2 then
              L13_2 = false
              L0_1 = L13_2
              L13_2 = StopAnimTask
              L14_2 = PlayerPedId
              L14_2 = L14_2()
              L15_2 = "veh@break_in@0h@p_m_one@"
              L16_2 = "low_force_entry_ds"
              L17_2 = 1.0
              L13_2(L14_2, L15_2, L16_2, L17_2)
              L13_2 = Wait
              L14_2 = 0
              L13_2(L14_2)
              L13_2 = math
              L13_2 = L13_2.random
              L14_2 = 1
              L15_2 = 100
              L13_2 = L13_2(L14_2, L15_2)
              L14_2 = Config
              L14_2 = L14_2.Lockpick
              L14_2 = L14_2.DoorsFailChance
              if L13_2 < L14_2 then
                L14_2 = utils
                L15_2 = L14_2
                L14_2 = L14_2.notify
                L16_2 = locale
                L17_2 = "lockpick_door_fail"
                L16_2 = L16_2(L17_2)
                L17_2 = "error"
                L18_2 = 5000
                L14_2(L15_2, L16_2, L17_2, L18_2)
                L14_2 = Config
                L14_2 = L14_2.Lockpick
                L14_2 = L14_2.DoorsBreakPick
                L14_2 = L14_2.OnFail
                L14_2 = L14_2.Break
                if not L14_2 then
                  goto lbl_597
                end
                L14_2 = math
                L14_2 = L14_2.random
                L15_2 = 1
                L16_2 = 100
                L14_2 = L14_2(L15_2, L16_2)
                if A0_2 then
                  L15_2 = math
                  L15_2 = L15_2.ceil
                  L16_2 = Config
                  L16_2 = L16_2.Lockpick
                  L16_2 = L16_2.DoorsBreakPick
                  L16_2 = L16_2.OnFail
                  L16_2 = L16_2.Chance
                  L16_2 = L16_2 * 0.5
                  L15_2 = L15_2(L16_2)
                  if L15_2 then
                    goto lbl_517
                  end
                end
                L15_2 = Config
                L15_2 = L15_2.Lockpick
                L15_2 = L15_2.DoorsBreakPick
                L15_2 = L15_2.OnFail
                L15_2 = L15_2.Chance
                ::lbl_517::
                if L14_2 <= L15_2 then
                  L16_2 = TriggerServerEvent
                  L17_2 = "MK_VehicleKeys:Server:BrokenLockpick"
                  L18_2 = A1_2
                  L16_2(L17_2, L18_2)
                end
              else
                L14_2 = Entity
                L15_2 = L2_2
                L14_2 = L14_2(L15_2)
                L14_2 = L14_2.state
                L14_2 = L14_2.LockBusy
                if not L14_2 then
                  L14_2 = TriggerServerEvent
                  L15_2 = "MK_VehicleKeys:Server:UnlockDoor"
                  L16_2 = NetworkGetNetworkIdFromEntity
                  L17_2 = L2_2
                  L16_2 = L16_2(L17_2)
                  L17_2 = L2_2
                  L14_2(L15_2, L16_2, L17_2)
                  L14_2 = Config
                  L14_2 = L14_2.Lockpick
                  L14_2 = L14_2.DoorsBreakPick
                  L14_2 = L14_2.OnSuccess
                  L14_2 = L14_2.Break
                  if L14_2 then
                    L14_2 = math
                    L14_2 = L14_2.random
                    L15_2 = 1
                    L16_2 = 100
                    L14_2 = L14_2(L15_2, L16_2)
                    if A0_2 then
                      L15_2 = math
                      L15_2 = L15_2.ceil
                      L16_2 = Config
                      L16_2 = L16_2.Lockpick
                      L16_2 = L16_2.DoorsBreakPick
                      L16_2 = L16_2.OnSuccess
                      L16_2 = L16_2.Chance
                      L16_2 = L16_2 * 0.5
                      L15_2 = L15_2(L16_2)
                      if L15_2 then
                        goto lbl_569
                      end
                    end
                    L15_2 = Config
                    L15_2 = L15_2.Lockpick
                    L15_2 = L15_2.DoorsBreakPick
                    L15_2 = L15_2.OnSuccess
                    L15_2 = L15_2.Chance
                    ::lbl_569::
                    if L14_2 <= L15_2 then
                      L16_2 = TriggerServerEvent
                      L17_2 = "MK_VehicleKeys:Server:BrokenLockpick"
                      L18_2 = A1_2
                      L16_2(L17_2, L18_2)
                    end
                  end
                  L14_2 = Config
                  L14_2 = L14_2.LockpickDoorEvent
                  L15_2 = L2_2
                  L16_2 = utils
                  L17_2 = L16_2
                  L16_2 = L16_2.removeTrailSpaces
                  L18_2 = GetVehicleNumberPlateText
                  L19_2 = L2_2
                  L18_2, L19_2 = L18_2(L19_2)
                  L16_2 = L16_2(L17_2, L18_2, L19_2)
                  L17_2 = GetEntityCoords
                  L18_2 = L2_2
                  L17_2, L18_2, L19_2 = L17_2(L18_2)
                  L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
                else
                  L14_2 = utils
                  L15_2 = L14_2
                  L14_2 = L14_2.notify
                  L16_2 = locale
                  L17_2 = "lock_busy"
                  L16_2 = L16_2(L17_2)
                  L17_2 = "error"
                  L18_2 = 5000
                  L14_2(L15_2, L16_2, L17_2, L18_2)
                end
              end
              ::lbl_597::
              IsLockpicking = false
            else
              IsLockpicking = false
              L13_2 = false
              L0_1 = L13_2
              L13_2 = StopAnimTask
              L14_2 = PlayerPedId
              L14_2 = L14_2()
              L15_2 = "veh@break_in@0h@p_m_one@"
              L16_2 = "low_force_entry_ds"
              L17_2 = 1.0
              L13_2(L14_2, L15_2, L16_2, L17_2)
              L13_2 = Wait
              L14_2 = 0
              L13_2(L14_2)
            end
          else
            L10_2 = Config
            L10_2 = L10_2.Lockpick
            L10_2 = L10_2.Game
            L10_2 = L10_2.VehicleDoors
            L10_2 = L10_2.StartGame
            if L10_2 then
              L10_2 = LockpickDoorAnim
              L11_2 = "Game"
              L10_2(L11_2)
              L10_2 = SetVehicleAlarm
              L11_2 = L2_2
              L12_2 = true
              L10_2(L11_2, L12_2)
              L10_2 = SetVehicleAlarmTimeLeft
              L11_2 = L2_2
              L12_2 = 15000
              L10_2(L11_2, L12_2)
              L10_2 = Config
              L10_2 = L10_2.Lockpick
              L10_2 = L10_2.Game
              L10_2 = L10_2.VehicleDoors
              L10_2 = L10_2.StopGame
              if L10_2 then
                L10_2 = CreateThread
                function L11_2()
                  local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
                  L0_3 = GetEntityCoords
                  L1_3 = L2_2
                  L0_3 = L0_3(L1_3)
                  L1_3 = GetEntityCoords
                  L2_3 = PlayerPedId
                  L2_3, L3_3, L4_3, L5_3, L6_3 = L2_3()
                  L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
                  while true do
                    L2_3 = LocalPlayer
                    L2_3 = L2_3.state
                    L2_3 = L2_3.mk_isLoggedIn
                    if not L2_3 then
                      break
                    end
                    L2_3 = IsEntityDead
                    L3_3 = PlayerPedId
                    L3_3, L4_3, L5_3, L6_3 = L3_3()
                    L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3)
                    if L2_3 then
                      break
                    end
                    L2_3 = IsLockpicking
                    if not L2_3 then
                      break
                    end
                    L2_3 = GetEntityCoords
                    L3_3 = L2_2
                    L2_3 = L2_3(L3_3)
                    L0_3 = L2_3
                    L2_3 = GetEntityCoords
                    L3_3 = PlayerPedId
                    L3_3, L4_3, L5_3, L6_3 = L3_3()
                    L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3)
                    L1_3 = L2_3
                    L2_3 = Wait
                    L3_3 = 10
                    L2_3(L3_3)
                    L2_3 = L1_3 - L0_3
                    L2_3 = #L2_3
                    if L2_3 > 10.0 then
                      L2_3 = Config
                      L2_3 = L2_3.Lockpick
                      L2_3 = L2_3.Game
                      L2_3 = L2_3.VehicleDoors
                      L2_3 = L2_3.StopGame
                      L2_3()
                      L2_3 = false
                      L0_1 = L2_3
                      L2_3 = StopAnimTask
                      L3_3 = PlayerPedId
                      L3_3 = L3_3()
                      L4_3 = "veh@break_in@0h@p_m_one@"
                      L5_3 = "low_force_entry_ds"
                      L6_3 = 1.0
                      L2_3(L3_3, L4_3, L5_3, L6_3)
                      L2_3 = Wait
                      L3_3 = 0
                      L2_3(L3_3)
                      IsLockpicking = false
                    end
                  end
                  L2_3 = LocalPlayer
                  L2_3 = L2_3.state
                  L2_3 = L2_3.mk_isLoggedIn
                  if L2_3 then
                    L2_3 = IsEntityDead
                    L3_3 = PlayerPedId
                    L3_3, L4_3, L5_3, L6_3 = L3_3()
                    L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3)
                    if not L2_3 then
                      goto lbl_77
                    end
                  end
                  L2_3 = Config
                  L2_3 = L2_3.Lockpick
                  L2_3 = L2_3.Game
                  L2_3 = L2_3.VehicleDoors
                  L2_3 = L2_3.StopGame
                  L2_3()
                  IsLockpicking = false
                  ::lbl_77::
                  L2_3 = false
                  L0_1 = L2_3
                  L2_3 = StopAnimTask
                  L3_3 = PlayerPedId
                  L3_3 = L3_3()
                  L4_3 = "veh@break_in@0h@p_m_one@"
                  L5_3 = "low_force_entry_ds"
                  L6_3 = 1.0
                  L2_3(L3_3, L4_3, L5_3, L6_3)
                  L2_3 = Wait
                  L3_3 = 0
                  L2_3(L3_3)
                end
                L10_2(L11_2)
              end
              L10_2 = Config
              L10_2 = L10_2.Lockpick
              L10_2 = L10_2.Game
              L10_2 = L10_2.VehicleDoors
              L10_2 = L10_2.StartGame
              L11_2 = A0_2
              function L12_2(A0_3)
                local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
                if A0_3 then
                  L1_3 = false
                  L0_1 = L1_3
                  L1_3 = StopAnimTask
                  L2_3 = PlayerPedId
                  L2_3 = L2_3()
                  L3_3 = "veh@break_in@0h@p_m_one@"
                  L4_3 = "low_force_entry_ds"
                  L5_3 = 1.0
                  L1_3(L2_3, L3_3, L4_3, L5_3)
                  L1_3 = Wait
                  L2_3 = 0
                  L1_3(L2_3)
                  L1_3 = Entity
                  L2_3 = L2_2
                  L1_3 = L1_3(L2_3)
                  L1_3 = L1_3.state
                  L1_3 = L1_3.LockBusy
                  if not L1_3 then
                    L1_3 = TriggerServerEvent
                    L2_3 = "MK_VehicleKeys:Server:UnlockDoor"
                    L3_3 = NetworkGetNetworkIdFromEntity
                    L4_3 = L2_2
                    L3_3 = L3_3(L4_3)
                    L4_3 = L2_2
                    L1_3(L2_3, L3_3, L4_3)
                    L1_3 = Config
                    L1_3 = L1_3.Lockpick
                    L1_3 = L1_3.DoorsBreakPick
                    L1_3 = L1_3.OnSuccess
                    L1_3 = L1_3.Break
                    if L1_3 then
                      L1_3 = math
                      L1_3 = L1_3.random
                      L2_3 = 1
                      L3_3 = 100
                      L1_3 = L1_3(L2_3, L3_3)
                      L2_3 = A0_2
                      if L2_3 then
                        L2_3 = math
                        L2_3 = L2_3.ceil
                        L3_3 = Config
                        L3_3 = L3_3.Lockpick
                        L3_3 = L3_3.DoorsBreakPick
                        L3_3 = L3_3.OnSuccess
                        L3_3 = L3_3.Chance
                        L3_3 = L3_3 * 0.5
                        L2_3 = L2_3(L3_3)
                        if L2_3 then
                          goto lbl_61
                        end
                      end
                      L2_3 = Config
                      L2_3 = L2_3.Lockpick
                      L2_3 = L2_3.DoorsBreakPick
                      L2_3 = L2_3.OnSuccess
                      L2_3 = L2_3.Chance
                      ::lbl_61::
                      if L1_3 <= L2_3 then
                        L3_3 = TriggerServerEvent
                        L4_3 = "MK_VehicleKeys:Server:BrokenLockpick"
                        L5_3 = A1_2
                        L3_3(L4_3, L5_3)
                      end
                    end
                    L1_3 = Config
                    L1_3 = L1_3.LockpickDoorEvent
                    L2_3 = L2_2
                    L3_3 = utils
                    L4_3 = L3_3
                    L3_3 = L3_3.removeTrailSpaces
                    L5_3 = GetVehicleNumberPlateText
                    L6_3 = L2_2
                    L5_3, L6_3 = L5_3(L6_3)
                    L3_3 = L3_3(L4_3, L5_3, L6_3)
                    L4_3 = GetEntityCoords
                    L5_3 = L2_2
                    L4_3, L5_3, L6_3 = L4_3(L5_3)
                    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
                  else
                    L1_3 = utils
                    L2_3 = L1_3
                    L1_3 = L1_3.notify
                    L3_3 = locale
                    L4_3 = "lock_busy"
                    L3_3 = L3_3(L4_3)
                    L4_3 = "error"
                    L5_3 = 5000
                    L1_3(L2_3, L3_3, L4_3, L5_3)
                  end
                  IsLockpicking = false
                else
                  L1_3 = false
                  L0_1 = L1_3
                  L1_3 = StopAnimTask
                  L2_3 = PlayerPedId
                  L2_3 = L2_3()
                  L3_3 = "veh@break_in@0h@p_m_one@"
                  L4_3 = "low_force_entry_ds"
                  L5_3 = 1.0
                  L1_3(L2_3, L3_3, L4_3, L5_3)
                  L1_3 = Wait
                  L2_3 = 0
                  L1_3(L2_3)
                  L1_3 = utils
                  L2_3 = L1_3
                  L1_3 = L1_3.notify
                  L3_3 = locale
                  L4_3 = "lockpick_door_fail"
                  L3_3 = L3_3(L4_3)
                  L4_3 = "error"
                  L5_3 = 5000
                  L1_3(L2_3, L3_3, L4_3, L5_3)
                  L1_3 = Config
                  L1_3 = L1_3.Lockpick
                  L1_3 = L1_3.DoorsBreakPick
                  L1_3 = L1_3.OnFail
                  L1_3 = L1_3.Break
                  if L1_3 then
                    L1_3 = math
                    L1_3 = L1_3.random
                    L2_3 = 1
                    L3_3 = 100
                    L1_3 = L1_3(L2_3, L3_3)
                    L2_3 = A0_2
                    if L2_3 then
                      L2_3 = math
                      L2_3 = L2_3.ceil
                      L3_3 = Config
                      L3_3 = L3_3.Lockpick
                      L3_3 = L3_3.DoorsBreakPick
                      L3_3 = L3_3.OnFail
                      L3_3 = L3_3.Chance
                      L3_3 = L3_3 * 0.5
                      L2_3 = L2_3(L3_3)
                      if L2_3 then
                        goto lbl_143
                      end
                    end
                    L2_3 = Config
                    L2_3 = L2_3.Lockpick
                    L2_3 = L2_3.DoorsBreakPick
                    L2_3 = L2_3.OnFail
                    L2_3 = L2_3.Chance
                    ::lbl_143::
                    if L1_3 <= L2_3 then
                      L3_3 = TriggerServerEvent
                      L4_3 = "MK_VehicleKeys:Server:BrokenLockpick"
                      L5_3 = A1_2
                      L3_3(L4_3, L5_3)
                    end
                  end
                  IsLockpicking = false
                end
              end
              L10_2(L11_2, L12_2)
            else
              L10_2 = utils
              L10_2 = L10_2.logger
              L11_2 = L10_2
              L10_2 = L10_2.info
              L12_2 = "VehicleKeys"
              L13_2 = "^5Game function not setup; See Config.^7"
              L14_2 = {}
              L14_2.console = true
              L10_2(L11_2, L12_2, L13_2, L14_2)
            end
          end
        else
          L10_2 = utils
          L11_2 = L10_2
          L10_2 = L10_2.notify
          L12_2 = locale
          L13_2 = "not_locked"
          L12_2 = L12_2(L13_2)
          L13_2 = "primary"
          L14_2 = 5000
          L10_2(L11_2, L12_2, L13_2, L14_2)
        end
      else
        L9_2 = utils
        L10_2 = L9_2
        L9_2 = L9_2.notify
        L11_2 = locale
        L12_2 = "far_from_door"
        L11_2 = L11_2(L12_2)
        L12_2 = "error"
        L13_2 = 5000
        L9_2(L10_2, L11_2, L12_2, L13_2)
      end
    end
  end
  ::lbl_677::
end
LockpickDoor = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = false
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "string" == L2_2 then
    L1_2 = true
  else
    A0_2 = A0_2 / 1000
  end
  L2_2 = RequestAnimDict
  L3_2 = "veh@break_in@0h@p_m_one@"
  L2_2(L3_2)
  while true do
    L2_2 = HasAnimDictLoaded
    L3_2 = "veh@break_in@0h@p_m_one@"
    L2_2 = L2_2(L3_2)
    if L2_2 then
      break
    end
    L2_2 = RequestAnimDict
    L3_2 = "veh@break_in@0h@p_m_one@"
    L2_2(L3_2)
    L2_2 = Wait
    L3_2 = 100
    L2_2(L3_2)
  end
  L2_2 = TaskPlayAnim
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = "veh@break_in@0h@p_m_one@"
  L5_2 = "low_force_entry_ds"
  L6_2 = 3.0
  L7_2 = 3.0
  L8_2 = -1
  L9_2 = 16
  L10_2 = 0
  L11_2 = false
  L12_2 = false
  L13_2 = false
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L2_2 = true
  L0_1 = L2_2
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    while true do
      L0_3 = L0_1
      if not L0_3 then
        break
      end
      L0_3 = TaskPlayAnim
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = "veh@break_in@0h@p_m_one@"
      L3_3 = "low_force_entry_ds"
      L4_3 = 3.0
      L5_3 = 3.0
      L6_3 = -1
      L7_3 = 16
      L8_3 = 0
      L9_3 = 0
      L10_3 = 0
      L11_3 = 0
      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
      L0_3 = Wait
      L1_3 = 1000
      L0_3(L1_3)
      L0_3 = L1_2
      if not L0_3 then
        L0_3 = A0_2
        L0_3 = L0_3 - 1
        A0_2 = L0_3
        L0_3 = A0_2
        if L0_3 <= 0 then
          L0_3 = false
          L0_1 = L0_3
          L0_3 = StopAnimTask
          L1_3 = PlayerPedId
          L1_3 = L1_3()
          L2_3 = "veh@break_in@0h@p_m_one@"
          L3_3 = "low_force_entry_ds"
          L4_3 = 1.0
          L0_3(L1_3, L2_3, L3_3, L4_3)
          L0_3 = Wait
          L1_3 = 0
          L0_3(L1_3)
        end
      end
    end
  end
  L2_2(L3_2)
end
LockpickDoorAnim = L3_1
function L3_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = RequestAnimDict
  L1_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  L0_2(L1_2)
  while true do
    L0_2 = HasAnimDictLoaded
    L1_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
    L0_2 = L0_2(L1_2)
    if L0_2 then
      break
    end
    L0_2 = RequestAnimDict
    L1_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
    L0_2(L1_2)
    L0_2 = Wait
    L1_2 = 10
    L0_2(L1_2)
  end
  L0_2 = TaskPlayAnim
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  L3_2 = "machinic_loop_mechandplayer"
  L4_2 = 3.0
  L5_2 = 3.0
  L6_2 = -1
  L7_2 = 16
  L8_2 = 0
  L9_2 = false
  L10_2 = false
  L11_2 = false
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L0_2 = RemoveAnimDict
  L1_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
  L0_2(L1_2)
end
LockpickIgnitionAnim = L3_1
function L3_1()
  local L0_2, L1_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = 100
    L1_3 = PlayerPedId
    L1_3 = L1_3()
    L2_3 = GetVehiclePedIsIn
    L3_3 = L1_3
    L4_3 = false
    L2_3 = L2_3(L3_3, L4_3)
    if L2_3 and L2_3 > 0 then
      while true do
        L3_3 = LocalPlayer
        L3_3 = L3_3.state
        L3_3 = L3_3.mk_isLoggedIn
        if not L3_3 then
          break
        end
        L3_3 = GetVehiclePedIsIn
        L4_3 = L1_3
        L5_3 = false
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 ~= L2_3 then
          break
        end
        L3_3 = GetPedInVehicleSeat
        L4_3 = L2_3
        L5_3 = 0
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 == L1_3 then
          L3_3 = GetIsTaskActive
          L4_3 = L1_3
          L5_3 = 165
          L3_3 = L3_3(L4_3, L5_3)
          if L3_3 then
            L0_3 = 1
            L3_3 = SetPedIntoVehicle
            L4_3 = L1_3
            L5_3 = L2_3
            L6_3 = 0
            L3_3(L4_3, L5_3, L6_3)
            L3_3 = SetPedConfigFlag
            L4_3 = L1_3
            L5_3 = 184
            L6_3 = true
            L3_3(L4_3, L5_3, L6_3)
          end
        else
          break
        end
        L3_3 = Wait
        L4_3 = L0_3
        L3_3(L4_3)
      end
    end
  end
  L0_2(L1_2)
end
RunNoShuffleThread = L3_1
function L3_1()
  local L0_2, L1_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = 100
    L1_3 = PlayerPedId
    L1_3 = L1_3()
    L2_3 = false
    while true do
      L3_3 = LocalPlayer
      L3_3 = L3_3.state
      L3_3 = L3_3.mk_isLoggedIn
      if not L3_3 then
        break
      end
      L3_3 = cache
      L3_3 = L3_3.enteringVehicle
      L2_3 = L3_3 or L2_3
      if not L3_3 then
        L3_3 = cache
        L2_3 = L3_3.vehicle
      end
      if L2_3 and L2_3 > 0 then
        L3_3 = cache
        L3_3 = L3_3.enteringVehicle
        if L3_3 then
          L3_3 = IsVehicleSeatFree
          L4_3 = L2_3
          L5_3 = -1
          L3_3 = L3_3(L4_3, L5_3)
          if L3_3 then
            L3_3 = GetSeatPedIsTryingToEnter
            L4_3 = L1_3
            L3_3 = L3_3(L4_3)
            if -1 == L3_3 then
              goto lbl_39
            end
          end
        end
        L3_3 = cache
        L3_3 = L3_3.seat
        ::lbl_39::
        if -1 == L3_3 then
          L3_3 = GetIsVehicleEngineRunning
          L4_3 = L2_3
          L3_3 = L3_3(L4_3)
          if not L3_3 then
            L0_3 = 1
            L3_3 = DisableControlAction
            L4_3 = 0
            L5_3 = 71
            L6_3 = true
            L3_3(L4_3, L5_3, L6_3)
          else
            L0_3 = 100
          end
        else
          L0_3 = 100
        end
      else
        L0_3 = 100
        setEngine = false
      end
      L3_3 = Wait
      L4_3 = L0_3
      L3_3(L4_3)
    end
  end
  L0_2(L1_2)
end
RunDisableStartThread = L3_1
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = Config
  L3_2 = L3_2.KeysAsItem
  L3_2 = L3_2.PlayerOwned
  L3_2 = L3_2.Enabled
  if L3_2 then
    L3_2 = promise
    L3_2 = L3_2.new
    L3_2 = L3_2()
    L4_2 = 0
    while true do
      L5_2 = DoesEntityExist
      L6_2 = A0_2
      L5_2 = L5_2(L6_2)
      if not (not L5_2 and L4_2 < 50) then
        break
      end
      L5_2 = Wait
      L6_2 = 100
      L5_2(L6_2)
      L4_2 = L4_2 + 1
    end
    L5_2 = 0
    L4_2 = 0
    L6_2 = NetworkGetNetworkIdFromEntity
    L7_2 = A0_2
    L6_2 = L6_2(L7_2)
    L5_2 = L6_2
    while 0 == L5_2 and L4_2 < 50 do
      L6_2 = Wait
      L7_2 = 100
      L6_2(L7_2)
      L6_2 = NetworkGetNetworkIdFromEntity
      L7_2 = A0_2
      L6_2 = L6_2(L7_2)
      L5_2 = L6_2
      L4_2 = L4_2 + 1
    end
    L6_2 = lib
    L6_2 = L6_2.callback
    L7_2 = "MK_VehicleKeys:Server:CheckFob"
    L8_2 = false
    function L9_2(A0_3)
      local L1_3, L2_3, L3_3
      L1_3 = L3_2
      L2_3 = L1_3
      L1_3 = L1_3.resolve
      L3_3 = A0_3
      L1_3(L2_3, L3_3)
    end
    L10_2 = L5_2
    L11_2 = A1_2
    L12_2 = A2_2
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L6_2 = Citizen
    L6_2 = L6_2.Await
    L7_2 = L3_2
    L6_2(L7_2)
    L6_2 = L3_2.value
    return L6_2
  else
    L3_2 = utils
    L3_2 = L3_2.logger
    L4_2 = L3_2
    L3_2 = L3_2.error
    L5_2 = "VehicleKeys"
    L6_2 = "^1CheckFob called but KeysAsItem.PlayerOwned is disabled; Check Config^7"
    L7_2 = {}
    L7_2.console = true
    L3_2(L4_2, L5_2, L6_2, L7_2)
    L3_2 = false
    return L3_2
  end
end
CheckFob = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = Config
  L1_2 = L1_2.KeysAsItem
  L1_2 = L1_2.Peds
  L2_2 = A0_2.Index
  L1_2 = L1_2[L2_2]
  L1_2 = L1_2.Ped
  if L1_2 then
    L1_2 = DoesEntityExist
    L2_2 = Config
    L2_2 = L2_2.KeysAsItem
    L2_2 = L2_2.Peds
    L3_2 = A0_2.Index
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.Ped
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = IsEntityDead
      L2_2 = Config
      L2_2 = L2_2.KeysAsItem
      L2_2 = L2_2.Peds
      L3_2 = A0_2.Index
      L2_2 = L2_2[L3_2]
      L2_2 = L2_2.Ped
      L1_2 = L1_2(L2_2)
      if not L1_2 then
        L1_2 = GetEntityHealth
        L2_2 = Config
        L2_2 = L2_2.KeysAsItem
        L2_2 = L2_2.Peds
        L3_2 = A0_2.Index
        L2_2 = L2_2[L3_2]
        L2_2 = L2_2.Ped
        L1_2 = L1_2(L2_2)
        if not (L1_2 <= 0) then
          goto lbl_221
        end
      end
    end
    L1_2 = true
    L1_1 = L1_2
    L1_2 = Wait
    L2_2 = 2000
    L1_2(L2_2)
    L1_2 = DeletePed
    L2_2 = Config
    L2_2 = L2_2.KeysAsItem
    L2_2 = L2_2.Peds
    L3_2 = A0_2.Index
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.Ped
    L1_2(L2_2)
    L1_2 = Wait
    L2_2 = 1000
    L1_2(L2_2)
    L1_2 = target
    L2_2 = L1_2
    L1_2 = L1_2.removeEntity
    L3_2 = Config
    L3_2 = L3_2.KeysAsItem
    L3_2 = L3_2.Peds
    L4_2 = A0_2.Index
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.Ped
    L1_2(L2_2, L3_2)
    L1_2 = Config
    L1_2 = L1_2.KeysAsItem
    L1_2 = L1_2.Peds
    L2_2 = A0_2.Index
    L1_2 = L1_2[L2_2]
    L1_2.Ped = nil
    L1_2 = Config
    L1_2 = L1_2.KeysAsItem
    L1_2 = L1_2.Peds
    L2_2 = A0_2.Index
    L1_2 = L1_2[L2_2]
    L1_2 = L1_2.Hash
    L2_2 = RequestModel
    L3_2 = L1_2
    L2_2(L3_2)
    while true do
      L2_2 = HasModelLoaded
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      if L2_2 then
        break
      end
      L2_2 = Wait
      L3_2 = 10
      L2_2(L3_2)
    end
    L2_2 = Config
    L2_2 = L2_2.KeysAsItem
    L2_2 = L2_2.Peds
    L3_2 = A0_2.Index
    L2_2 = L2_2[L3_2]
    L3_2 = CreatePed
    L4_2 = 5
    L5_2 = L1_2
    L6_2 = Config
    L6_2 = L6_2.KeysAsItem
    L6_2 = L6_2.Peds
    L7_2 = A0_2.Index
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.PedPosition
    L6_2 = L6_2.x
    L7_2 = Config
    L7_2 = L7_2.KeysAsItem
    L7_2 = L7_2.Peds
    L8_2 = A0_2.Index
    L7_2 = L7_2[L8_2]
    L7_2 = L7_2.PedPosition
    L7_2 = L7_2.y
    L8_2 = Config
    L8_2 = L8_2.KeysAsItem
    L8_2 = L8_2.Peds
    L9_2 = A0_2.Index
    L8_2 = L8_2[L9_2]
    L8_2 = L8_2.PedPosition
    L8_2 = L8_2.z
    L9_2 = Config
    L9_2 = L9_2.KeysAsItem
    L9_2 = L9_2.Peds
    L10_2 = A0_2.Index
    L9_2 = L9_2[L10_2]
    L9_2 = L9_2.PedPosition
    L9_2 = L9_2.h
    L10_2 = false
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    L2_2.Ped = L3_2
    while true do
      L2_2 = DoesEntityExist
      L3_2 = Config
      L3_2 = L3_2.KeysAsItem
      L3_2 = L3_2.Peds
      L4_2 = A0_2.Index
      L3_2 = L3_2[L4_2]
      L3_2 = L3_2.Ped
      L2_2 = L2_2(L3_2)
      if L2_2 then
        break
      end
      L2_2 = Wait
      L3_2 = 100
      L2_2(L3_2)
    end
    L2_2 = SetEntityAsMissionEntity
    L3_2 = Config
    L3_2 = L3_2.KeysAsItem
    L3_2 = L3_2.Peds
    L4_2 = A0_2.Index
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.Ped
    L4_2 = true
    L5_2 = true
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = SetBlockingOfNonTemporaryEvents
    L3_2 = Config
    L3_2 = L3_2.KeysAsItem
    L3_2 = L3_2.Peds
    L4_2 = A0_2.Index
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.Ped
    L4_2 = true
    L2_2(L3_2, L4_2)
    L2_2 = SetModelAsNoLongerNeeded
    L3_2 = L1_2
    L2_2(L3_2)
    L2_2 = Entity
    L3_2 = Config
    L3_2 = L3_2.KeysAsItem
    L3_2 = L3_2.Peds
    L4_2 = A0_2.Index
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.Ped
    L2_2 = L2_2(L3_2)
    L2_2 = L2_2.state
    L3_2 = L2_2
    L2_2 = L2_2.set
    L4_2 = "MK_VehicleKeysPed"
    L5_2 = true
    L6_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = target
    L3_2 = L2_2
    L2_2 = L2_2.addEntity
    L4_2 = Config
    L4_2 = L4_2.KeysAsItem
    L4_2 = L4_2.Peds
    L5_2 = A0_2.Index
    L4_2 = L4_2[L5_2]
    L4_2 = L4_2.Ped
    L5_2 = {}
    L6_2 = {}
    L6_2.type = "client"
    L6_2.event = "MK_VehicleKeys:Client:ManageKeyFobs"
    L6_2.icon = "fas fa-key"
    L7_2 = locale
    L8_2 = "keyfob_manage"
    L7_2 = L7_2(L8_2)
    L6_2.label = L7_2
    L5_2[1] = L6_2
    L6_2 = 2.0
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = Config
    L2_2 = L2_2.KeysAsItem
    L2_2 = L2_2.Peds
    L3_2 = A0_2.Index
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.Freeze
    if L2_2 then
      L2_2 = Wait
      L3_2 = 2000
      L2_2(L3_2)
      L2_2 = FreezeEntityPosition
      L3_2 = Config
      L3_2 = L3_2.KeysAsItem
      L3_2 = L3_2.Peds
      L4_2 = A0_2.Index
      L3_2 = L3_2[L4_2]
      L3_2 = L3_2.Ped
      L4_2 = true
      L2_2(L3_2, L4_2)
    end
    L2_2 = false
    L1_1 = L2_2
  end
  ::lbl_221::
end
InsideZone = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = Config
  L1_2 = L1_2.KeysAsItem
  L1_2 = L1_2.Peds
  L2_2 = A0_2.Index
  L1_2 = L1_2[L2_2]
  L1_2 = L1_2.Ped
  if not L1_2 then
    L1_2 = true
    L1_1 = L1_2
    L1_2 = Config
    L1_2 = L1_2.KeysAsItem
    L1_2 = L1_2.Peds
    L2_2 = A0_2.Index
    L1_2 = L1_2[L2_2]
    L1_2 = L1_2.Hash
    L2_2 = RequestModel
    L3_2 = L1_2
    L2_2(L3_2)
    while true do
      L2_2 = HasModelLoaded
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      if L2_2 then
        break
      end
      L2_2 = Wait
      L3_2 = 10
      L2_2(L3_2)
    end
    L2_2 = Config
    L2_2 = L2_2.KeysAsItem
    L2_2 = L2_2.Peds
    L3_2 = A0_2.Index
    L2_2 = L2_2[L3_2]
    L3_2 = CreatePed
    L4_2 = 5
    L5_2 = L1_2
    L6_2 = Config
    L6_2 = L6_2.KeysAsItem
    L6_2 = L6_2.Peds
    L7_2 = A0_2.Index
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.PedPosition
    L6_2 = L6_2.x
    L7_2 = Config
    L7_2 = L7_2.KeysAsItem
    L7_2 = L7_2.Peds
    L8_2 = A0_2.Index
    L7_2 = L7_2[L8_2]
    L7_2 = L7_2.PedPosition
    L7_2 = L7_2.y
    L8_2 = Config
    L8_2 = L8_2.KeysAsItem
    L8_2 = L8_2.Peds
    L9_2 = A0_2.Index
    L8_2 = L8_2[L9_2]
    L8_2 = L8_2.PedPosition
    L8_2 = L8_2.z
    L9_2 = Config
    L9_2 = L9_2.KeysAsItem
    L9_2 = L9_2.Peds
    L10_2 = A0_2.Index
    L9_2 = L9_2[L10_2]
    L9_2 = L9_2.PedPosition
    L9_2 = L9_2.h
    L10_2 = false
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    L2_2.Ped = L3_2
    while true do
      L2_2 = DoesEntityExist
      L3_2 = Config
      L3_2 = L3_2.KeysAsItem
      L3_2 = L3_2.Peds
      L4_2 = A0_2.Index
      L3_2 = L3_2[L4_2]
      L3_2 = L3_2.Ped
      L2_2 = L2_2(L3_2)
      if L2_2 then
        break
      end
      L2_2 = Wait
      L3_2 = 100
      L2_2(L3_2)
    end
    L2_2 = SetEntityAsMissionEntity
    L3_2 = Config
    L3_2 = L3_2.KeysAsItem
    L3_2 = L3_2.Peds
    L4_2 = A0_2.Index
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.Ped
    L4_2 = true
    L5_2 = true
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = SetBlockingOfNonTemporaryEvents
    L3_2 = Config
    L3_2 = L3_2.KeysAsItem
    L3_2 = L3_2.Peds
    L4_2 = A0_2.Index
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.Ped
    L4_2 = true
    L2_2(L3_2, L4_2)
    L2_2 = SetModelAsNoLongerNeeded
    L3_2 = L1_2
    L2_2(L3_2)
    L2_2 = Entity
    L3_2 = Config
    L3_2 = L3_2.KeysAsItem
    L3_2 = L3_2.Peds
    L4_2 = A0_2.Index
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.Ped
    L2_2 = L2_2(L3_2)
    L2_2 = L2_2.state
    L3_2 = L2_2
    L2_2 = L2_2.set
    L4_2 = "MK_VehicleKeysPed"
    L5_2 = true
    L6_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = target
    L3_2 = L2_2
    L2_2 = L2_2.addEntity
    L4_2 = Config
    L4_2 = L4_2.KeysAsItem
    L4_2 = L4_2.Peds
    L5_2 = A0_2.Index
    L4_2 = L4_2[L5_2]
    L4_2 = L4_2.Ped
    L5_2 = {}
    L6_2 = {}
    L6_2.type = "client"
    L6_2.event = "MK_VehicleKeys:Client:ManageKeyFobs"
    L6_2.icon = "fas fa-key"
    L7_2 = locale
    L8_2 = "keyfob_manage"
    L7_2 = L7_2(L8_2)
    L6_2.label = L7_2
    L5_2[1] = L6_2
    L6_2 = 2.0
    L2_2(L3_2, L4_2, L5_2, L6_2)
    L2_2 = Config
    L2_2 = L2_2.KeysAsItem
    L2_2 = L2_2.Peds
    L3_2 = A0_2.Index
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.Freeze
    if L2_2 then
      L2_2 = Wait
      L3_2 = 2000
      L2_2(L3_2)
      L2_2 = FreezeEntityPosition
      L3_2 = Config
      L3_2 = L3_2.KeysAsItem
      L3_2 = L3_2.Peds
      L4_2 = A0_2.Index
      L3_2 = L3_2[L4_2]
      L3_2 = L3_2.Ped
      L4_2 = true
      L2_2(L3_2, L4_2)
    end
    L2_2 = false
    L1_1 = L2_2
  end
end
EnterZone = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  while true do
    L1_2 = L1_1
    if not L1_2 then
      break
    end
    L1_2 = Wait
    L2_2 = 100
    L1_2(L2_2)
  end
  L1_2 = DeletePed
  L2_2 = Config
  L2_2 = L2_2.KeysAsItem
  L2_2 = L2_2.Peds
  L3_2 = A0_2.Index
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2.Ped
  L1_2(L2_2)
  L1_2 = target
  L2_2 = L1_2
  L1_2 = L1_2.removeEntity
  L3_2 = Config
  L3_2 = L3_2.KeysAsItem
  L3_2 = L3_2.Peds
  L4_2 = A0_2.Index
  L3_2 = L3_2[L4_2]
  L3_2 = L3_2.Ped
  L1_2(L2_2, L3_2)
  L1_2 = Config
  L1_2 = L1_2.KeysAsItem
  L1_2 = L1_2.Peds
  L2_2 = A0_2.Index
  L1_2 = L1_2[L2_2]
  L1_2.Ped = nil
end
ExitZone = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
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
VehicleInfo = L3_1
L3_1 = false
L4_1 = false
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L3_1 = A0_2
  L4_1 = A1_2
  L2_2 = RegisterNetEvent
  L3_2 = "lockpicks:UseLockpick"
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    if A0_3 then
      L1_3 = L4_1
      if not L1_3 then
        return
      end
    end
    if not A0_3 then
      L1_3 = L3_1
      if not L1_3 then
        return
      end
    end
    L1_3 = false
    L2_3 = PlayerData
    L2_3 = L2_3.items
    if L2_3 then
      L2_3 = pairs
      L3_3 = PlayerData
      L3_3 = L3_3.items
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
        L8_3 = L7_3.name
        L9_3 = L8_3
        L8_3 = L8_3.lower
        L8_3 = L8_3(L9_3)
        if A0_3 then
          L9_3 = "advancedlockpick"
          if L9_3 then
            goto lbl_32
          end
        end
        L9_3 = "lockpick"
        ::lbl_32::
        if L8_3 == L9_3 then
          L1_3 = L7_3
          break
        end
      end
      if L1_3 then
        L2_3 = TriggerEvent
        L3_3 = "MK_VehicleKeys:Client:UseLockpick"
        L4_3 = L1_3
        L5_3 = {}
        L5_3.Advanced = A0_3
        L2_3(L3_3, L4_3, L5_3)
      end
    end
  end
  L2_2(L3_2, L4_2)
end
RegisterQBLockpicking = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = Config
  L1_2 = L1_2.WhitelistedVehicles
  if L1_2 then
    L1_2 = false
    L2_2 = pairs
    L3_2 = Config
    L3_2 = L3_2.WhitelistedVehicles
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = type
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      if "string" == L8_2 then
        L8_2 = GetHashKey
        L9_2 = L7_2
        L8_2 = L8_2(L9_2)
        if L8_2 == A0_2 then
          L1_2 = true
          break
        end
      elseif L7_2 == A0_2 then
        L1_2 = true
        break
      end
    end
    return L1_2
  else
    L1_2 = false
    return L1_2
  end
end
IsWhitelisted = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = Config
  L1_2 = L1_2.NpcVehicles
  L1_2 = L1_2.Carjacking
  L1_2 = L1_2.VehicleBlacklist
  if L1_2 then
    L1_2 = false
    L2_2 = pairs
    L3_2 = Config
    L3_2 = L3_2.NpcVehicles
    L3_2 = L3_2.Carjacking
    L3_2 = L3_2.VehicleBlacklist
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = type
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      if "string" == L8_2 then
        L8_2 = GetHashKey
        L9_2 = L7_2
        L8_2 = L8_2(L9_2)
        if L8_2 == A0_2 then
          L1_2 = true
          break
        end
      elseif L7_2 == A0_2 then
        L1_2 = true
        break
      end
    end
    return L1_2
  else
    L1_2 = false
    return L1_2
  end
end
IsCarjackBlacklist = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = Config
  L1_2 = L1_2.NpcVehicles
  L1_2 = L1_2.StealDriverKeys
  L1_2 = L1_2.VehicleBlacklist
  if L1_2 then
    L1_2 = false
    L2_2 = pairs
    L3_2 = Config
    L3_2 = L3_2.NpcVehicles
    L3_2 = L3_2.StealDriverKeys
    L3_2 = L3_2.VehicleBlacklist
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = type
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      if "string" == L8_2 then
        L8_2 = GetHashKey
        L9_2 = L7_2
        L8_2 = L8_2(L9_2)
        if L8_2 == A0_2 then
          L1_2 = true
          break
        end
      elseif L7_2 == A0_2 then
        L1_2 = true
        break
      end
    end
    return L1_2
  else
    L1_2 = false
    return L1_2
  end
end
IsStealDriverKeysBlacklist = L5_1
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L2_2 = Config
  L2_2 = L2_2.JobWhitelistedVehicles
  if L2_2 then
    L2_2 = framework
    L2_2 = L2_2.getJob
    L2_2, L3_2 = L2_2()
    L4_2 = false
    if L2_2 then
      L5_2 = pairs
      L6_2 = Config
      L6_2 = L6_2.JobWhitelistedVehicles
      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
      for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
        L12_2 = L9_2
        L11_2 = L9_2.lower
        L11_2 = L11_2(L12_2)
        L13_2 = L2_2
        L12_2 = L2_2.lower
        L12_2 = L12_2(L13_2)
        if L11_2 == L12_2 then
          if L10_2 then
            L11_2 = pairs
            L12_2 = L10_2
            L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
            for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
              L17_2 = type
              L18_2 = L16_2
              L17_2 = L17_2(L18_2)
              if "string" == L17_2 then
                L17_2 = GetHashKey
                L18_2 = L16_2
                L17_2 = L17_2(L18_2)
                if L17_2 == A0_2 then
                  L4_2 = true
                  break
                end
              elseif L16_2 == A0_2 then
                L4_2 = true
                break
              end
            end
          end
          break
        end
      end
      L5_2 = A1_2
      L6_2 = L4_2
      L5_2(L6_2)
    else
      L5_2 = A1_2
      L6_2 = false
      L5_2(L6_2)
    end
  else
    L2_2 = A1_2
    L3_2 = false
    L2_2(L3_2)
  end
end
IsJobWhitelisted = L5_1
function L5_1()
  local L0_2, L1_2
  L0_2 = Config
  L0_2 = L0_2.KeysAsItem
  L0_2 = L0_2.PlayerOwned
  L0_2 = L0_2.Enabled
  return L0_2
end
UsingKeyfobs = L5_1
L5_1 = exports
L6_1 = "UsingKeyfobs"
L7_1 = UsingKeyfobs
L5_1(L6_1, L7_1)
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if not A0_2 or 0 == A0_2 then
    return
  end
  L1_2 = DoesEntityExist
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L1_2 = 0
  L2_2 = 0
  L3_2 = NetworkGetEntityIsNetworked
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = SetEntityAsMissionEntity
    L4_2 = A0_2
    L5_2 = true
    L6_2 = true
    L3_2(L4_2, L5_2, L6_2)
    while true do
      L3_2 = NetworkGetEntityIsNetworked
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      if not (not L3_2 and L2_2 < 50) then
        break
      end
      L3_2 = Wait
      L4_2 = 100
      L3_2(L4_2)
      L2_2 = L2_2 + 1
    end
  end
  L3_2 = NetworkGetEntityIsNetworked
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L2_2 = 0
    L3_2 = NetworkGetNetworkIdFromEntity
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L1_2 = L3_2
    while 0 == L1_2 and L2_2 < 50 do
      L3_2 = Wait
      L4_2 = 100
      L3_2(L4_2)
      L3_2 = NetworkGetNetworkIdFromEntity
      L4_2 = A0_2
      L3_2 = L3_2(L4_2)
      L1_2 = L3_2
      L2_2 = L2_2 + 1
    end
    if L1_2 > 0 then
      L3_2 = TriggerServerEvent
      L4_2 = "MK_VehicleKeys:Server:ForceRemoveKey"
      L5_2 = L1_2
      L3_2(L4_2, L5_2)
    end
  end
end
removeKey = L5_1
L5_1 = exports
L6_1 = "RemoveKey"
L7_1 = removeKey
L5_1(L6_1, L7_1)
L5_1 = RegisterNetEvent
L6_1 = "MK_VehicleKeys:TurnOffEngine"
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if not A0_2 or 0 == A0_2 then
    return
  end
  L1_2 = 0
  L2_2 = 0
  L3_2 = NetworkGetEntityFromNetworkId
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L1_2 = L3_2
  while 0 == L1_2 and L2_2 < 50 do
    L3_2 = Wait
    L4_2 = 100
    L3_2(L4_2)
    L3_2 = NetworkGetEntityFromNetworkId
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L1_2 = L3_2
    L2_2 = L2_2 + 1
  end
  if L1_2 > 0 then
    L3_2 = SetVehicleEngineOn
    L4_2 = L1_2
    L5_2 = false
    L6_2 = true
    L7_2 = true
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
end
L5_1(L6_1, L7_1)
