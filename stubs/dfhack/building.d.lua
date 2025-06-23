---@diagnostic disable: missing-return
---@class dfhack.building
building = {}

---@overload fun(x: integer, y: integer, z: integer): df.building
---@param pos df.coord
---@return df.building
function building.findAtTile(pos) end