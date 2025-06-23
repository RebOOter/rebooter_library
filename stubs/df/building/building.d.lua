---@diagnostic disable: missing-return
---@class df.building
---@field x1 integer  -- top left
---@field y1 integer
---@field centerx integer  -- work location
---@field x2 integer  -- bottom right
---@field y2 integer
---@field centery integer
---@field z integer
---@field flags building_flags
---@field mat_type integer
---@field mat_index integer
---@field room building_room
---@field age integer
---@field race integer
---@field id integer
---@field jobs df.job[]
---@field specific_refs specific_ref[]
---@field general_refs general_ref[]
---@field relations building_civzonest[]
---@field job_claim_suppress job_restrictionst[]
---@field name string
---@field activities building_activity_infost[]
---@field world_data_id integer
---@field world_data_subid integer
---@field creation_bld_num integer
---@field site_id integer
---@field location_id integer

building = {}

---@return integer
function building:getCustomType() end

---@param type integer
function building:setCustomType(type) end

---@param supplies df.abstract_building_contents
function building:countHospitalSupplies(supplies) end

---@return df.stockpile_links
function building:getStockpileLinks() end

--- remove_as_creation_zone_alteration
function building:detachWorldData() end

--- used by the give to building ui of stockpile
---@return boolean
function building:canLinkToStockpile() end

---@return df.building_users
function building:getUsers() end

---@param delta_x integer
---@param delta_y integer
---@param delta_z integer
function building:moveBuilding(delta_x, delta_y, delta_z) end

---@param abs_x integer
---@param abs_y integer
function building:initOccupancy(abs_x, abs_y) end

---@param job_type df.job_type
---@param newoff integer
function building:setFillTimer(job_type, newoff) end

---@return boolean
function building:isOnFire() end

--- from magma OR machine power
---@return boolean
function building:isUnpowered() end

--- safe_on_unfreeze_floor
---@return boolean
function building:canCollapse() end

---@return df.tile_building_occ
function building:getPassableOccupancy() end

---@return df.tile_building_occ
function building:getImpassableOccupancy() end

--- check_down_for_frozen_machine_rect
---@return boolean
function building:isPowerSource() end

function building:updateFromWeather() end

function building:updateTemperature() end

function building:updateItems() end

---@param temp integer
---@param main_turn boolean
---@param amp integer
function building:updateTempFromTile(temp, main_turn, amp) end

--- bay12: item_determines_building_pic
---@return boolean
function building:isNormalFurniture() end

--- destroy_not_topple
---@return boolean
function building:isFarmPlot() end

---@return df.workshop_profile
function building:getWorkshopProfile() end

---@return df.machine_info
function building:getMachineInfo() end

---@param power_info df.power_info
function building:getPowerInfo(power_info) end

---@param tile_set df.machine_tile_set
---@return boolean
function building:canConnectToMachine(tile_set) end

---@return df.building_type
function building:getType() end

---@return integer
function building:getSubtype() end

---@param subtype integer
function building:setSubtype(subtype) end

---@return boolean
function building:isActual() end

---@return boolean
function building:keepsOwnerAfterDeath() end

function building:updateAction() end

--- owned_party_spot
---@return boolean
function building:isStatueOrRestraint() end

---@param amt integer
function building:setMaterialAmount(amt) end

---@param stage integer
function building:setBuildStage(stage) end

---@return integer
function building:getBuildStage() end

---@return integer
function building:getMaxBuildStage() end

---@return integer
function building:getBuildDuration() end

---@return boolean
function building:isSettingOccupancy() end

---@return boolean
function building:trampleOnBuild() end

---@return boolean
function building:isExtentShaped() end

---@param abs_x integer
---@param abs_y integer
function building:updateOccupancy(abs_x, abs_y) end

---@param unit df.unit
---@return integer
function building:getPersonalValue(unit) end

---@return boolean
function building:canBeRoom() end

---@return integer
function building:getDestroyDuration() end

--- same as querying and pressing X
function building:queueDestroy() end

---@param rel_x integer
---@param rel_y integer
---@return boolean
function building:isImpassableTile(rel_x, rel_y) end

---@param subtract_pending_jobs boolean
---@return integer
function building:getFreeCapacity(subtract_pending_jobs) end

---@param item df.item
---@param subtract_pending_jobs boolean
---@return boolean
function building:canStoreItem(item, subtract_pending_jobs) end

---@param name df.stl-string
function building:getName(name) end

function building:getNameColor() end

function building:initFarmSeasons() end

--- 1..10
---@return integer
function building:getClutterLevel() end

---@return boolean
function building:needsDesign() end

---@param job_type df.job_type
---@return boolean
function building:canUseForMood(job_type) end

---@return boolean
function building:canBeRoomSubset() end

--- bay12: uniqueownablebuilding, cannot have more than one room
---@return boolean
function building:isCoffin() end

---@return boolean
function building:canUseSpouseRoom() end

--- false if already, or cannot be
---@return boolean
function building:canMakeRoom() end

--- building is assigned to a unit (if a zone) or is in a zone that is assigned to a unit
---@return boolean
function building:isAssigned() end

---@return boolean
function building:isJusticeRestraint() end

---@param unit df.unit
function building:detachRestrainedUnit(unit) end

---@param file df.file_compressorst
function building:write_file(file) end

---@param file df.file_compressorst
---@param loadversion df.save_version
function building:read_file(file, loadversion) end

--- bay12: perimdestroyer; the true set looks like things where the unit should stand aside
---@return boolean
function building:isImpassableAtCreation() end

--- Add to world.buildings.other.*
---@param in_play boolean
function building:categorize(in_play) end

--- Remove from world.buildings.other.*
function building:uncategorize() end

---@return integer
function building:getArchValue() end

--- 0 = active/open, 1 = inactive/closed
---@param new_state integer
function building:setTriggerState(new_state) end

---@return boolean
function building:needsMagma() end

---@param noscatter boolean
---@param lost boolean
function building:removeUses(noscatter, lost) end

---@param noscatter boolean
---@param lost boolean
---@param from_damage boolean
function building:deconstructItems(noscatter, lost, from_damage) end

function building:cleanupMap() end

--- checks contained_items[0] for FIREIMMUNE
---@param fire_type integer
---@return boolean
function building:isFireSafe(fire_type) end

function building:fillSidebarMenu() end

---@return boolean
function building:isForbidden() end

---@return boolean
function building:isInvisibleToPlayer() end

---@return boolean
function building:isHidden() end

--- not hidden, or hide/unhide UI mode
---@return boolean
function building:isVisibleInUI() end

--- checks coordinates, calls isVisibleInUI and checks window_xy
---@param viewport df.map_viewport
---@return boolean
function building:isVisibleInViewport(viewport) end

---@param buffer df.building_drawbuffer
function building:getDrawExtents(buffer) end

--- building_wellst only
---@param curtick integer
---@param buffer df.building_drawbuffer
---@param z_offset integer
function building:drawBuilding(curtick, buffer, z_offset) end

---@param squad_id integer
---@param force_flag integer
---@return boolean
function building:isValidSquadAssignment(squad_id, force_flag) end

---@return integer
function building:getSpecificSquad() end

---@return integer
function building:getSpecificPosition() end

---@param squad_id integer
---@param squad_pos integer
function building:setSpecificSquadPos(squad_id, squad_pos) end

function building:clearSpecificSquad() end

--- related to tavern beds
function building:removeLocationInfo() end

---@class building_room
---@field extents building_extents_type[]
---@field x integer
---@field y integer
---@field width integer
---@field height integer
