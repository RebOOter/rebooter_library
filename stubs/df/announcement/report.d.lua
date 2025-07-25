---@class df.report: df.base_class
---@field type df.announcement_type # valid only if coordinates are
---@field text string
---@field color integer # init-value='7'
---@field bright boolean # init-value='true'
---@field duration integer # init-value='100', remaining graphical frames to display this report in announcement bar
---@field flags df.announcement_flag
---@field repeat_count integer # 100 => displays: x101
---@field zoom_type df.report_zoom_type
---@field pos df.coord
---@field zoom_type2 df.report_zoom_type
---@field pos2 df.coord
---@field id integer
---@field year integer
---@field time integer
---@field activity_id integer # ref-target='activity_entry'
---@field activity_event_id integer # ref-target='activity_event'
---@field speaker_id integer # ref-target='unit', unit speaking the conversation
report = {}

---@param id integer
---@return df.report|nil
function report.find(id) end
