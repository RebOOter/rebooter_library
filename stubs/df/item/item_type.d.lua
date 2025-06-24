---@diagnostic disable: missing-return, unused-local

---@class df.item_type
---@field [0] string @ BAR - bars, such as metal, fuel, or soap
---@field [1] string @ SMALLGEM - cut gemstones usable in jewelers workshop
---@field [2] string @ BLOCKS - blocks of any kind
---@field [3] string @ ROUGH - rough gemstones
---@field [4] string @ BOULDER - raw mined stone
---@field [5] string @ WOOD - wooden logs
---@field [6] string @ DOOR - doors
---@field [7] string @ FLOODGATE - floodgates
---@field [8] string @ BED - beds
---@field [9] string @ CHAIR - chairs and thrones
---@field [10] string @ CHAIN - restraints
---@field [11] string @ FLASK - flasks
---@field [12] string @ GOBLET - goblets
---@field [13] string @ INSTRUMENT - musical instruments
---@field [14] string @ TOY - toys
---@field [15] string @ WINDOW - glass windows
---@field [16] string @ CAGE - cages
---@field [17] string @ BARREL - barrels
---@field [18] string @ BUCKET - buckets
---@field [19] string @ ANIMALTRAP - animal traps
---@field [20] string @ TABLE - tables
---@field [21] string @ COFFIN - coffins
---@field [22] string @ STATUE - statues
---@field [23] string @ CORPSE - corpses (does not have a material)
---@field [24] string @ WEAPON - weapons
---@field [25] string @ ARMOR - armor and clothing worn on the upper body
---@field [26] string @ SHOES - armor and clothing worn on the feet
---@field [27] string @ SHIELD - shields and bucklers
---@field [28] string @ HELM - armor and clothing worn on the head
---@field [29] string @ GLOVES - armor and clothing worn on the hands
---@field [30] string @ BOX - chests (wood), coffers (stone), and boxes (glass)
---@field [31] string @ BAG - bags (cloth or leather)
---@field [32] string @ BIN - bins
---@field [33] string @ ARMORSTAND - armor stands
---@field [34] string @ WEAPONRACK - weapon racks
---@field [35] string @ CABINET - cabinets
---@field [36] string @ FIGURINE - figurines
---@field [37] string @ AMULET - amulets
---@field [38] string @ SCEPTER - scepters
---@field [39] string @ AMMO - ammunition for hand-held weapons
---@field [40] string @ CROWN - crowns
---@field [41] string @ RING - rings
---@field [42] string @ EARRING - earrings
---@field [43] string @ BRACELET - bracelets
---@field [44] string @ GEM - large gems
---@field [45] string @ ANVIL - anvils
---@field [46] string @ CORPSEPIECE - body parts (does not have a material)
---@field [47] string @ REMAINS - dead vermin bodies (material is CREATURE_ID:CASTE)
---@field [48] string @ MEAT - butchered meat
---@field [49] string @ FISH - prepared fish (material is CREATURE_ID:CASTE)
---@field [50] string @ FISH_RAW - unprepared fish (material is CREATURE_ID:CASTE)
---@field [51] string @ VERMIN - live vermin (material is CREATURE_ID:CASTE)
---@field [52] string @ PET - tame vermin (material is CREATURE_ID:CASTE)
---@field [53] string @ SEEDS - seeds from plants
---@field [54] string @ PLANT - plants
---@field [55] string @ SKIN_TANNED - tanned skins
---@field [56] string @ PLANT_GROWTH - assorted plant growths, including leaves and berries
---@field [57] string @ THREAD - thread gathered from webs or made at the farmers workshop
---@field [58] string @ CLOTH - cloth made at the loom
---@field [59] string @ TOTEM - skull totems
---@field [60] string @ PANTS - armor and clothing worn on the legs
---@field [61] string @ BACKPACK - backpacks
---@field [62] string @ QUIVER - quivers
---@field [63] string @ CATAPULTPARTS - catapult parts
---@field [64] string @ BALLISTAPARTS - ballista parts
---@field [65] string @ SIEGEAMMO - siege engine ammunition
---@field [66] string @ BALLISTAARROWHEAD - ballista arrow heads
---@field [67] string @ TRAPPARTS - mechanisms
---@field [68] string @ TRAPCOMP - trap components
---@field [69] string @ DRINK - alcoholic drinks
---@field [70] string @ POWDER_MISC - powders such as flour, gypsum plaster, dye, or sand
---@field [71] string @ CHEESE - pieces of cheese
---@field [72] string @ FOOD - prepared meals
---@field [73] string @ LIQUID_MISC - liquids such as water, lye, and extracts
---@field [74] string @ COIN - coins
---@field [75] string @ GLOB - fat, tallow, pastes/pressed objects, and small bits of molten rock/metal
---@field [76] string @ ROCK - small rocks (usually sharpened and/or thrown in adventurer mode)
---@field [77] string @ PIPE_SECTION - pipe sections
---@field [78] string @ HATCH_COVER - hatch covers
---@field [79] string @ GRATE - grates
---@field [80] string @ QUERN - querns
---@field [81] string @ MILLSTONE - millstones
---@field [82] string @ SPLINT - splints
---@field [83] string @ CRUTCH - crutches
---@field [84] string @ TRACTION_BENCH - traction benches
---@field [85] string @ ORTHOPEDIC_CAST - orthopedic casts
---@field [86] string @ TOOL - tools
---@field [87] string @ SLAB - slabs
---@field [88] string @ EGG - eggs (material is CREATURE_ID:CASTE)
---@field [89] string @ BOOK - books
---@field [90] string @ SHEET - sheets of paper
---@field [91] string @ BRANCH - tree branches
---@field [-1] string @ NONE

