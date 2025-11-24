-- Server Main File for MK Vehicle Keys
-- Handles all server-side events and callbacks

-- Event: Add key to vehicle for player
RegisterNetEvent('MK_VehicleKeys:Server:AddKey', function(networkId, notify, isTemp, isCarjack, isDriverKeys, notifyNearby, jobName)
    local source = source
    local vehicle = NetworkGetEntityFromNetworkId(networkId)

    if not vehicle or vehicle == 0 then
        return
    end

    local identifier = framework:getIdentifier(source)
    if not identifier then
        return
    end

    notify = notify ~= nil and notify or true
    isTemp = isTemp or false
    isCarjack = isCarjack or false
    isDriverKeys = isDriverKeys or false
    notifyNearby = notifyNearby or false

    -- Get current keys from entity state
    local currentKeys = Entity(vehicle).state.Keys or {}

    -- Check if player already has keys
    local hasKey = false
    for _, existingId in ipairs(currentKeys) do
        if existingId == identifier then
            hasKey = true
            break
        end
    end

    if not hasKey then
        table.insert(currentKeys, identifier)
        Entity(vehicle).state:set('Keys', currentKeys, true)

        -- Check if it's a player owned vehicle and using keyfob system
        if Config.KeysAsItem.PlayerOwned.Enabled then
            local plate = utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle))

            -- Check if vehicle has a fob ID
            if not Entity(vehicle).state.MKFOB then
                -- This is handled by SetFobDataByPlate callback
            end
        end

        if notify and Config.NotifyOnKeyAdd then
            utils:notify(source, locale('received_key'), 'success', 5000)
        end

        if notifyNearby then
            -- Notify nearby players
            local coords = GetEntityCoords(vehicle)
            for _, playerId in ipairs(GetPlayers()) do
                if playerId ~= source then
                    local playerPed = GetPlayerPed(playerId)
                    local playerCoords = GetEntityCoords(playerPed)
                    if #(coords - playerCoords) < 10.0 then
                        utils:notify(playerId, locale('handed_keys'), 'success', 5000)
                    end
                end
            end
        end

        -- Set job vehicle if jobName provided
        if jobName then
            Entity(vehicle).state:set('mk_jobVehicle', jobName, true)
        end
    end
end)

-- Event: Toggle vehicle locks
RegisterNetEvent('MK_VehicleKeys:Server:ToggleLocks', function(networkId, veh)
    local source = source
    local vehicle = NetworkGetEntityFromNetworkId(networkId)

    if not vehicle or vehicle == 0 then
        return
    end

    -- Set lock busy state to prevent spam
    Entity(vehicle).state:set('LockBusy', true, true)

    local currentLockState = GetVehicleDoorLockStatus(vehicle)
    local newLockState = currentLockState == 2 and 1 or 2

    SetVehicleDoorsLocked(vehicle, newLockState)

    -- Play sound if enabled
    if Config.VehicleDoorlockSounds then
        local coords = GetEntityCoords(vehicle)
        for _, playerId in ipairs(GetPlayers()) do
            local playerPed = GetPlayerPed(playerId)
            local playerCoords = GetEntityCoords(playerPed)
            if #(coords - playerCoords) < 15.0 then
                if newLockState == 2 then
                    TriggerClientEvent('MK_VehicleKeys:Client:PlayLockSound', playerId, coords, 'lock')
                else
                    TriggerClientEvent('MK_VehicleKeys:Client:PlayLockSound', playerId, coords, 'unlock')
                end
            end
        end
    end

    -- Notify player
    if newLockState == 2 then
        utils:notify(source, locale('veh_locked'), 'success', 5000)
    else
        utils:notify(source, locale('veh_unlocked'), 'success', 5000)
    end

    -- Remove lock busy state
    SetTimeout(1000, function()
        Entity(vehicle).state:set('LockBusy', false, true)
    end)
end)

-- Event: Force unlock vehicle
RegisterNetEvent('MK_VehicleKeys:Server:UnlockVehicle', function(networkId, veh)
    local source = source
    local vehicle = NetworkGetEntityFromNetworkId(networkId)

    if not vehicle or vehicle == 0 then
        return
    end

    Entity(vehicle).state:set('LockBusy', true, true)

    SetVehicleDoorsLocked(vehicle, 1)

    -- Play sound if enabled
    if Config.VehicleDoorlockSounds then
        local coords = GetEntityCoords(vehicle)
        for _, playerId in ipairs(GetPlayers()) do
            local playerPed = GetPlayerPed(playerId)
            local playerCoords = GetEntityCoords(playerPed)
            if #(coords - playerCoords) < 15.0 then
                TriggerClientEvent('MK_VehicleKeys:Client:PlayLockSound', playerId, coords, 'unlock')
            end
        end
    end

    utils:notify(source, locale('veh_unlocked'), 'success', 5000)

    SetTimeout(1000, function()
        Entity(vehicle).state:set('LockBusy', false, true)
    end)
end)

