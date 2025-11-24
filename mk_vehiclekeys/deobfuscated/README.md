# MK Vehicle Keys - Deobfuscated Source Code

This directory contains the **deobfuscated** versions of the obfuscated client files found in the `client/` directory.

## Purpose

The original client files (`client/cl_*.lua`) were heavily obfuscated using Lua variable name obfuscation techniques, making them extremely difficult to read and understand. This deobfuscation provides:

1. **Readable variable names** - Instead of `L0_1`, `L1_1`, `A0_2`, etc., variables now have descriptive names
2. **Clear function names** - Functions are named according to their purpose
3. **Proper code structure** - Indentation and formatting make the code easier to follow
4. **Comments** - Added comments to explain what the code does

## Files

### Client Files (Deobfuscated)

- **`client/cl_main.lua`** - Main client initialization, framework loading, keybind registration, and command setup
- **`client/cl_charLoops.lua`** - Character loops for stealing keys from NPCs and carjacking functionality
- **`client/cl_functions.lua`** - Core functions like HasAuth, AddKey, ToggleLocks, Hotwire, Lockpick, etc.

## Original vs Deobfuscated

### Original (Obfuscated)
```lua
function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 then
    L1_2 = false
    return L1_2
  end
  if 0 == A0_2 then
    L1_2 = false
    return L1_2
  end
  -- ...more obfuscated code
end
HasAuth = L0_1
```

### Deobfuscated
```lua
function HasAuth(vehicle)
    if not vehicle or vehicle == 0 then
        return false
    end

    -- Check if vehicle is whitelisted
    if IsThisModelABicycle(GetEntityModel(vehicle)) or IsWhitelisted(GetEntityModel(vehicle)) then
        return true
    end

    -- ...readable code
end
```

## Key Features Identified

### Vehicle Keys System
- **Key Authorization** - Players must have keys to operate vehicles
- **Key Storage** - Keys can be stored as items (keyfobs) or in a statebag
- **Temporary Keys** - Support for temporary access to vehicles

### NPC Vehicle Interaction
- **Steal Driver Keys** - Take keys from NPC drivers (dead or alive based on config)
- **Carjacking** - Force NPCs out of vehicles at gunpoint
- **Police Dispatch** - Optional police notifications on vehicle theft

### Lockpicking & Hotwiring
- **Door Lockpicking** - Pick vehicle door locks to unlock them
- **Ignition Lockpicking** - Pick ignition to gain access to vehicle
- **Hotwiring** - Hotwire vehicles to start without keys
- **Minigame Support** - Custom minigames for lockpicking/hotwiring

### Keyfob System
- **Physical Keys** - Vehicles can require physical keyfob items
- **Fob Management** - Duplicate keys, reprogram fobs
- **Old Fob Tracking** - Deactivate old fobs when reprogramming

### Vehicle Management
- **Lock/Unlock** - Toggle vehicle locks with keybind
- **Engine Toggle** - Start/stop engine
- **Leave Vehicle** - Control door opening and engine state on exit
- **No Shuffle** - Prevent automatic shuffling to driver seat

### Job-Based Access
- **Whitelisted Jobs** - Certain jobs automatically get keys to specific vehicles
- **Job Vehicles** - Vehicles can be assigned to specific jobs

### License System
- **Helicopter License** - Check for helicopter flying license
- **Plane License** - Check for plane flying license

## Notes

- The original obfuscated files remain in `client/` directory
- These deobfuscated files are for **reference and understanding only**
- To use this resource, you still need the original obfuscated files as per the fxmanifest.lua
- Server files were **created from scratch** based on the client-side event triggers and callbacks

## Server Files

The server files (`server/sv_*.lua`) were **completely missing** from the original resource. They have been created based on:

1. Client-side event triggers (`TriggerServerEvent`)
2. Callback registrations (`lib.callback`)
3. Database operations inferred from the code
4. Best practices for FiveM server-side scripting

### Created Server Files

- **`server/sv_main.lua`** - Main server event handlers and callbacks
- **`server/sv_functions.lua`** - Server-side helper functions and utilities

## Database Schema (Inferred)

The system expects a `player_vehicles` table with at least these columns:
- `owner` - Player identifier
- `plate` - Vehicle license plate
- `vehicle` - Vehicle model/name
- `fob_id` - Keyfob ID (for physical key system)
- `old_fobs` - JSON array of deactivated fob IDs

## Dependencies

- **ox_lib** - UI and utility functions
- **oxmysql** - Database operations
- **mk_utils** - Custom utility framework
- Framework support (QBCore, ESX, or custom via mk_utils)

---

**Deobfuscated by:** Claude Code
**Date:** 2025-11-24
**Version:** Based on original v1.5.0
