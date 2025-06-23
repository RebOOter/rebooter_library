---@diagnostic disable: missing-return, unused-local
---@class df.item: df.base_class
---@field pos df.coord
---@field flags item_flags
---@field flags2 item_flags2
---@field age integer
---@field id integer
---@field specific_refs df.specific_ref[]
---@field general_refs df.general_ref[]
---@field world_data_id integer
---@field world_data_subid integer
---@field stockpile_countdown integer
---@field stockpile_delay integer
---@field base_uniform_score integer
---@field walkable_id integer
---@field spec_heat integer
---@field ignite_point integer
---@field heatdam_point integer
---@field colddam_point integer
---@field boiling_point integer
---@field melting_point integer
---@field fixed_temp integer
---@field weight massst
item = {}

---@param id integer
---@return df.item|nil
function item.find(id) end

-- Virtual methods
---@return df.item_type
function item:getType() end

---@return integer
function item:getSubtype() end

---@return integer
function item:getMaterial() end

---@return integer
function item:getMaterialIndex() end

---@param subtype integer
function item:setSubtype(subtype) end

---@param material integer
function item:setMaterial(material) end

---@param matIndex integer
function item:setMaterialIndex(matIndex) end

---@return integer
function item:getActualMaterial() end

---@return integer
function item:getActualMaterialIndex() end

---@return integer
function item:getRace() end

---@return integer
function item:getCaste() end

---@return integer
function item:getPlantID() end

---@return integer
function item:getGrowthPrint() end

---@param print integer
function item:setGrowthPrint(print) end

---@return integer
function item:getDimension() end

---@return integer
function item:getTotalDimension() end

---@param amount integer
function item:setDimension(amount) end

---@param amount integer
---@return boolean
function item:subtractDimension(amount) end

---@return boolean
function item:isFoodStorage() end

---@return boolean
function item:isTrackCart() end

---@return boolean
function item:isWheelbarrow() end

---@return integer
function item:getVehicleID() end

---@return boolean
function item:isCrafted() end

---@return df.item_stockpile_ref|nil
function item:getStockpile() end

---@return boolean
function item:containsPlaster() end

---@return boolean
function item:isPlaster() end

---@param bg integer
---@return boolean
function item:getColorOverride(bg) end

---@return df.item_profilest|nil
function item:getHistoryInfo() end

---@param use df.tool_uses
---@return boolean
function item:hasToolUse(use) end

---@return boolean
function item:hasInvertedTile() end

function item:becomePaste() end

function item:becomePressed() end

function item:calculateWeight() end

---@return boolean
function item:isSharpStone() end

---@return boolean
function item:isCrystalGlassable() end

---@param matIndex integer
---@return boolean
function item:isMetalOre(matIndex) end

function item:clearLastTempUpdateTS() end

---@param string_ptr string
---@param flag integer
function item:listNotableKills(string_ptr, flag) end

---@return integer
function item:getSpecHeat() end

---@return integer
function item:getIgnitePoint() end

---@return integer
function item:getHeatdamPoint() end

---@return integer
function item:getColddamPoint() end

---@return integer
function item:getBoilingPoint() end

---@return integer
function item:getMeltingPoint() end

---@return integer
function item:getFixedTemp() end

---@return integer
function item:getSolidDensity() end

---@return boolean
function item:materialRots() end

---@return integer
function item:getTemperature() end

---@param target integer
---@param amp integer
---@return boolean
function item:adjustTemperature(target, amp) end

function item:evaluate_corpse_flags() end

function item:set_placement_information() end

---@return integer
function item:getGloveHandedness() end

---@param flag integer
function item:setGloveHandedness(flag) end

---@return boolean
function item:isSpike() end

---@return boolean
function item:isScrew() end

---@return boolean
function item:isBuildMat() end

---@param tempType integer
---@return boolean
function item:isTemperatureSafe(tempType) end

---@param entity_id integer
function item:setRandSubtype(entity_id) end

---@return integer
function item:getWeaponSize() end

---@return integer
function item:getWear() end

---@param wear integer
function item:setWear(wear) end

---@return integer
function item:getMaker() end

---@param hf_id integer
function item:setMaker(hf_id) end

---@param prace integer
---@param pcaste integer
---@param phfig df.historical_figure|nil
---@param punit df.unit|nil
function item:getCorpseInfo(prace, pcaste, phfig, punit) end

---@return df.caste_body_info|nil
function item:getBodyInfo() end

---@return df.flagarray|nil
function item:getGloveFlags() end

---@return string|nil
function item:getItemShapeDesc() end

---@return integer|nil
function item:get_art_graphics_type_ptr() end

