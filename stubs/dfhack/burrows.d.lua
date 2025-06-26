---@diagnostic disable: missing-return
---@class dfhack.burrows
burrows = {}

---@param burrow df.burrow
---@param unit df.unit
---@return boolean
function burrows.isAssignedUnit(burrow, unit) end

---@param burrow df.burrow
---@param unit df.unit
---@param enable boolean
function burrows.setAssignedUnit(burrow, unit, enable) end

---@param burrow df.burrow
---@return df.map_block[]
function burrows.listBlocks(burrow) end