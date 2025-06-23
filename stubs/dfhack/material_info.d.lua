---@diagnostic disable: missing-return
---@class dfhack.material_info
---@field type integer
---@field index integer
---@field subtype integer
---@field mode string
---@field inorganic df.inorganic_raw
---@field plant df.plant_raw
---@field creature df.creature_raw
---@field material df.material
info = {}

---@return string
function info:getToken() end

---@param temperature table? -- Should be actual type
---@param named table? -- Should be actual type
---@return string
function info:toString(temperature, named) end

---@return table -- Should be actual type
function info:getCraftClass() end