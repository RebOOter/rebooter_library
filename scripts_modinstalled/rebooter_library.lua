--@ module = true

GLOBAL_KEY = 'rebooter_library'

---@class RebooterLibrary
---@field logger table
RL = {}

-------------------
-- Lua Utilities --
-------------------

---@param tbl table
---@return string[]
function RL.get_keys_as_strings(tbl)
    local result = {}
    for k, _ in pairs(tbl) do
        table.insert(result, tostring(k))
    end
    return result
end

---@param tbl table
---@param value any
---@return boolean
function RL.check_if_any(tbl, value)
    local any = false
    for _, elem in pairs(tbl) do
        if elem == value then
            any = true
        end
    end
    return any
end

---@param tbl table
---@param value any
---@return boolean
function RL.check_all_same(tbl, value)
    local all = true
    if #tbl == 0 then
        return false
    end
    for _, elem in pairs(tbl) do
        if elem ~= value then
            all = false
        end
    end
    return all
end

---@param tbl table
---@return table
function RL.make_all_keys_lower(tbl)
    local new_array = {}
    for _, item in pairs(tbl) do
        table.insert(new_array, string.lower(item))
    end
    return new_array
end

function RL.count_table(table)
    local counter = 0
    for _, _ in pairs(table) do
        counter = counter + 1
    end
    return counter
end

---@generic K, V
---@class rl.iterable_proxy<K, V>
---@field iterable_array table<integer, `K`>
---@field key_array table<`K`, `V`>
---@field current_index integer
iterable_proxy = {}
iterable_proxy.__index = iterable_proxy

---@generic K, V
---@param array table<K, V>
---@return rl.iterable_proxy<K, V> | nil
function RL.createIterableProxy(array)
    return iterable_proxy:new(array)
end

---@return rl.iterable_proxy
function RL.createEmptyIterableProxy()
    return iterable_proxy:newEmpty()
end

---@generic K, V
---@param array table<integer, K>
---@param value V
---@return rl.iterable_proxy<K, V> | nil
function RL.createSameFromIterableIterableProxy(array, value)
    return iterable_proxy:newSameFromIterable(array, value)
end

---@generic K, V
---@param array table<K, V>
---@return rl.iterable_proxy<K, V> | nil
function iterable_proxy:new(array)
    local it_array = {}
    if not array then
        return nil
    end
    for key, _ in pairs(array) do
        table.insert(it_array, key)
    end
    ---@generic K, V
    ---@type rl.iterable_proxy<K, V>
    return setmetatable({
        iterable_array = it_array,
        key_array = array,
        current_index = 1
    }, iterable_proxy)
end

---@generic K, V
---@param array table<integer, K>
---@param value V
---@return rl.iterable_proxy<K, V> | nil
function iterable_proxy:newSameFromIterable(array, value)
    local new_array = {}
    local it_array = {}
    local index = 1
    if not array or not value then
        return nil
    end
    for _, key in ipairs(array) do
        new_array[key] = value
    end
    for _, key in pairs(array) do
        table.insert(it_array, key)
    end
    if #it_array == 0 then
        index = -1
    end
    ---@generic K, V
    ---@type rl.iterable_proxy<K, V>
    return setmetatable({
        iterable_array = it_array,
        key_array = new_array,
        current_index = index
    }, iterable_proxy)
end

---@generic K, V
---@return rl.iterable_proxy<K, V>
function iterable_proxy:newEmpty()
    return setmetatable({
        iterable_array = {},
        key_array = {},
        current_index = -1
    }, iterable_proxy)
end

---@generic K, V
---@param array table<K, V>
---@return rl.iterable_proxy<K, V>
function iterable_proxy:replaceKeyArray(array)
    local new_iterable = {}
    if not array then
        return self
    end
    for key, _ in pairs(array) do
        table.insert(new_iterable, key)
    end
    self.iterable_array = new_iterable
    self.key_array = array
    self.current_index = 1
    return self
end

---@generic K, V
---@return K, V | nil, nil
function iterable_proxy:next()
    local result = self.key_array[self.iterable_array[self.current_index]]
    local key = self.iterable_array[self.current_index]
    if not result then
        return nil, nil
    end
    self.current_index = self.current_index + 1
    return key, result
end

