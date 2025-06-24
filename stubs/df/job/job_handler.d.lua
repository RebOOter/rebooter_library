---@class df.job_list_link
---@field item df.job
---@field prev df.job_list_link
---@field next df.job_list_link

---@class df.job_handler
---@field list df.job_list_link @ Linked list of jobs
---@field postings df.job_postingst[] @ Job postings, entries never removed
---@field job_application_heap df.job_application_binary_heapst @ This appears to be a priority queue of some sort
df.job_handler = {}

---@param job df.job
function df.job_handler:cancel_job(job) end
