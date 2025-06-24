---@diagnostic disable: missing-return
---@class df.base_class
local base_class = {}

---@param object df.base_class
---@return boolean
function base_class:is_instance(object) end

---@return df.base_class
function base_class:new() end

---@param obj df.base_class
---@return df.base_class
function base_class:assign(obj) end