---@generic K, V
---@param key K
---@param value V
function iterable_proxy:add(key, value)
    self.key_array[key] = value
    for _, itr_key in ipairs(self.iterable_array) do
        if itr_key == key then
            return
        end
    end
    table.insert(self.iterable_array, key)
    if self.current_index == -1 then
        self.current_index = 1
    end
end

function iterable_proxy:reset()
    self.current_index = 1
end

---@generic K
---@param key K
function iterable_proxy:removeByKey(key)
    if not self.key_array[key] then
        return
    end
    self.key_array[key] = nil

    for i, k in ipairs(self.iterable_array) do
        if k == key then
            table.remove(self.iterable_array, i)
            if i < self.current_index then
                self.current_index = self.current_index - 1
            end
            break
        end
    end

    if #self.iterable_array == 0 then
        self.current_index = -1
    end
end

---@generic K
---@return table<integer, K>
function iterable_proxy:getIterableArray()
    return self.iterable_array
end

---@generic K
---@param index integer
---@return K
function iterable_proxy:getKeyByIndex(index)
    local result = self.iterable_array[index]
    if not result then
        return nil
    end
    return result
end

---@return integer
function iterable_proxy:getIndex()
    return self.current_index
end

---@generic K, V
---@param key K
---@return V
function iterable_proxy:getValueByKey(key)
    local result = self.key_array[key]
    if not result then
        return nil
    end
    return result
end

---@return integer
function iterable_proxy:length()
    return #self.iterable_array
end

function iterable_proxy:clear()
    self.key_array = {}
    self.iterable_array = {}
    self.current_index = -1
end

---@return boolean
function iterable_proxy:isClear()
    if self.current_index == -1 and #self.iterable_array == 0 then
        return true
    else
        return false
    end
end

---@param tbl table
---@return table
-- Creatte a iterable sequence of element base on input array's keys
-- to make it possible to iterate them without any pain
function RL.make_iterable_table(tbl)
    local result = {}
    for key, _ in pairs(tbl) do
        table.insert(result, key)
    end
    return result
end
-----------------------
-- Logging Utilities --
-----------------------

---@enum rl.log_level
RL.LOG_LEVEL_ENUM = {
    NONE = 0,
    INFO = 1,
    DEBUG = 2,
}
---@class rl.logger
---@field current_log_level rl.log_level
logger = {}
logger.__index = logger

---@param key string
---@param message string
function RL.print_log_mod(key, message)
    local result = '[' .. key .. '] ' .. message
    print(result)
end


---@param key string
---@param message_level rl.log_level
---@param message string
function logger:print_log_level(key, message_level, message)
    if self.current_log_level >= message_level then
        local result = '[' .. key .. '] ' .. message
        print(result)
    end
end

---@param key string
---@param message_level rl.log_level
---@param message string 
---@param object table
function logger:printall_log_level(key, message_level, message, object)
    if self.current_log_level >= message_level then
        local result = '[' .. key .. '] ' .. message
        print(result)
        printall(object)
    end
end

---@oaram key string
---@param message_level rl.log_level
---@param message string
---@param object table
function logger:printall_recurse_log_level(key, message_level, message, object)
    if self.current_log_level >= message_level then
        local result = '[' .. key .. '] ' .. message
        print(result)
        printall_recurse(object)
    end
end

---@param log_level rl.log_level
---@return rl.logger
function RL.createLogger(log_level)
    local instance = {
        current_log_level = log_level
    }

    setmetatable(instance, logger)
    return instance
end

lib_logger = RL.createLogger(RL.LOG_LEVEL_ENUM.INFO)

---------------------
-- Item processing --
---------------------

---@param types table<string, integer>
local function converTypesToIntegers(types)
    local result = {}
    for str_index, value in pairs(types) do
        local index = dfhack.items.findType(str_index)
        result[index] = value
    end
    return result
end

---@param mats string[]
---@param item df.item
---@return boolean
local function checkItemInMats(item, mats)
    local token = string.lower(dfhack.matinfo.decode(item):getToken())
    local lowered_mats = RL.make_all_keys_lower(mats)
    for _, mat in ipairs(lowered_mats) do
        if string.find(token, mat) then
            return true
        end
    end
    return false
end

