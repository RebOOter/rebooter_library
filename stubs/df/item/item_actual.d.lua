---@class df.item_actual: df.item
---@field stack_size integer @ init-value='1'
---@field history_info df.item_profilest|nil
---@field magic df.item_magicalst|nil
---@field contaminants df.spatter[]|nil
---@field temperature df.temperaturest
---@field wear integer
---@field wear_timer integer @ counts up to 806400
---@field production_zone_id integer @ init-value='-1', since='v0.34.01'
---@field temp_updated_frame integer @ init-value='-1'