---@class df.item_type
item_type = {
  NONE = -1,
  BAR = 0,
  SMALLGEM = 1,
  BLOCKS = 2,
  ROUGH = 3,
  BOULDER = 4,
  WOOD = 5,
  DOOR = 6,
  FLOODGATE = 7,
  BED = 8,
  CHAIR = 9,
  CHAIN = 10,
  FLASK = 11,
  GOBLET = 12,
  INSTRUMENT = 13,
  TOY = 14,
  WINDOW = 15,
  CAGE = 16,
  BARREL = 17,
  BUCKET = 18,
  ANIMALTRAP = 19,
  TABLE = 20,
  COFFIN = 21,
  STATUE = 22,
  CORPSE = 23,
  WEAPON = 24,
  ARMOR = 25,
  SHOES = 26,
  SHIELD = 27,
  HELM = 28,
  GLOVES = 29,
  BOX = 30,
  BAG = 31,
  BIN = 32,
  ARMORSTAND = 33,
  WEAPONRACK = 34,
  CABINET = 35,
  FIGURINE = 36,
  AMULET = 37,
  SCEPTER = 38,
  AMMO = 39,
  CROWN = 40,
  RING = 41,
  EARRING = 42,
  BRACELET = 43,
  GEM = 44,
  ANVIL = 45,
  CORPSEPIECE = 46,
  REMAINS = 47,
  MEAT = 48,
  FISH = 49,
  FISH_RAW = 50,
  VERMIN = 51,
  PET = 52,
  SEEDS = 53,
  PLANT = 54,
  SKIN_TANNED = 55,
  PLANT_GROWTH = 56,
  THREAD = 57,
  CLOTH = 58,
  TOTEM = 59,
  PANTS = 60,
  BACKPACK = 61,
  QUIVER = 62,
  CATAPULTPARTS = 63,
  BALLISTAPARTS = 64,
  SIEGEAMMO = 65,
  BALLISTAARROWHEAD = 66,
  TRAPPARTS = 67,
  TRAPCOMP = 68,
  DRINK = 69,
  POWDER_MISC = 70,
  CHEESE = 71,
  FOOD = 72,
  LIQUID_MISC = 73,
  COIN = 74,
  GLOB = 75,
  ROCK = 76,
  PIPE_SECTION = 77,
  HATCH_COVER = 78,
  GRATE = 79,
  QUERN = 80,
  MILLSTONE = 81,
  SPLINT = 82,
  CRUTCH = 83,
  TRACTION_BENCH = 84,
  ORTHOPEDIC_CAST = 85,
  TOOL = 86,
  SLAB = 87,
  EGG = 88,
  BOOK = 89,
  SHEET = 90,
  BRANCH = 91
}