---@param item df.item_constructed
---@param other_mats table
---@param inorganic integer[]
---@return boolean
local function checkAllMaterials(item, other_mats, inorganic)
    if #other_mats == 0 or #inorganic == 0 then
        return false
    end
    -- Because organic material could not be found by id
    local mats = RL.get_keys_as_strings(other_mats)
    if checkItemInMats(item, mats) then
        return true
    end
    if item.mat_type == 0 and inorganic[item.mat_index] == 1 then
        return true
    end
    return false
end

local function checkFurniture()
    
end

---@param item df.item_armorst | df.item_ammo | df.item_pantsst | df.item_helmst | df.item_shoesst | df.item_glovesst | df.item_shieldst
---@param type integer[]
---@param other_mats table
---@param inorganic integer[]
---@return boolean
local function checkComplexItem(item, type, other_mats, inorganic)
    if #type == 0 or #other_mats == 0 or #inorganic == 0 then
        return false
    end
    local type_check = false
    local mat_check = false
    if type[item.subtype.subtype] == 1 then
        type_check = true
    end
    if checkAllMaterials(item, other_mats, inorganic) then
        mat_check = true
    end
    if type_check and mat_check then
        return true
    end
    return false
end

---@param item df.item
---@return boolean
function RL.isRefuseBodyPart(item)
    local token = dfhack.matinfo.decode(item):getToken()
    if string.find(token, 'SCALE') or string.find(token, 'FEATHER')
        or string.find(token, 'CARTILAGE') or string.find(token, 'CLAW')
        or string.find(token, 'NERVE') then
        return true
    end
    return false
end

---@param item df.item
---@return boolean
function RL.isTooth(item)
    local token = dfhack.matinfo.decode(item):getToken()
    if string.find(token, 'TOOTH') then
        return true
    end
    return false
end

---@param item df.item
---@return boolean
function RL.isSkull(item)
    local token = dfhack.matinfo.decode(item):getToken()
    if string.find(token, 'SKULL') then
        return true
    end
    return false
end

---@param item df.item
---@return boolean
function RL.isBone(item)
    local token = dfhack.matinfo.decode(item):getToken()
    if string.find(token, 'BONE') then
        return true
    end
    return false
end

---@param item df.item
---@return boolean
function RL.isShell(item)
    local token = dfhack.matinfo.decode(item):getToken()
    if string.find(token, 'SHELL') then
        return true
    end
    return false
end

---@param item df.item
---@return boolean
function RL.isHorn(item)
    local token = dfhack.matinfo.decode(item):getToken()
    if string.find(token, 'HORN') then
        return true
    end
    return false
end

---@param item df.item
---@return boolean
function RL.isHoof(item)
    local token = dfhack.matinfo.decode(item):getToken()
    if string.find(token, 'HOOF') then
        return true
    end
    return false
end

---@param item df.item
---@return boolean
function RL.isHair(item)
    local token = dfhack.matinfo.decode(item):getToken()
    if string.find(token, 'HAIR') then
        return true
    end
    return false
end

---@param item df.item
---@return boolean
function RL.isWool(item)
    local token = dfhack.matinfo.decode(item):getToken()
    if string.find(token, 'WOOL') then
        return true
    end
    return false
end

