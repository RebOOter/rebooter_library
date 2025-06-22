---@diagnostic disable: missing-return

---@enum df.specific_ref_type
df.specific_ref_type = {
    NONE = -1,
    BUILDING = 0,
    UNIT = 1, -- union_field: unit
    JOB = 2, -- union_field: job
    ACTIVITY = 3, -- union_field: activity
    ITEM_GENERAL = 4, -- union_field: item
    EFFECT = 5, -- union_field: effect
    VERMIN_EVENT = 6,
    VERMIN_ESCAPED_PET = 7, -- union_field: vermin
    ENTITY = 8, -- union_field: entity
    PLOT_INFO = 9,
    VIEWSCREEN = 10, -- union_field: screen
    UNIT_ITEM_WRESTLE = 11, -- union_field: wrestle
    NULL_REF = 12, -- union_field: object
    HIST_FIG = 13, -- union_field: histfig
    SITE = 14,
    ARTIFACT = 15,
    ITEM_IMPROVEMENT = 16,
    COIN_FRONT = 17,
    COIN_BACK = 18,
    DETAIL_EVENT = 19,
    SUBREGION = 20,
    FEATURE_LAYER = 21,
    ART_IMAGE = 22,
    CREATURE_DEF = 23,
    ENTITY_ART_IMAGE = 24, -- unused?
    ABSTRACT_BUILDING = 25,
    ENTITY_POPULATION = 26,
    BREED = 27
}