---@type table<integer, string>
item_type.attrs = {
  [item_type.BAR] = "item_barst",
  [item_type.SMALLGEM] = "item_smallgemst",
  [item_type.BLOCKS] = "item_blocksst",
  [item_type.ROUGH] = "item_roughst",
  [item_type.BOULDER] = "item_boulderst",
  [item_type.WOOD] = "item_woodst",
  [item_type.DOOR] = "item_doorst",
  [item_type.FLOODGATE] = "item_floodgatest",
  [item_type.BED] = "item_bedst",
  [item_type.CHAIR] = "item_chairst",
  [item_type.CHAIN] = "item_chainst",
  [item_type.FLASK] = "item_flaskst",
  [item_type.GOBLET] = "item_gobletst",
  [item_type.INSTRUMENT] = "item_instrumentst",
  [item_type.TOY] = "item_toyst",
  [item_type.WINDOW] = "item_windowst",
  [item_type.CAGE] = "item_cagest",
  [item_type.BARREL] = "item_barrelst",
  [item_type.BUCKET] = "item_bucketst",
  [item_type.ANIMALTRAP] = "item_animaltrapst",
  [item_type.TABLE] = "item_tablest",
  [item_type.COFFIN] = "item_coffinst",
  [item_type.STATUE] = "item_statuest",
  [item_type.CORPSE] = "item_corpsest",
  [item_type.WEAPON] = "item_weaponst",
  [item_type.ARMOR] = "item_armorst",
  [item_type.SHOES] = "item_shoesst",
  [item_type.SHIELD] = "item_shieldst",
  [item_type.HELM] = "item_helmst",
  [item_type.GLOVES] = "item_glovesst",
  [item_type.BOX] = "item_boxst",
  [item_type.BAG] = "item_bagst",
  [item_type.BIN] = "item_binst",
  [item_type.ARMORSTAND] = "item_armorstandst",
  [item_type.WEAPONRACK] = "item_weaponrackst",
  [item_type.CABINET] = "item_cabinetst",
  [item_type.FIGURINE] = "item_figurinest",
  [item_type.AMULET] = "item_amuletst",
  [item_type.SCEPTER] = "item_scepterst",
  [item_type.AMMO] = "item_ammost",
  [item_type.CROWN] = "item_crownst",
  [item_type.RING] = "item_ringst",
  [item_type.EARRING] = "item_earringst",
  [item_type.BRACELET] = "item_braceletst",
  [item_type.GEM] = "item_gemst",
  [item_type.ANVIL] = "item_anvilst",
  [item_type.CORPSEPIECE] = "item_corpsepiecest",
  [item_type.REMAINS] = "item_remainsst",
  [item_type.MEAT] = "item_meatst",
  [item_type.FISH] = "item_fishst",
  [item_type.FISH_RAW] = "item_fish_rawst",
  [item_type.VERMIN] = "item_verminst",
  [item_type.PET] = "item_petst",
  [item_type.SEEDS] = "item_seedsst",
  [item_type.PLANT] = "item_plantst",
  [item_type.SKIN_TANNED] = "item_skin_tannedst",
  [item_type.PLANT_GROWTH] = "item_plant_growthst",
  [item_type.THREAD] = "item_threadst",
  [item_type.CLOTH] = "item_clothst",
  [item_type.TOTEM] = "item_totemst",
  [item_type.PANTS] = "item_pantsst",
  [item_type.BACKPACK] = "item_backpackst",
  [item_type.QUIVER] = "item_quiverst",
  [item_type.CATAPULTPARTS] = "item_catapultpartsst",
  [item_type.BALLISTAPARTS] = "item_ballistapartsst",
  [item_type.SIEGEAMMO] = "item_siegeammost",
  [item_type.BALLISTAARROWHEAD] = "item_ballistaarrowheadst",
  [item_type.TRAPPARTS] = "item_trappartsst",
  [item_type.TRAPCOMP] = "item_trapcompst",
  [item_type.DRINK] = "item_drinkst",
  [item_type.POWDER_MISC] = "item_powder_miscst",
  [item_type.CHEESE] = "item_cheesest",
  [item_type.FOOD] = "item_foodst",
  [item_type.LIQUID_MISC] = "item_liquid_miscst",
  [item_type.COIN] = "item_coinst",
  [item_type.GLOB] = "item_globst",
  [item_type.ROCK] = "item_rockst",
  [item_type.PIPE_SECTION] = "item_pipe_sectionst",
  [item_type.HATCH_COVER] = "item_hatch_coverst",
  [item_type.GRATE] = "item_gratest",
  [item_type.QUERN] = "item_quernst",
  [item_type.MILLSTONE] = "item_millstonest",
  [item_type.SPLINT] = "item_splintst",
  [item_type.CRUTCH] = "item_crutchst",
  [item_type.TRACTION_BENCH] = "item_traction_benchst",
  [item_type.ORTHOPEDIC_CAST] = "item_orthopedic_castst",
  [item_type.TOOL] = "item_toolst",
  [item_type.SLAB] = "item_slabst",
  [item_type.EGG] = "item_eggst",
  [item_type.BOOK] = "item_bookst",
  [item_type.SHEET] = "item_sheetst",
  [item_type.BRANCH] = "item_branchst"
}

