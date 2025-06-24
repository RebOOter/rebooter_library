---@diagnostic disable: missing-return

---@class dfhack.gui
gui = {}

---@param silent boolean | nil
---@return df.building
function gui.getSelectedStockpile(silent) end

---@param silent boolean | nil
---@return df.item
function gui.getSelectedItem(silent) end

---@param skip_dismissed boolean
---@param viewscreen string | nil
---@return df.viewscreen
function gui.getDFViewscreen(skip_dismissed, viewscreen) end

---@param focus_string string
---@param viewscreen df.viewscreen
---@return boolean
function gui.matchFocusString(focus_string, viewscreen) end