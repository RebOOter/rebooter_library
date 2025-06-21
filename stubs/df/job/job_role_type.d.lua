---@class df.job_role_type: integer
---@field Other integer # MAIN; eat, drink, pickup equipment
---@field Reagent integer # MATERIAL
---@field Hauled integer # REQUIRED
---@field LinkToTrigger integer
---@field LinkToTarget integer
---@field CleanSite integer
---@field TargetContainer integer # NOTAG
---@field QueuedContainer integer # INCIDENTAL_HAUL; queued to be put in a container
---@field PushHaulVehicle integer # HAULER_ITEM; wheelbarrow

---@class job_role_type_info
---@field name string
---@field value integer
---@field comment string?

---@type table<df.job_role_type, job_role_type_info>
job_role_type_info = {}
