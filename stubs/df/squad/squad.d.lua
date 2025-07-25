---@diagnostic disable: missing-return

---@class df.squad
---@field id integer
---@field name language_name
---@field alias string # if not empty, used instead of name
---@field positions squad_position[]
---@field orders squad_order[]
---@field schedule squad_schedulest
---@field cur_routine_idx integer
---@field rooms squad_barracks_infost[]
---@field rack_combat integer[] # ref-target=building
---@field rack_training integer[] # ref-target=building
---@field uniform_priority integer
---@field activity integer # ref-target=activity_entry
---@field ammo squad_equipmentst
---@field supplies squad_suppliesst
---@field entity_id integer # ref-target=historical_entity
---@field leader_position integer
---@field leader_assignment integer
---@field assigned_army_controller_id integer
---@field solid_texpos integer # Appears to be a transient per-squad texture id. Initialised on squad ui click
---@field blended_texpos integer # Always 1 less than the above field when initialised, and has tied initialisation
---@field symbol integer # 0 to 22 inclusive, row-wise. Only used in graphics mode
---@field foreground_r integer
---@field foreground_g integer
---@field foreground_b integer
---@field background_r integer
---@field background_g integer
---@field background_b integer
squad = {}

---@param id integer
---@return df.squad
function squad.find(id) end