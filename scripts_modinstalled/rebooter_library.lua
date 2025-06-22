--@ module = true

---------------------
-- Jobs processing --
---------------------

if not dfhack_flags.module then
    print('This mod cannot be used directly. It is just a library :)')
    return
end

---@class RebooterLibrary
RL = {}

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
        if RL.availableLaborer(unit, df.unit_labor.HAUL_WOOD, workshop, burrow) then
            return unit
        end
    end
end

---@param job_type df.job_type
---@param building df.building
---@param item df.item
---@return df.job
function RL.createJobAndAssignUnit(job_type, building, burrow, item)
    local job = df.job:new()
    dfhack.job.linkIntoWorld(job, true)
    job.job_type = job_type

    job.pos = xyz2pos(building.centerx, building.centery, building.z)
    dfhack.job.addGeneralRef(job, df.general_ref_type.BUILDING_HOLDER, building.id)
    dfhack.job.attachJobItem(job, item, df.job_role_type.Hauled, 0, -1)
    local unit = RL.findAvailableLaborer(building, burrow)
    if unit then
        dfhack.job.addWorker(job, unit)
        dfhack.units.setPathGoal(unit, item.pos, df.unit_path_goal.StoreItem)
        job.items[0].flags.is_fetching = true
        job.flags.fetching = true
    end
    return job
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