---@return integer|nil
function item:get_art_graphics_id_ptr() end

---@param ammo_spec df.squad_ammo_spec
---@return boolean
function item:isMatchingAmmoItem(ammo_spec) end

---@param id integer|nil
---@param subid integer|nil
function item:getImageRef(id, subid) end

---@param civ_id integer|nil
---@param site_id integer|nil
function item:getImageCivSite(civ_id, site_id) end

---@param civ_id integer
---@param site_id integer
function item:setImageCivSite(civ_id, site_id) end

---@param level integer
function item:setSeedsPlantSkillLevel(level) end

---@return integer
function item:getCorpseSize() end

---@param amount integer
---@return boolean
function item:ageItem(amount) end

---@return integer
function item:getCritterAirdrownTimer() end

---@param timer integer
function item:setCritterAirdrownTimer(timer) end

function item:incrementCritterAirdrownTimer() end

---@return integer
function item:getRotTimer() end

---@param val integer
function item:setRotTimer(val) end

function item:incrementRotTimer() end

---@return boolean
function item:instantRot() end

---@param civ_request_tab df.entity_sell_category
---@return boolean
function item:fitsCivRequestTab(civ_request_tab) end

---@param str string|nil
---@return string|nil
function item:getAmmoType(str) end

---@return boolean
function item:isLiquidPowder() end

---@return boolean
function item:isLiquid() end

---@return boolean
function item:isLiveAnimal() end

---@return integer
function item:getVolume() end

---@param imp_type df.improvement_type
---@param job df.job|nil
---@param unit df.unit|nil
---@param mat_type integer
---@param mat_index integer
---@param shape integer
---@param force_quality integer
---@param civ df.historical_entity|nil
---@param site df.world_site|nil
---@param tradegoodpurpose df.trade_good_purpose
---@param suppress_shaping boolean
---@param use_roll boolean
---@param roll integer
---@return df.itemimprovement|nil
function item:addImprovementFromJob(imp_type, job, unit, mat_type, mat_index, shape, force_quality, civ, site, tradegoodpurpose, suppress_shaping, use_roll, roll) end

---@return boolean
function item:isWeapon() end

---@return boolean
function item:isArmorNotClothing() end

---@return boolean
function item:isMillable() end

---@return boolean
function item:isProcessableThread() end

---@return boolean
function item:isProcessableVial() end

---@return boolean
function item:isProcessableBarrel() end

---@return boolean
function item:isEdiblePlant() end

---@param hunger integer
---@return boolean
function item:isEdibleRaw(hunger) end

---@param hunger integer
---@return boolean
function item:isEdibleCarnivore(hunger) end

---@param hunger integer
---@return boolean
function item:isEdibleBonecarn(hunger) end

---@param x integer
---@param y integer
---@param z integer
---@return boolean
function item:moveToGround(x, y, z) end

---@param in_play boolean
function item:categorize(in_play) end

function item:uncategorize() end

---@param empty boolean
---@return boolean
function item:isFurniture(empty) end

---@return boolean
function item:isPressed() end

---@return boolean
function item:isAnimal() end

---@param maker df.unit|nil
---@param job_skill df.job_skill
---@return df.item_quality
function item:assignQuality(maker, job_skill) end

---@param maker df.unit|nil
---@param job_skill df.job_skill
---@param skill_roll integer
---@return df.item_quality
function item:assignQualityRoll(maker, job_skill, skill_roll) end

---@param maker df.unit|nil
function item:notifyCreatedMasterwork(maker) end

function item:notifyLostMasterwork() end

---@param bg integer
function item:setDisplayColor(bg) end

---@return boolean
function item:isDamagedByHeat() end

---@param param integer
---@return boolean
function item:needTwoHandedWield(param) end

---@param stack_size integer
---@param preserve_containment boolean
---@return df.item|nil
function item:splitStack(stack_size, preserve_containment) end

---@return boolean
function item:isTameableVermin() end

---@return boolean
function item:isDye() end

---@param container_allowed boolean
---@param checkres boolean
---@return boolean
function item:isMilkable(container_allowed, checkres) end

---@return boolean
function item:isSandBearing() end

---@return boolean
function item:isLyeBearing() end

---@return boolean
function item:isAnimalProduct() end

---@param item_type df.item_type|nil
---@param material_category df.entity_material_category|nil
function item:getStorageInfo(item_type, material_category) end

---@param delta integer
---@param lose_masterwork boolean
---@param persist_parts boolean
---@return boolean
function item:addWear(delta, lose_masterwork, persist_parts) end

---@param delta integer
---@return boolean
function item:incWearTimer(delta) end