---@param item df.item
---@param stockpile df.building_stockpilest
---@return df.coord | nil
-- Check if item could be stored in the stockpile and return coordinates where to put this item
-- Pay attention that it won't check quality filters of the stockpile
function RL.isItemCouldBeStored(item, stockpile)
    --RL.print_log_mod(GLOBAL_KEY, 'Started to check item if it could be stored...')
    -- Ammo category --
    if df.item_ammost:is_instance(item) then
        lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG 'Item is ammo')
        -----@cast item df.item_ammo
        --local ammo_settings = stockpile.settings.ammo
        --if checkComplexItem(item, ammo_settings.type, ammo_settings.other_mats, ammo_settings.mats) then
        --    return true
        --else
        --    return false
        --end
    end
    -- Animal Category --
    --if df.item_cagest:is_instance(item) then
    --    RL.print_log_mod(GLOBAL_KEY, 'Item is cage')
    --    ---@cast item df.item_cagest
    --    local animals_settings = stockpile.settings.animals
    --    if #item.general_refs == 0 then
    --        if animals_settings.empty_cages then
    --            return true
    --        else
    --            return false
    --        end
    --    else
    --        if #animals_settings.enabled == 0 then
    --            return false
    --        end
    --        for _, ref in pairs(item.general_refs) do
    --            if (df.general_ref_contains_unitst:is_instance(ref)) then
    --                ---@cast ref df.general_ref_contains_unitst
    --                local unit = df.unit.find(ref.unit_id)
    --                if not unit then
    --                    dfhack.printerr('Cannot find caged unit with id ' .. ref.unit_id)
    --                    return false
    --                end
    --                if animals_settings.enabled[unit.race] == 1 then
    --                    return true
    --                else
    --                    return false
    --                end
    --            end
    --        end
    --    end
    --end
    -- is it possible that caged small animal will be the same as creature?
    --if df.item_animaltrapst:is_instance(item) then
    --    RL.print_log_mod(GLOBAL_KEY, 'Item is animal trap')
    --    ---@cast item df.item_animaltrapst
    --    local animals_settings = stockpile.settings.animals
    --    if animals_settings.empty_traps then
    --        return true
    --    else
    --        return false
    --    end
    --end
    -- Need to add:
    -- 1. Usable / Unusable
    -- Armor Category --
    --local armor_settings = stockpile.settings.armor
    --if (df.item_armorst:is_instance(item)) then
    --    RL.print_log_mod(GLOBAL_KEY, 'Item is armor')
    --    -----@cast item df.item_armorst
    --    --if checkComplexItem(item, armor_settings.body, armor_settings.other_mats, armor_settings.mats) then
    --    --    return true
    --    --else
    --    --    return false
    --    --end
    --end
    --if df.item_helmst:is_instance(item) then
    --    RL.print_log_mod(GLOBAL_KEY, 'Item is helm')
    --    -----@cast item df.item_helmst
    --    --if checkComplexItem(item, armor_settings.head, armor_settings.other_mats, armor_settings.mats) then
    --    --    return true
    --    --else
    --    --    return false
    --    --end
    --end
    --if df.item_shoesst:is_instance(item) then
    --    RL.print_log_mod(GLOBAL_KEY, 'Item is shoe')
    --    -----@cast item df.item_shoesst
    --    --if checkComplexItem(item, armor_settings.feet, armor_settings.other_mats, armor_settings.mats) then
    --    --    return true
    --    --else
    --    --    return false
    --    --end
    --end
    --if df.item_glovesst:is_instance(item) then
    --    RL.print_log_mod(GLOBAL_KEY, 'Item is glove')
    --    -----@cast item df.item_glovesst
    --    --if checkComplexItem(item, armor_settings.hands, armor_settings.other_mats, armor_settings.mats) then
    --    --    return true
    --    --else
    --    --    return false
    --    --end
    --end
    --if (df.item_pantsst:is_instance(item)) then
    --    RL.print_log_mod(GLOBAL_KEY, 'Item is pants')
    --    -----@cast item df.item_pantsst
    --    --if checkComplexItem(item, armor_settings.legs, armor_settings.other_mats, armor_settings.mats) then
    --    --    return true
    --    --else
    --    --    return false
    --    --end
    --end
    --if df.item_shieldst:is_instance(item) then
    --    RL.print_log_mod(GLOBAL_KEY, 'Item is shield')
    --    -----@cast item df.item_shieldst
    --    --if checkComplexItem(item, armor_settings.shield, armor_settings.other_mats, armor_settings.mats) then
    --    --    return true
    --    --else
    --    --    return false
    --    --end
    --end
    --
    --local bars_blocks_settings = stockpile.settings.bars_blocks
    ---- Bars/Blocks Category --
    --if df.item_barst:is_instance(item) then
    --    RL.print_log_mod(GLOBAL_KEY, 'Item is bar')
    --    -----@cast item df.item_barst
    --    --if checkAllMaterials(item, bars_blocks_settings.bars_other_mats, bars_blocks_settings.bars_mats) then
    --    --    return true
    --    --else
    --    --    return false
    --    --end
    --end
    --if df.item_blocksst:is_instance(item) then
    --    RL.print_log_mod(GLOBAL_KEY, 'Item is block')
    --    -----@cast item df.item_blocksst
    --    --if checkAllMaterials(item, bars_blocks_settings.blocks_other_mats, bars_blocks_settings.blocks_mats) then
    --    --    return true
    --    --else
    --    --    return false
    --    --end
    --end

    -- Cloth Category --

    -- Coins Category --

    -- Finished goods Category --

    -- Food Category --

    -- Furniture/siege ammo Category --
    local furniture_settings = stockpile.settings.furniture
    if item:isFurniture(false) and #dfhack.items.getContainedItems(item) == 0 then
        local item_type_name = df.item_type[item:getType()]
        --RL.print_log_mod(GLOBAL_KEY, 'Item ' .. item.id .. ' is furniture with type ' .. item_type_name)
        ---@cast item df.item_constructed
        local formatted_types = converTypesToIntegers(furniture_settings.type)
        if formatted_types[item:getType()] == 1 then
            if checkAllMaterials(item, furniture_settings.other_mats, furniture_settings.mats) then
                local coord = RL.stockpileHasFreeTile(stockpile)
                return coord
            else
                lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, item_type_name .. ' with material '
                    .. item.mat_type .. ' ' .. item.mat_index .. ' is not allowed to be collected. Skip...')
                return nil
            end
        else
            lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, item_type_name .. ' is not allowed to be collected')
            return nil
        end
    end

    -- Gems Category --

    -- Leather Category --

    -- Corpses Category --
    if df.item_corpsest:is_instance(item) then
        lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, 'Item ' .. item.id .. ' is corpse')
        ---@cast item df.item_corpsest
        local corpses = stockpile.settings.corpses.corpses
        if #corpses == 0 then
            lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, 'Stockpile will not collect corpses. Skip...')
            return nil
        end
        if corpses[item.race] == 1 then
            local coord = RL.stockpileHasFreeTile(stockpile)
            return coord and coord or nil
        else
            lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, 'Corpse with type ' .. item.race .. ' is not allowed to be collected. Skip...')
            return nil
        end
    end

    -- Refuse Category --
    -- Probably don't need to handle corpses here
    -- And item types as well
    local refuse = stockpile.settings.refuse
    if RL.isRefuseBodyPart(item) and #refuse.body_parts > 0 and df.item_corpsepiecest:is_instance(item) then
        ---@cast item df.item_corpsepiecest
        if stockpile.settings.refuse.body_parts[item.race] == 1 then
            local coord = RL.stockpileHasFreeTile(stockpile)
            return coord and coord or nil
        end
    end
    if RL.isTooth(item) and #refuse.teeth > 0 and df.item_corpsepiecest:is_instance(item) then
        if stockpile.settings.refuse.teeth[item.race] == 1 then
            local coord = RL.stockpileHasFreeTile(stockpile)
            return coord and coord or nil
        end
    end
    if RL.isSkull(item) and #refuse.skulls > 0 and df.item_corpsepiecest:is_instance(item) then
        if stockpile.settings.refuse.skulls[item.race] == 1 then
            local coord = RL.stockpileHasFreeTile(stockpile)
            return coord and coord or nil
        end
    end
    if RL.isBone(item) and #refuse.bones > 0 and df.item_corpsepiecest:is_instance(item) then
        if stockpile.settings.refuse.bones[item.race] == 1 then
            local coord = RL.stockpileHasFreeTile(stockpile)
            return coord and coord or nil
        end
    end
    if RL.isShell(item) and #refuse.shells > 0 and df.item_corpsepiecest:is_instance(item) then
        if stockpile.settings.refuse.shells[item.race] == 1 then
            local coord = RL.stockpileHasFreeTile(stockpile)
            return coord and coord or nil
        end
    end
    if (RL.isHorn(item) or RL.isHoof(item)) and #refuse.horns > 0 and df.item_corpsepiecest:is_instance(item) then
        if stockpile.settings.refuse.horns[item.race] == 1 then
            local coord = RL.stockpileHasFreeTile(stockpile)
            return coord and coord or nil
        end
    end
    if (RL.isWool(item) or RL.isHair(item)) and #refuse.hair > 0 and df.item_corpsepiecest:is_instance(item) then
        if stockpile.settings.refuse.hair[item.race] == 1 then
            local coord = RL.stockpileHasFreeTile(stockpile)
            return coord and coord or nil
        end
    end

    -- Sheet Category --

    -- Stone Category --
    if df.item_boulderst:is_instance(item) then
        --lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, 'Item is boulder')
        ---@cast item df.item_boulder
        local mats = stockpile.settings.stone.mats
        if #mats == 0 then
            return nil
        end
        if mats[item.mat_index] == 1 then
            local coord = RL.stockpileHasFreeTile(stockpile)
            return coord and coord or nil
        else
            return nil
        end
    end

    -- Weapon/traps comps Category --  

    -- Wood Category --
    if (df.item_woodst:is_instance(item)) then
        --lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, 'Item is wood')
        ---@cast item df.item_woodst
        local mats = stockpile.settings.wood.mats
        if #mats == 0 then
            return nil
        end
        if mats[item.mat_index] == 1 then
            local coord = RL.stockpileHasFreeTile(stockpile)
            return coord and coord or nil
        else
            return nil
        end
    end

    --lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, 'Unkown item or not implemented type of item. Stop processing...')
    return nil
