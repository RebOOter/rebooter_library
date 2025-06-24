---@diagnostic disable: missing-return, unused-local

---@class df.item_stockpile_ref
---@field id integer @ ref-target='building'
---@field x integer
---@field y integer

---@class df.item_doorst: df.item_constructed

---@class df.item_floodgatest: df.item_constructed

---@class df.item_hatch_coverst: df.item_constructed

---@class df.item_gratest: df.item_constructed

---@class df.item_bedst: df.item_constructed

---@class df.item_traction_benchst: df.item_constructed

---@class df.item_chairst: df.item_constructed

---@class df.item_windowst: df.item_constructed

---@class df.item_cagest: df.item_constructed

---@class df.item_barrelst: df.item_constructed
---@field stockpile df.item_stockpile_ref

---@class df.item_bucketst: df.item_constructed

---@class df.item_animaltrapst: df.item_constructed

---@class df.item_tablest: df.item_constructed

---@class df.item_coffinst: df.item_constructed

---@class df.item_statuest: df.item_constructed
---@field image.id integer @ ref-target='art_image_chunk'
---@field image.subid integer @ ref-target='art_image'
---@field image.civ_id integer @ ref-target='historical_entity'
---@field image.site_id integer @ ref-target='world_site'
---@field description string
---@field art_graphics_type integer
---@field art_graphics_id integer

---@class df.item_slabst: df.item_constructed
---@field description string
---@field topic integer @ ref-target='historical_figure', or interaction id for secrets
---@field engraving_type df.slab_engraving_type

---@class df.item_quernst: df.item_constructed

---@class df.item_millstonest: df.item_constructed

---@class df.item_boxst: df.item_constructed

---@class df.item_bagst: df.item_constructed

---@class df.item_binst: df.item_constructed
---@field stockpile df.item_stockpile_ref

---@class df.item_armorstandst: df.item_constructed

---@class df.item_weaponrackst: df.item_constructed

---@class df.item_cabinetst: df.item_constructed

---@class df.item_anvilst: df.item_constructed

---@class df.item_catapultpartsst: df.item_constructed

---@class df.item_ballistapartsst: df.item_constructed

---@class df.item_trappartsst: df.item_constructed

---@class df.item_siegeammost: df.item_constructed
---@field subtype df.itemdef_siegeammost
---@field sharpness integer

---@class df.item_ballistaarrowheadst: df.item_actual
---@field mat_type integer @ ref-target='material'
---@field mat_index integer
---@field sharpness integer

---@class df.item_pipe_sectionst: df.item_constructed

---@class df.item_toolst: df.item_constructed
---@field subtype df.itemdef_toolst
---@field sharpness integer
---@field stockpile df.item_stockpile_ref
---@field vehicle_id integer @ ref-target='vehicle'
---@field shape integer @ ref-target='descriptor_shape'
---@field face_up integer
