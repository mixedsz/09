-- MK Vehicle Keys - Database Schema
-- SQL file to add keyfob support to vehicle tables

-- Only run this if you're using the physical keyfob system (Config.KeysAsItem.PlayerOwned.Enabled = true)

-- ============================================
-- FOR ESX FRAMEWORK (owned_vehicles table)
-- ============================================

ALTER TABLE `owned_vehicles`
ADD COLUMN IF NOT EXISTS `fob_id` VARCHAR(12) DEFAULT NULL COMMENT 'Current active keyfob ID',
ADD COLUMN IF NOT EXISTS `old_fobs` TEXT DEFAULT NULL COMMENT 'JSON array of deactivated keyfob IDs';

-- Add index on fob_id for faster lookups
CREATE INDEX IF NOT EXISTS `idx_fob_id` ON `owned_vehicles` (`fob_id`);

-- Example query to view vehicles with keyfobs (ESX)
-- SELECT vehicle, plate, owner, fob_id, old_fobs FROM owned_vehicles WHERE fob_id IS NOT NULL;


-- ============================================
-- FOR QBCORE FRAMEWORK (player_vehicles table)
-- ============================================

ALTER TABLE `player_vehicles`
ADD COLUMN IF NOT EXISTS `fob_id` VARCHAR(12) DEFAULT NULL COMMENT 'Current active keyfob ID',
ADD COLUMN IF NOT EXISTS `old_fobs` TEXT DEFAULT NULL COMMENT 'JSON array of deactivated keyfob IDs';

-- Add index on fob_id for faster lookups
CREATE INDEX IF NOT EXISTS `idx_fob_id` ON `player_vehicles` (`fob_id`);

-- Example query to view vehicles with keyfobs (QBCore)
-- SELECT vehicle, plate, citizenid as owner, fob_id, old_fobs FROM player_vehicles WHERE fob_id IS NOT NULL;


-- ============================================
-- NOTES
-- ============================================
-- Run only the section that matches your framework (ESX or QBCore)
-- If you get a "table doesn't exist" error, you're running the wrong section
-- The script will ignore errors for non-existent tables using IF NOT EXISTS
