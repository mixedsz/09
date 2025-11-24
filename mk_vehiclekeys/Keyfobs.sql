-- MK Vehicle Keys - Database Schema
-- SQL file to add keyfob support to player_vehicles table

-- Add keyfob columns to existing player_vehicles table
-- Only run this if you're using the physical keyfob system (Config.KeysAsItem.PlayerOwned.Enabled = true)

ALTER TABLE `player_vehicles`
ADD COLUMN IF NOT EXISTS `fob_id` VARCHAR(12) DEFAULT NULL COMMENT 'Current active keyfob ID',
ADD COLUMN IF NOT EXISTS `old_fobs` TEXT DEFAULT NULL COMMENT 'JSON array of deactivated keyfob IDs';

-- Add index on fob_id for faster lookups
CREATE INDEX IF NOT EXISTS `idx_fob_id` ON `player_vehicles` (`fob_id`);

-- Example query to view vehicles with keyfobs
-- SELECT vehicle, plate, owner, fob_id, old_fobs FROM player_vehicles WHERE fob_id IS NOT NULL;
