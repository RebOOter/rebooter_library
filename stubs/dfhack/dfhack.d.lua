---@diagnostic disable: missing-return
---@class dfhack
---@field maps dfhack.maps
---@field job dfhack.job
---@field units dfhack.units
---@field items dfhack.items
---@field gui dfhack.gui
---@field burrows dfhack.burrows
---@field matinfo dfhack.matinfo
---@field buildings dfhack.building
---@field onStateChange function[]
---@field world dfhack.world
---@field persistent dfhack.persistent
---@field internal dfhack.internal
---@field screen dfhack.screen
dfhack = {}

---@method dfhack.printerr
---@param string string
function dfhack.printerr(string) end

---@param time integer
---@param type string
---@param func function
---@return integer?
function dfhack.timeout(time, type, func) end

---@param id integer
---@param new_callback function | nil
---@return function?
function dfhack.timeout_active(id, new_callback) end

---@return string
function dfhack.script_help() end

---@param command string
---@param ... string
---@overload fun(command: string[])
---@overload fun(command: table)
function dfhack.run_command(command, ...) end

---@return integer
function dfhack.getTickCount() end

_G.dfhack = dfhack

---@param object table
function printall(object) end

---@param object table
function printall_recurse(object) end