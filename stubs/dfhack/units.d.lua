---@diagnostic disable: missing-return
---@class dfhack.units
units = {}

---@param unit df.unit
---@return boolean
function units.isDead(unit) end

---@param unit df.unit
---@return string
function units.getReadableName(unit) end

---@param includeVisitors boolean
---@param includeChildren boolean
---@return df.unit[]
function units.getCitizens(includeVisitors, includeChildren) end

---@param unit df.unit
---@param pos df.coord
---@param goalType df.unit_path_goal
function units.setPathGoal(unit, pos, goalType) end