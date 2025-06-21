---@class dfhack.job
job = {}

---@param job df.job
---@param worker df.unit
function job.addWorker(job, worker) end

---@param job df.job
---@param ref_type df.general_ref_type
---@param id integer
function job.addGeneralRef(job, ref_type, id) end

---@param job df.job
---@param item df.item
---@param role df.job_role_type
---@param filter_idx integer
---@param insert_idx integer
function job.attachJobItem(job, item, role, filter_idx, insert_idx) end

---@param job df.job
---@param new_id integer | boolean
function job.linkIntoWorld(job, new_id) end