---@param lose_masterwork boolean
---@param persist_parts boolean
---@return boolean
function item:checkWearDestroy(lose_masterwork, persist_parts) end

---@param mat_type integer
---@param mat_index integer
---@param mat_state df.matter_state
---@param temp integer
---@param size integer
---@param body_part_id integer
---@param flags integer
function item:addContaminant(mat_type, mat_index, mat_state, temp, size, body_part_id, flags) end

---@param index integer
---@param amount integer
function item:removeContaminantByIdx(index, amount) end

---@param mat_type integer
---@param mat_index integer
---@param amount integer
function item:removeContaminant(mat_type, mat_index, amount) end

---@param unit df.unit|nil
---@param body_part_id integer
function item:tradeUnitContaminants(unit, body_part_id) end

---@param item df.item|nil
function item:tradeItemContaminants(item) end

---@param item_actual df.item_actual|nil
function item:tradeItemActualContaminants(item_actual) end

---@param unit df.unit|nil
---@param wound df.unit_wound|nil
---@param shift integer
---@param body_part_id integer
function item:contaminateWound(unit, wound, shift, body_part_id) end

---@param file df.file_compressorst|nil
function item:write_file(file) end

---@param file df.file_compressorst|nil
---@param loadversion df.save_version
function item:read_file(file, loadversion) end

---@return df.weapon_attack[]|nil
function item:getWeaponAttacks() end

---@return boolean
function item:isNotHeld() end

---@return boolean
function item:isActual() end

---@param entity df.historical_entity|nil
function item:addDefaultThreadImprovement(entity) end

---@param thread_item df.item|nil
---@param entity df.historical_entity|nil
function item:addThreadImprovement(thread_item, entity) end

function item:propagateUnitRefs() end

---@return boolean
function item:isSand() end

---@return integer
function item:get_production_zone_id() end

---@return integer
function item:getStackSize() end

---@param amount integer
function item:addStackSize(amount) end

---@param amount integer
function item:setStackSize(amount) end

---@param ammo_class string|nil
---@return boolean
function item:isAmmoClass(ammo_class) end

---@return boolean
function item:isAutoClean() end

---@param x integer
---@param y integer
---@param z integer
---@param lcl boolean
---@param contained boolean
function item:setTemperatureFromMapTile(x, y, z, lcl, contained) end

---@param lcl boolean
---@param contained boolean
function item:setTemperatureFromMap(lcl, contained) end

---@param temp integer
---@param lcl boolean
---@param contained boolean
function item:setTemperature(temp, lcl, contained) end

---@param lcl boolean
---@param contained boolean
---@param adjust boolean
---@param multiplier integer
---@return boolean
function item:updateTempFromMap(lcl, contained, adjust, multiplier) end

---@param temp integer
---@param lcl boolean
---@param contained boolean
---@param adjust boolean
---@param multiplier integer
---@return boolean
function item:updateTemperature(temp, lcl, contained, adjust, multiplier) end

---@return boolean
function item:updateFromWeather() end

---@param x integer
---@param y integer
---@param z integer
---@return boolean
function item:updateContaminants(x, y, z) end

---@return boolean
function item:checkTemperatureDamage() end

---@return boolean
function item:checkHeatColdDamage() end

---@return boolean
function item:checkMeltBoil() end

---@return df.job_skill
function item:getMeleeSkill() end

---@return df.job_skill
function item:getRangedSkill() end

---@param quality integer
function item:setQuality(quality) end

---@return integer
function item:getQuality() end

---@return integer
function item:getOverallQuality() end

---@return integer
function item:getImprovementQuality() end

---@return integer
function item:getProjectileSize() end

---@param job df.job|nil
---@param mat_type integer
---@param mat_index integer
---@return boolean
function item:isImprovable(job, mat_type, mat_index) end

---@param item_quality integer
---@param force_edge boolean
function item:setSharpness(item_quality, force_edge) end

---@return integer
function item:getSharpness() end

---@return boolean
function item:isTotemable() end

---@return boolean
function item:isDyeable() end

---@return boolean
function item:isNotDyed() end

---@return boolean
function item:isDyed() end

---@return boolean
function item:canSewImage() end

---@return boolean
function item:canHaveImageSewnOnto() end

---@return boolean
function item:isProcessableVialAtStill() end

---@param item_type df.item_type
---@param item_subtype integer
---@param mat_type integer
---@param mat_index integer
---@return boolean
function item:isSimilarToItem(item_type, item_subtype, mat_type, mat_index) end

---@return integer
function item:getBlockChance() end

---@return integer
function item:getParryChance() end

---@return integer
function item:getMakerRace() end

---@param race integer
function item:setMakerRace(race) end

---@return integer
function item:getEffectiveArmorLevel() end

