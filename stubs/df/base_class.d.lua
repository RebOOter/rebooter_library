---@diagnostic disable: missing-return
---@class df.base_class
local base_class = {}

---@generic T
---@param object T
---@return boolean
function base_class:is_instance(object) end

---@generic T
---@return T
function base_class:new() end

---@generic T
---@param obj T
---@return T
function base_class:assign(obj) end