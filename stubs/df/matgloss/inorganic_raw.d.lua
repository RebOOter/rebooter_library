---@class df.inorganic_raw
---@field id string
---@field str string[] -- since v0.34.01
---@field flags df.inorganic_flags[]
---@field source_hfid integer -- reference to historical_figure
---@field source_enid integer -- reference to historical_entity, since v0.42.01
---@field metal_ore_str string[] -- only during parsing
---@field metal_ore_mat_index integer[] -- references to inorganic_raw
---@field metal_ore_probability integer[]
---@field thread_metal_str string[] -- only during parsing
---@field thread_metal_mat_index integer[] -- references to inorganic_raw
---@field thread_metal_probability integer[]
---@field economic_uses integer[] -- references to reaction
---@field environment_spec_str string[] -- only during parsing
---@field environment_spec_mat_index integer[] -- references to inorganic_raw
---@field environment_spec_inclusion_type df.inclusion_type[]
---@field environment_spec_probability integer[]
---@field environment_location df.environment_type[]
---@field environment_type df.inclusion_type[]
---@field environment_probability integer[]
---@field times_used_land integer
---@field times_used_ocean integer
---@field material df.material

df.inorganic_raw = {}

---@return boolean
function df.inorganic_raw.isOre() end
