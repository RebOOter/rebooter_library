---@diagnostic disable: missing-return
---@class dfhack.matinfo
local matinfo = {}

---@overload fun(obj: df.item): dfhack.material_info
---@param type integer
---@param index integer
---@return dfhack.material_info
function matinfo.decode(type, index) end

---@oaram ... any
---@return string
function matinfo.getToken(...) end