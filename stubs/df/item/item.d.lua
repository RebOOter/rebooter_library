---@diagnostic disable: missing-return

---@class df.item: df.base_class
---@field pos df.coord
---@field flags item_flags
---@field flags2 item_flags2
---@field age integer
---@field id integer
---@field specific_refs specific_ref[]
---@field general_refs df.general_ref[]
---@field world_data_id integer
---@field world_data_subid integer
---@field stockpile_countdown integer
---@field stockpile_delay integer
---@field base_uniform_score integer
---@field walkable_id integer
---@field spec_heat integer
---@field ignite_point integer
---@field heatdam_point integer
---@field colddam_point integer
---@field boiling_point integer
---@field melting_point integer
---@field fixed_temp integer
---@field weight massst
item = {}

---@param id integer
---@return df.item|nil
function item.find(id) end