---@type table<integer, string>
item_type.captions = {
  [item_type.BAR] = "bars",
  [item_type.SMALLGEM] = "cut gem",
  [item_type.BLOCKS] = "blocks",
  [item_type.ROUGH] = "rough gem",
  [item_type.BOULDER] = "boulder",
  [item_type.WOOD] = "logs",
  [item_type.DOOR] = "door",
  [item_type.FLOODGATE] = "floodgate",
  [item_type.BED] = "bed",
  [item_type.CHAIR] = "chair",
  [item_type.CHAIN] = "chain",
  [item_type.FLASK] = "flask",
  [item_type.GOBLET] = "goblet",
  [item_type.INSTRUMENT] = "instrument",
  [item_type.TOY] = "toy",
  [item_type.WINDOW] = "window",
  [item_type.CAGE] = "cage",
  [item_type.BARREL] = "barrel",
  [item_type.BUCKET] = "bucket",
  [item_type.ANIMALTRAP] = "animal trap",
  [item_type.TABLE] = "table",
  [item_type.COFFIN] = "coffin",
  [item_type.STATUE] = "statue",
  [item_type.CORPSE] = "corpse",
  [item_type.WEAPON] = "weapon",
  [item_type.ARMOR] = "armor",
  [item_type.SHOES] = "footwear",
  [item_type.SHIELD] = "shield",
  [item_type.HELM] = "headwear",
  [item_type.GLOVES] = "handwear",
  [item_type.BOX] = "box",
  [item_type.BAG] = "bag",
  [item_type.BIN] = "bin",
  [item_type.ARMORSTAND] = "armor stand",
  [item_type.WEAPONRACK] = "weapon rack",
  [item_type.CABINET] = "cabinet",
  [item_type.FIGURINE] = "figurine",
  [item_type.AMULET] = "amulet",
  [item_type.SCEPTER] = "scepter",
  [item_type.AMMO] = "ammo",
  [item_type.CROWN] = "crown",
  [item_type.RING] = "ring",
  [item_type.EARRING] = "earring",
  [item_type.BRACELET] = "bracelet",
  [item_type.GEM] = "large gem",
  [item_type.ANVIL] = "anvil",
  [item_type.CORPSEPIECE] = "body part",
  [item_type.REMAINS] = "remains",
  [item_type.MEAT] = "meat",
  [item_type.FISH] = "fish",
  [item_type.FISH_RAW] = "raw fish",
  [item_type.VERMIN] = "vermin",
  [item_type.PET] = "tame vermin",
  [item_type.SEEDS] = "seeds",
  [item_type.PLANT] = "plant",
  [item_type.SKIN_TANNED] = "leather",
  [item_type.PLANT_GROWTH] = "plant growth",
  [item_type.THREAD] = "thread",
  [item_type.CLOTH] = "cloth",
  [item_type.TOTEM] = "totem",
  [item_type.PANTS] = "legwear",
  [item_type.BACKPACK] = "backpack",
  [item_type.QUIVER] = "quiver",
  [item_type.CATAPULTPARTS] = "catapult part",
  [item_type.BALLISTAPARTS] = "ballista part",
  [item_type.SIEGEAMMO] = "siege ammo",
  [item_type.BALLISTAARROWHEAD] = "ballista arrow head",
  [item_type.TRAPPARTS] = "mechanism",
  [item_type.TRAPCOMP] = "trap component",
  [item_type.DRINK] = "drink",
  [item_type.POWDER_MISC] = "powder",
  [item_type.CHEESE] = "cheese",
  [item_type.FOOD] = "prepared meal",
  [item_type.LIQUID_MISC] = "liquid",
  [item_type.COIN] = "coin",
  [item_type.GLOB] = "glob",
  [item_type.ROCK] = "small rock",
  [item_type.PIPE_SECTION] = "pipe section",
  [item_type.HATCH_COVER] = "hatch cover",
  [item_type.GRATE] = "grate",
  [item_type.QUERN] = "quern",
  [item_type.MILLSTONE] = "millstone",
  [item_type.SPLINT] = "splint",
  [item_type.CRUTCH] = "crutch",
  [item_type.TRACTION_BENCH] = "traction bench",
  [item_type.ORTHOPEDIC_CAST] = "orthopedic cast",
  [item_type.TOOL] = "tool",
  [item_type.SLAB] = "slab",
  [item_type.EGG] = "egg",
  [item_type.BOOK] = "book",
  [item_type.SHEET] = "sheet",
  [item_type.BRANCH] = "branch"
}

