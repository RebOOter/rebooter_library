---@class dfhack.persistent
persistent = {}

---@param key string
---@param default any
---@return any
function persistent.getSiteData(key, default) end

---@param key string
---@param data table
function persistent.saveSiteData(key, data) end