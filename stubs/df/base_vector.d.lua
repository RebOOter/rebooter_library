---@class df.base_vector<T>: { [integer]: T }
local vector = {}

---@param index integer | string
---@param element any
function vector:insert(index, element) end

---@param index integer
function vector:erase(index) end