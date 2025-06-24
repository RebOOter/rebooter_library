---@diagnostic disable: missing-return, unused-local

---@class df.stockpile_storage_infost
---@field max_barrels integer     -- Maximum number of barrels allowed
---@field max_bins integer        -- Maximum number of bins allowed
---@field max_wheelbarrows integer -- Maximum number of wheelbarrows allowed
---@field container_type integer[] -- Vector of container item types (values from df.item_type)
---@field container_item_id integer[] -- Vector of container item IDs, references to items
---@field container_x integer[]   -- Vector of container X coordinates within the stockpile
---@field container_y integer[]   -- Vector of container Y coordinates within the stockpile