end

---------------------
-- Job processing --
---------------------

---@param coord df.coord
---@return boolean
function RL.isCoordUsedByOtherJobs(coord)
    --lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, 'Check if coord used by other jobs...')
    local job_next = df.global.world.jobs.list.next
    while job_next do
        local job = job_next.item
        if job.pos.x == coord.x and job.pos.y == coord.y and job.pos.z == coord.z then
            --lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, 'Coord is used by other job. Skip...')
            return true
        end
        job_next = job_next.next
    end
    return false
end

---@param unit df.unit
---@return boolean
-- Check if unit is available for a job.
function RL.unitIsAvailable(unit)
    if unit.job.current_job then
        return false
    elseif #unit.individual_drills > 0 then
        return false
    elseif unit.flags1.caged or unit.flags1.chained then
        return false
    elseif unit.counters.soldier_mood ~= -1 then
        return false
    elseif unit.military.squad_id ~= -1 then
        local squad = df.squad.find(unit.military.squad_id)
        -- this lookup should never fail
        ---@diagnostic disable-next-line: need-check-nil
        return #squad.orders == 0 and squad.activity == -1
    end
    return true
end

---@param unit df.unit
---@param unit_labor df.unit_labor
---@param workshop df.building
---@param burrow df.burrow
---@return boolean
function RL.availableLaborer(unit, unit_labor, workshop, burrow)
    return unit.status.labors[unit_labor]
        and RL.unitIsAvailable(unit)
        and RL.canAccessBuilding(unit, workshop)
        and RL.isAssignedToBurrow(unit, burrow)
