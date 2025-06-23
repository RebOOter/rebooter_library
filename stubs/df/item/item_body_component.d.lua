---@class df.item_body_component_flag
---@field BUTCHERED 0
---@field OUTLINED 1
---@field ROAD 2
---@field UNBUTCHERABLE 3
df.item_body_component_flag = {
    BUTCHERED = 0,
    OUTLINED = 1,
    ROAD = 2,
    UNBUTCHERABLE = 3
}

---@class df.body_part_status
---@field quality integer
---@field missing integer
---@field severed_or_jammed integer

---@class df.body_layer_status
---@field permeable integer
---@field cleaned integer
---@field selected integer
---@field healing integer

---@class df.tissue_style_type
---@field field_0 integer
---@field field_1 integer

---@class df.item_body_component: df.item_actual
---@field race integer @ ref-target='creature_raw'
---@field hist_figure_id integer @ ref-target='historical_figure'
---@field unit_id integer @ ref-target='unit'
---@field caste integer @ ref-target='caste_raw'
---@field sex df.pronoun_type
---@field normal_race integer @ ref-target='creature_raw', unit.enemy.normal_race
---@field normal_caste integer @ ref-target='caste_raw', unit.enemy.normal_caste
---@field rot_timer integer
---@field from_custom_body integer
---@field body.wounds df.unit_wound[]
---@field body.systemic_wound_id integer[10] @ index-enum='wound_effect_type'
---@field body.wound_next_id integer
---@field body.components.body_part_status df.body_part_status[]
---@field body.components.numbered_masks integer[] @ 1 bit per instance of a numbered body part
---@field body.components.nonsolid_remaining integer[] @ 0-100%
---@field body.components.layer_status df.body_layer_status[]
---@field body.components.layer_wound_area integer[]
---@field body.components.layer_cut_fraction integer[] @ 0-10000
---@field body.components.layer_dent_fraction integer[] @ 0-10000
---@field body.components.layer_effect_fraction integer[] @ 0-1000000000
---@field body.physical_attr_value integer[6] @ index-enum='physical_attribute_type'
---@field body.physical_attr_soft_demotion integer[6] @ index-enum='physical_attribute_type'
---@field body.size_info.size_cur integer
---@field body.size_info.size_base integer
---@field body.size_info.area_cur integer @ size_cur^0.666
---@field body.size_info.area_base integer @ size_base^0.666
---@field body.size_info.length_cur integer @ (size_cur*10000)^0.333
---@field body.size_info.length_base integer @ (size_base*10000)^0.333
---@field body.body_part_relsize integer[] @ =unit.enemy.body_part_relsize
---@field body.body_modifiers integer[]
---@field body.bp_modifiers integer[]
---@field size_modifier integer @ =unit.appearance.size_modifier
---@field birth_year integer
---@field birth_time integer
---@field curse_year integer
---@field curse_time integer
---@field birth_year_bias integer @ init-value='0'
---@field birth_time_bias integer @ init-value='0'
---@field death_year integer
---@field death_time integer
---@field appearance.colors integer[]
---@field appearance.tissue_style df.tissue_style_type[]
---@field appearance.tissue_style_civ_id integer[]
---@field appearance.tissue_style_id integer[]
---@field appearance.tissue_style_type integer[]
---@field blood_count integer
---@field stored_fat integer
---@field hist_figure_id2 integer @ ref-target='historical_figure'
---@field undead_unit_id integer @ ref-target='unit'
---@field unit_id2 integer @ ref-target='unit'
---@field corpse_flags df.item_body_component_flag
---@field material_amount integer[19] @ index-enum='corpse_material_type'
---@field largest_tissue.mat_type integer @ ref-target='material'
---@field largest_tissue.mat_index integer
---@field largest_unrottable_tissue.mat_type integer @ ref-target='material'
---@field largest_unrottable_tissue.mat_index integer