-- Event: Remove item from player
RegisterNetEvent('MK_VehicleKeys:Server:RemoveItem', function(itemName, amount)
    local source = source

    if not itemName or not amount then
        return
    end

    inventory:removeItem(source, itemName, amount)
end)

-- Callback: Check if player owns vehicle
lib.callback.register('MK_VehicleKeys:Server:CheckOwnership', function(source, plate)
    if not plate then
        return false, nil
    end

    local identifier = framework:getIdentifier(source)
    if not identifier then
        return false, nil
    end

    -- Query database for vehicle ownership
    local table = GetVehicleTable()
    local result = MySQL.query.await('SELECT owner FROM '..table..' WHERE plate = ?', {plate})

    if result and result[1] then
        local owner = result[1].owner
        return owner == identifier, owner
    end

    return false, nil
end)

-- Callback: Set keyfob data by plate
lib.callback.register('MK_VehicleKeys:Server:SetFobDataByPlate', function(source, plate, networkId)
    if not plate or not networkId then
        return false
    end

    local vehicle = NetworkGetEntityFromNetworkId(networkId)
    if not vehicle or vehicle == 0 then
        return false
    end

    local identifier = framework:getIdentifier(source)
    if not identifier then
        return false
    end

    -- Query database for keyfob data
    local table = GetVehicleTable()
    local result = MySQL.query.await('SELECT * FROM '..table..' WHERE plate = ?', {plate})

    if result and result[1] then
        local vehicleData = result[1]

        if vehicleData.fob_id then
            Entity(vehicle).state:set('MKFOB', vehicleData.fob_id, true)

            -- Set old fobs if they exist
            if vehicleData.old_fobs then
                local oldFobs = json.decode(vehicleData.old_fobs) or {}
                Entity(vehicle).state:set('MKOLDFOB', oldFobs, true)
            end

            return vehicleData.fob_id
        else
            -- Generate new fob ID
            local newFobId = GenerateFobId()

            MySQL.update.await('UPDATE '..table..' SET fob_id = ? WHERE plate = ?', {
                newFobId,
                plate
            })

            Entity(vehicle).state:set('MKFOB', newFobId, true)

            return newFobId
        end
    end

    return false
end)

-- Callback: Give key to nearby player
lib.callback.register('MK_VehicleKeys:Server:GiveKeyToPlayer', function(source, targetId, networkId)
    local vehicle = NetworkGetEntityFromNetworkId(networkId)

    if not vehicle or vehicle == 0 then
        return false
    end

    if not targetId or targetId == source then
        return false
    end

    local targetIdentifier = framework:getIdentifier(targetId)
    if not targetIdentifier then
        return false
    end

    -- Get current keys
    local currentKeys = Entity(vehicle).state.Keys or {}

    -- Add target to keys
    local hasKey = false
    for _, existingId in ipairs(currentKeys) do
        if existingId == targetIdentifier then
            hasKey = true
            break
        end
    end

    if not hasKey then
        table.insert(currentKeys, targetIdentifier)
        Entity(vehicle).state:set('Keys', currentKeys, true)

        utils:notify(source, locale('gave_key'), 'success', 5000)
        utils:notify(targetId, locale('received_key'), 'success', 5000)

        return true
    else
        utils:notify(source, locale('has_key'), 'error', 5000)
        return false
    end
end)

-- Callback: Remove key from player
lib.callback.register('MK_VehicleKeys:Server:RemoveKeyFromPlayer', function(source, targetId, networkId)
    local vehicle = NetworkGetEntityFromNetworkId(networkId)

    if not vehicle or vehicle == 0 then
        return false
    end

    if not targetId or targetId == source then
        return false
    end

    local targetIdentifier = framework:getIdentifier(targetId)
    if not targetIdentifier then
        return false
    end

    -- Get current keys
    local currentKeys = Entity(vehicle).state.Keys or {}

    -- Remove target from keys
    for i, existingId in ipairs(currentKeys) do
        if existingId == targetIdentifier then
            table.remove(currentKeys, i)
            Entity(vehicle).state:set('Keys', currentKeys, true)

            utils:notify(source, locale('removed_player_keys'), 'success', 5000)
            utils:notify(targetId, locale('keys_taken'), 'error', 5000)

            return true
        end
    end

    utils:notify(source, locale('player_no_keys'), 'error', 5000)
    return false
end)

print('^2[MK Vehicle Keys]^7 Server scripts loaded successfully')