end

---@param workshop df.building
---@param burrow df.burrow
function RL.findAvailableLaborer(workshop, burrow)
    for _, unit in ipairs(dfhack.units.getCitizens(true, false)) do
        --TODO: not only HAUL_WOOD
        if RL.availableLaborer(unit, df.unit_labor.HAUL_WOOD, workshop, burrow) then
            return unit
        end
    end
end

---@param item df.item
---@return boolean
function RL.itemHasJob(item)
    if #item.specific_refs > 0 then
        for _, ref in ipairs(item.specific_refs) do
            if ref.type == df.specific_ref_type.JOB then
                return true
            end
        end
    end
    return false
end

---@param job_type df.job_type
---@param job_pos df.coord
---@param building df.building
---@param item df.item
---@return df.job | nil
function RL.createJobAndAssignUnit(job_type, job_pos, building, burrow, item)
    lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, 'Starting to create job...')
    local job = df.job:new()
    local wheelbarrow_item
    dfhack.job.linkIntoWorld(job, true)
    job.job_type = job_type

    job.pos.x = job_pos.x
    job.pos.y = job_pos.y
    job.pos.z = job_pos.z
    dfhack.job.addGeneralRef(job, df.general_ref_type.BUILDING_HOLDER, building.id)
    dfhack.job.attachJobItem(job, item, df.job_role_type.Hauled, 0, -1)
    ---@cast building df.building_stockpilest
    if (df.building_stockpilest:is_instance(building) and building.storage.max_wheelbarrows > 0) then
        wheelbarrow_item = RL.findWheelbarrow(building)
        if wheelbarrow_item then
            dfhack.job.attachJobItem(job, wheelbarrow_item, df.job_role_type.PushHaulVehicle, 0, -1)
        else
            dfhack.job.removeJob(job)
            return nil
        end
    end
    local unit = RL.findAvailableLaborer(building, burrow)
    if unit then
        dfhack.job.addWorker(job, unit)
        if (df.building_stockpilest:is_instance(building) and building.storage.max_wheelbarrows > 0) then
            dfhack.units.setPathGoal(unit, wheelbarrow_item.pos, df.unit_path_goal.SeekItemForStorage)
        else
            dfhack.units.setPathGoal(unit, item.pos, df.unit_path_goal.StoreItem)
            job.items[0].flags.is_fetching = true
            job.flags.fetching = true
        end
    end
    lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, 'Job is created')
    return job
