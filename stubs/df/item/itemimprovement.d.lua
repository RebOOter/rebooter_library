---@class df.itemimprovement
---@field mat_type integer @ reference to material
---@field mat_index integer
---@field maker integer @ reference to historical_figure
---@field masterpiece_event integer @ reference to history_event
---@field quality df.item_quality
---@field skill_rating df.skill_rating @ at the moment of creation
---@field age_counter integer

---@return df.art_image|nil
function itemimprovement:getImage(item) end

---@param colors df.int16_t[]
---@param shapes df.int16_t[]
---@param item df.item
function itemimprovement:getColorAndShape(colors, shapes, item) end

---@return df.itemimprovement
function itemimprovement:clone() end

---@param file df.file_compressorst
function itemimprovement:write_file(file) end

---@param file df.file_compressorst
---@param loadversion df.save_version
function itemimprovement:read_file(file, loadversion) end

---@return df.improvement_type
function itemimprovement:getType() end

---@return boolean @ displayed_improvement
function itemimprovement:isDecoration() end

---@param caravan df.caravan_state
---@return integer
function itemimprovement:getDyeValue(caravan) end

---@param shape integer @ reference to descriptor_shape
function itemimprovement:setShape(shape) end
