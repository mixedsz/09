-- Server Functions for MK Vehicle Keys
-- Helper functions and utilities

-- Determine which vehicle table to use based on framework
local vehicleTable = nil

CreateThread(function()
    -- Check which table exists
    local result = MySQL.query.await('SHOW TABLES LIKE "owned_vehicles"')
    if result and #result > 0 then
        vehicleTable = 'owned_vehicles' -- ESX
        print('^2[MK Vehicle Keys]^7 Using ESX table: owned_vehicles')
    else
        vehicleTable = 'player_vehicles' -- QBCore
        print('^2[MK Vehicle Keys]^7 Using QBCore table: player_vehicles')
    end
end)

-- Wait for table detection
function GetVehicleTable()
    local timeout = 0
    while not vehicleTable and timeout < 50 do
        Wait(100)
        timeout = timeout + 1
    end
    return vehicleTable or 'owned_vehicles' -- Default to ESX
end

-- Generate a unique keyfob ID
function GenerateFobId()
    local fobId = ''
    local chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'

    for i = 1, 12 do
        local randomIndex = math.random(1, #chars)
        fobId = fobId .. chars:sub(randomIndex, randomIndex)
    end

    return fobId
end

-- Check if vehicle is owned by any player
function IsVehicleOwned(plate)
    local table = GetVehicleTable()
    local result = MySQL.query.await('SELECT owner FROM '..table..' WHERE plate = ?', {plate})

    if result and result[1] then
        return true, result[1].owner
    end

    return false, nil
end

-- Get all keyfobs for a player
function GetPlayerKeyfobs(identifier)
    local table = GetVehicleTable()
    local result = MySQL.query.await([[
        SELECT vehicle, plate, fob_id
        FROM ]]..table..[[
        WHERE owner = ? AND fob_id IS NOT NULL
    ]], {identifier})

    return result or {}
end

-- Create duplicate keyfob
function CreateDuplicateKeyfob(source, plate)
    local identifier = framework:getIdentifier(source)
    if not identifier then
        return false
    end

    -- Check if player owns the vehicle
    local owned, owner = IsVehicleOwned(plate)

    if not owned or owner ~= identifier then
        return false
    end

    -- Get vehicle data
    local table = GetVehicleTable()
    local result = MySQL.query.await('SELECT fob_id, vehicle FROM '..table..' WHERE plate = ?', {plate})

    if result and result[1] and result[1].fob_id then
        local fobId = result[1].fob_id
        local vehicleName = result[1].vehicle

        -- Check if player has enough money
        if not framework:removeMoney(source, 'cash', Config.KeysAsItem.KeyManagement.DuplicateKeyCost) then
            if not framework:removeMoney(source, 'bank', Config.KeysAsItem.KeyManagement.DuplicateKeyCost) then
                utils:notify(source, locale('cant_afford'), 'error', 5000)
                return false
            end
        end

        -- Give player the keyfob item
        local metadata = {
            id = fobId,
            plate = plate,
            name = vehicleName
        }

        if inventory:addItem(source, Config.KeysAsItem.PlayerOwned.ItemName, 1, metadata) then
            utils:notify(source, locale('fob_received'), 'success', 5000)
            return true
        else
            -- Refund if item couldn't be added
            framework:addMoney(source, 'cash', Config.KeysAsItem.KeyManagement.DuplicateKeyCost)
            utils:notify(source, locale('cant_carry_item'), 'error', 5000)
            return false
        end
    end

    return false
end

-- Reprogram vehicle keyfob
function ReprogramKeyfob(source, plate)
    local identifier = framework:getIdentifier(source)
    if not identifier then
        return false
    end

    -- Check if player owns the vehicle
    local owned, owner = IsVehicleOwned(plate)

    if not owned or owner ~= identifier then
        return false
    end

    -- Get current fob data
    local table = GetVehicleTable()
    local result = MySQL.query.await('SELECT fob_id FROM '..table..' WHERE plate = ?', {plate})

    if result and result[1] then
        local oldFobId = result[1].fob_id

        -- Check if player has enough money
        if not framework:removeMoney(source, 'cash', Config.KeysAsItem.KeyManagement.ReprogramCost) then
            if not framework:removeMoney(source, 'bank', Config.KeysAsItem.KeyManagement.ReprogramCost) then
                utils:notify(source, locale('cant_afford'), 'error', 5000)
                return false
            end
        end

        -- Generate new fob ID
        local newFobId = GenerateFobId()

        -- Get old fobs list
        local oldFobsResult = MySQL.query.await('SELECT old_fobs FROM '..table..' WHERE plate = ?', {plate})
        local oldFobs = {}

        if oldFobsResult and oldFobsResult[1] and oldFobsResult[1].old_fobs then
            oldFobs = json.decode(oldFobsResult[1].old_fobs) or {}
        end

        -- Add current fob to old fobs list
        if oldFobId then
            table.insert(oldFobs, oldFobId)
        end

        -- Update database
        MySQL.update.await('UPDATE '..table..' SET fob_id = ?, old_fobs = ? WHERE plate = ?', {
            newFobId,
            json.encode(oldFobs),
            plate
        })

        -- Find the vehicle entity and update its state
        local vehicles = GetAllVehicles()
        for _, vehicle in ipairs(vehicles) do
            local vehiclePlate = utils:removeTrailSpaces(GetVehicleNumberPlateText(vehicle))
            if vehiclePlate == plate then
                Entity(vehicle).state:set('MKFOB', newFobId, true)
                Entity(vehicle).state:set('MKOLDFOB', oldFobs, true)
                break
            end
        end

        -- Give player new keyfob
        local vehicleData = MySQL.query.await('SELECT vehicle FROM '..table..' WHERE plate = ?', {plate})
        local vehicleName = vehicleData and vehicleData[1] and vehicleData[1].vehicle or 'Unknown'

        local metadata = {
            id = newFobId,
            plate = plate,
            name = vehicleName
        }

        if inventory:addItem(source, Config.KeysAsItem.PlayerOwned.ItemName, 1, metadata) then
            utils:notify(source, locale('reprogram_fob_received'), 'success', 5000)
            return true
        else
            -- Refund if item couldn't be added
            framework:addMoney(source, 'cash', Config.KeysAsItem.KeyManagement.ReprogramCost)
            utils:notify(source, locale('cant_carry_item'), 'error', 5000)
            return false
        end
    end

    return false
end

-- Set vehicle as script owned (temporary, shouldn't be lockpicked/hotwired immediately)
function SetVehicleScriptOwned(vehicle, duration)
    if not vehicle or vehicle == 0 then
        return
    end

    duration = duration or 30000 -- Default 30 seconds

    Entity(vehicle).state:set('mk_scriptOwned', true, true)
    Entity(vehicle).state:set('mk_scriptOwnedSpawnTimer', true, true)

    SetTimeout(duration, function()
        Entity(vehicle).state:set('mk_scriptOwnedSpawnTimer', false, true)

        SetTimeout(5000, function()
            Entity(vehicle).state:set('mk_scriptOwned', false, true)
        end)
    end)
end

-- Export functions
exports('GenerateFobId', GenerateFobId)
exports('IsVehicleOwned', IsVehicleOwned)
exports('GetPlayerKeyfobs', GetPlayerKeyfobs)
exports('CreateDuplicateKeyfob', CreateDuplicateKeyfob)
exports('ReprogramKeyfob', ReprogramKeyfob)
exports('SetVehicleScriptOwned', SetVehicleScriptOwned)