end

---@param order_template df.manager_order_template
---@return integer
function RL.countAvailableItemsForOrderTemplate(order_template)
    local counter = 0
    local bars = df.global.world.items.other.BAR
    local boulders = df.global.world.items.other.BOULDER
    local woods = df.global.world.items.other.WOOD
    local corpse_pieces = df.global.world.items.other.CORPSEPIECE
    local leather = df.global.world.items.other.SKIN_TANNED

    if order_template.mat_index > -1 and order_template.mat_type > -1 then
        for _, bar in pairs(bars) do
            if bar.mat_type == order_template.mat_type
                and bar.mat_index == order_template.mat_index
                and not bar.flags.construction then
                counter = counter + 1
            end
        end
    end
    if order_template.mat_type == 0 and order_template.mat_index == -1 then
        for _, boulder in pairs(boulders) do
            if not boulder.flags.construction
                and not boulder.flags.forbid
                and dfhack.maps.getWalkableGroup(boulder.pos) > 0 then
                counter = counter + 1
            end
        end
    end
    if order_template.material_category.wood then
        for _, wood in pairs(woods) do
            if not wood.flags.construction
                and not wood.flags.in_building
                and not wood.flags.in_inventory
                and not wood.flags.in_job then
                counter = counter + 1
            end
        end
    end
    if order_template.material_category.bone then
        for _, piece in pairs(corpse_pieces) do
            if RL.isBone(piece) then
                counter = counter + 1
            end
        end
    end
    if order_template.material_category.leather then
        counter = #leather
    end
    if order_template.material_category.shell then
        for _, piece in pairs(corpse_pieces) do
            if RL.isShell(piece) then
                counter = counter + 1
            end
        end
    end

    return counter
end

-------------------------
-- Building processing --
-------------------------

---@param building df.building
---@return df.coord[]
function RL.collectAllTiles(building)
    --lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, 'Collecting tiles for building '..building.id)
    local all_tiles = {}
    for y = building.y1, building.y2 do
        for x = building.x1, building.x2 do
            -- d_b
            local found_b = dfhack.buildings.findAtTile(x, y, building.z)
            if found_b then
                if found_b.id == building.id then
                    table.insert(all_tiles, {
                        x = x, y = y, z = building.z
                    })
                end
            end
        end
    end
    --lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, 'Collected ' .. #all_tiles .. ' tiles for building ' .. building.id)
    return all_tiles
end

---@param building df.building
---@return df.coord | nil
function RL.findAnyTile(building)
    for y = building.y1, building.y2 do
        for x = building.x1, building.x2 do
            local found_b = dfhack.buildings.findAtTile(x, y, building.z)
            if found_b then
                if found_b.id == building.id then
                    return { x = x, y = y, z = building.z }
                end
            end
        end
    end
end

---@param stockpile df.building_stockpilest
---@return df.item_toolst | nil
function RL.findWheelbarrow(stockpile)
    local tool_ids = stockpile.storage.container_item_id
    for _, id in pairs(tool_ids) do
        local item = df.item.find(id)
        ---@cast item df.item_toolst
        if not item then return nil end
        if df.item_type.TOOL == item:getType() and item.subtype.subtype == 17 and not RL.itemHasJob(item) then
            return item
        end
    end
    return nil
end

---@param stockpile df.building_stockpilest
---@return df.coord | nil
function RL.stockpileHasFreeTile(stockpile)
    --lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, 'Checking stockpile ' .. stockpile.id .. ' for free tiles')
    local tiles = RL.collectAllTiles(stockpile)
    for _, tile in pairs(tiles) do
        local _, flags = dfhack.maps.getTileFlags(tile.x, tile.y, tile.z)
        if not flags.item and not RL.isCoordUsedByOtherJobs(tile) then
            return { x = tile.x, y = tile.y, z = tile.z }
        end
    end
    return nil
