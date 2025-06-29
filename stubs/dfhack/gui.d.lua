---@diagnostic disable: missing-return

---@class dfhack.gui
gui = {}

---@param silent boolean | nil
---@return df.building
function gui.getSelectedStockpile(silent) end

---@param silent boolean | nil
---@return df.item
function gui.getSelectedItem(silent) end

---@param silent boolean | nil
---@return df.unit
function gui.getSelectedUnit(silent) end

---@param skip_dismissed boolean?
---@param viewscreen string | nil
---@return df.viewscreen
function gui.getDFViewscreen(skip_dismissed, viewscreen) end

function gui.getCurViewscreen() end

---@param focus_string string
---@param viewscreen df.viewscreen?
---@return boolean
function gui.matchFocusString(focus_string, viewscreen) end

---@param text string
function gui.showAnnouncement(text) end