---@type table<integer, boolean>
item_type.is_rawable = {
  [item_type.INSTRUMENT] = true,
  [item_type.TOY] = true,
  [item_type.WEAPON] = true,
  [item_type.ARMOR] = true,
  [item_type.SHOES] = true,
  [item_type.SHIELD] = true,
  [item_type.HELM] = true,
  [item_type.GLOVES] = true,
  [item_type.AMMO] = true,
  [item_type.PANTS] = true,
  [item_type.SIEGEAMMO] = true,
  [item_type.TRAPCOMP] = true,
  [item_type.TOOL] = true
}

---@type table<integer, boolean>
item_type.is_stackable = {
  [item_type.AMMO] = true,
  [item_type.REMAINS] = true,
  [item_type.MEAT] = true,
  [item_type.FISH] = true,
  [item_type.FISH_RAW] = true,
  [item_type.PLANT] = true,
  [item_type.PLANT_GROWTH] = true,
  [item_type.DRINK] = true,
  [item_type.CHEESE] = true,
  [item_type.FOOD] = true,
  [item_type.LIQUID_MISC] = true,
  [item_type.COIN] = true,
  [item_type.EGG] = true
}

---@type table<integer, boolean>
item_type.is_caste_mat = {
  [item_type.REMAINS] = true,
  [item_type.FISH] = true,
  [item_type.FISH_RAW] = true,
  [item_type.VERMIN] = true,
  [item_type.PET] = true,
  [item_type.EGG] = true
}