end


---@param stockpile df.building_stockpilest
---@return boolean
---Checks if stockpile has place for any possible material
function RL.stockpileHasAnyAvailableSpace(stockpile)
    --lib_logger:print_log_level(GLOBAL_KEY, RL.LOG_LEVEL_ENUM.DEBUG, 'Checking if stockpile has any available space')
    if #stockpile.settings.wood.mats > 0
        or #stockpile.settings.corpses.corpses > 0
        or (#stockpile.settings.furniture.type > 0
            and (#stockpile.settings.furniture.mats > 0
            or RL.check_if_any(stockpile.settings.furniture.other_mats, 1)))
        or #stockpile.settings.stone.mats > 0
        or (#stockpile.settings.refuse.body_parts > 0
            or #stockpile.settings.refuse.teeth > 0) then
        if RL.stockpileHasFreeTile(stockpile) then
            return true
        else
            return false
        end
    end
    return false
end

----------------------
-- Units processing --
----------------------

---@param unit df.unit
---@param building df.building
---@return boolean
-- Check if unit can access a building. Bulding could be a workshop or a stockpile
function RL.canAccessBuilding(unit, building)
    local workshop_position = xyz2pos(building.centerx, building.centery, building.z)
    return dfhack.maps.canWalkBetween(unit.pos, workshop_position)
end

---@param unit df.unit
---@param burrow df.burrow
---@return boolean
-- Check if unit is assigned to a burrow.
function RL.isAssignedToBurrow(unit, burrow)
    for _, burrow_id in pairs(unit.burrows) do
        if burrow_id == burrow.id then
            return true
        end
    end
    return false
end

---@param unit df.unit
---@return string|nil, string|nil
function RL.collectDeathReason(unit)
    if (dfhack.units.isDead(unit)) then
        local killer_name = nil
        local incident = df.incident.find(unit.counters.death_id)
        local death_cause_string = string.gsub(string.lower(df.death_type[incident.death_cause]), '_', ' ')
        if (incident.criminal > -1) then
            killer_name = dfhack.units.getReadableName(df.unit.find(incident.criminal))
        end
        return death_cause_string, killer_name
    else
        return nil
    end
end

----------------------
-- DFHack Utilities --
----------------------

---@param table table
---@param iterator_fn function
---@param elem_cb function
local function safe_iterate(table, iterator_fn, elem_cb)
    local function iterate()
        for k, v in iterator_fn(table) do elem_cb(k, v) end
    end
    return pcall(iterate)
end

---@param k any
---@param v any
local function print_element(k, v)
    dfhack.printerr(string.format("%-23s\t = %s", tostring(k), tostring(v)))
end

---@param table table
-- Print all elements of a table in a safe way in stderr.log file. Useful while debugging.
function RL.printall_error(table)
    safe_iterate(table, pairs, print_element)
end

---@param text string
---@param max_len integer
---@param color integer
-- Recieve a string and split it into lines of maximum length `max_len`.
-- The return structure will be look like this:
-- {
--    { text = 'line1', pen = color },
--    NEWLINE,
--    { text = 'line2', pen = color },
-- }
-- This could be easily used with DFHack interfaces
function RL.split_text_with_newlines(text, max_len, color)
    local result = {}
    local line = ''

    for word in text:gmatch('%S+') do
        if #line + #word + (line == '' and 0 or 1) <= max_len then
            line = line .. (line == '' and '' or ' ') .. word
        else
            if line ~= '' then
                table.insert(result, { text = line, pen = color })
                table.insert(result, NEWLINE)
            end
            line = word
        end
    end

    if line ~= '' then
        table.insert(result, { text = line, pen = color })
    else
        if result[#result] == NEWLINE then
            table.remove(result, #result)
        end
    end

    return result
end

---@param text_chunk table
-- Count lines of the text in chunk.
function RL.count_lines(text_chunk)
    local count = 0
    for _, chunk in ipairs(text_chunk) do
        if type(chunk) == 'table' and chunk.text then
            count = count + 1
        end
    end
    return count
end

return RL