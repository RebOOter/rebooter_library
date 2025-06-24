---@diagnostic disable: missing-return
---@class dfhack.items
items = {}

---@param type_string string
---@return integer
function items.findType(type_string) end

---@param item df.item
---@return df.item[]
function items.getContainedItems(item) end

---@param item df.item
---@return string
function items.getReadableDescription(item) end