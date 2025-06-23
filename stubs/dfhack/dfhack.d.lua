---@class dfhack
---@field maps dfhack.maps
---@field job dfhack.job
---@field units dfhack.units
---@field items dfhack.items
---@field gui dfhack.gui
---@field burrows dfhack.burrows
---@field matinfo dfhack.matinfo
dfhack = {}

---@method dfhack.printerr
---@param string string
function dfhack.printerr(string) end

_G.dfhack = dfhack