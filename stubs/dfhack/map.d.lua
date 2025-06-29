---@diagnostic disable: missing-return
---@class dfhack.maps
maps = {}

---@param pos1 df.coord
---@param pos2 df.coord
---@return boolean
function maps.canWalkBetween(pos1, pos2) end

---@overload fun(x, y, z): table, table
---@param pos df.coord
---@return table, table
function maps.getTileFlags(pos) end

---@param pos df.coord
---@return number
function maps.getWalkableGroup(pos) end