---@return boolean
function item:isConstructed() end

---@return boolean
function item:wantsThreadImprovement() end

---@return boolean
function item:wantsClothImprovement() end

---@param mat_type integer
---@param mat_index integer
---@param mat_state df.matter_state
---@param temperature integer
function item:coverWithContaminant(mat_type, mat_index, mat_state, temperature) end

---@param imp_type df.improvement_type
---@return boolean
function item:hasSpecificImprovements(imp_type) end

---@return boolean
function item:hasImprovements() end

---@return boolean
function item:isImproved() end

---@return df.item_magicalst|nil
function item:getMagic() end

---@param str string|nil
---@param plurality integer
function item:getItemDescription(str, plurality) end

---@param str string|nil
---@param mode df.article_type
function item:getItemDescriptionPrefix(str, mode) end

---@param str string|nil
function item:getItemBasicName(str) end

---@param caravan df.caravan_state|nil
---@return integer
function item:getImprovementsValue(caravan) end

---@return boolean
function item:isExtractBearingFish() end

---@return boolean
function item:isExtractBearingVermin() end

---@return integer
function item:getMaterialSizeForMelting() end

---@return integer
function item:getBaseWeight() end

---@return integer
function item:getWeightShiftBits() end

---@return boolean
function item:isCollected() end

---@return boolean
function item:isEdibleVermin() end

---@return integer
function item:drawSelf() end

---@return boolean
function item:isRangedWeapon() end

---@return boolean
function item:isClothing() end

---@return boolean
function item:isWet() end

---@param appraiser df.historical_entity|nil
---@return integer
function item:getCurrencyValue(appraiser) end

---@return boolean
function item:isAssignedToStockpile() end

---@param stockpile_id integer
---@return boolean
function item:isAssignedToThisStockpile(stockpile_id) end

function item:detachStockpileAssignment() end

function item:removeStockpileAssignment() end

---@return df.item_stockpile_ref|nil
function item:getStockpile2() end

---@param mat_type integer
---@param mat_index integer
---@param u df.unit|nil
---@param j df.job|nil
function item:randomizeThreadImprovement(mat_type, mat_index, u, j) end

---@param art_chunk_id integer
---@param art_chunk_offse integer
---@param art_civ integer
---@param art_site integer
---@param material integer
---@param matgloss integer
---@param dye_material integer
---@param dye_matgloss integer
---@param item df.item|nil
---@param quality integer
---@param skill_level integer
---@param artist_hf integer
function item:addImprovement(art_chunk_id, art_chunk_offse, art_civ, art_site, material, matgloss, dye_material, dye_matgloss, item, quality, skill_level, artist_hf) end

---@param from_item df.item|nil
function item:copyImprovementsFrom(from_item) end

---@param caravan df.caravan_state|nil
---@return integer
function item:getThreadDyeValue(caravan) end

---@param colors integer[]|nil
---@param shapes integer[]|nil
function item:getColorAndShape(colors, shapes) end

---@return boolean
function item:isCritter() end

---@return boolean
function item:isArmor() end

---@param spec df.squad_uniform_spec|nil
---@param exact_match boolean
---@param best_any df.job_skill
---@param best_melee df.job_skill
---@param best_ranged df.job_skill
---@return integer
function item:calcUniformScore(spec, exact_match, best_any, best_melee, best_ranged) end

---@return integer
function item:calcBaseUniformScore() end

---@param race_id integer
---@param caste_id integer
---@param maximum integer
---@return integer
function item:get_attack_clothing_size(race_id, caste_id, maximum) end

---@return boolean
function item:is_structurally_elastic() end

---@return boolean
function item:is_woven() end

---@param kill_event integer
---@param slayer_hf integer
function item:add_hf_kill(kill_event, slayer_hf) end

---@param race integer
---@param caste integer
---@param subregion integer
---@param feature_layer integer
---@param site integer
---@param kill_flag integer
---@param slayer_hf integer
---@param quantity integer
function item:add_non_hf_kill(race, caste, subregion, feature_layer, site, kill_flag, slayer_hf, quantity) end

function item:add_block_parry_deflect() end

function item:add_strike() end

---@return df.slab_engraving_type
function item:getSlabEngravingType() end

---@return integer
function item:getAbsorption() end

---@return boolean
function item:isGlazed() end

---@return boolean
function item:isGemShapeable() end

---@param shape integer
function item:setGemShape(shape) end

---@return boolean
function item:isStoneShapeable() end

---@return integer
function item:getGemShape() end

---@return integer
function item:getFaceUp() end

---@return boolean
function item:isStrappable() end

---@return boolean
function item:hasWriting() end