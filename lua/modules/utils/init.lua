local M = {}

---Get border characters by highlight group
---@param hl string @Highlight group name
---@return table
function M.border_highlight(hl)
	return {
		{ "╭", hl },
		{ "─", hl },
		{ "╮", hl },
		{ "│", hl },
		{ "╯", hl },
		{ "─", hl },
		{ "╰", hl },
		{ "│", hl },
	}
end

return M
