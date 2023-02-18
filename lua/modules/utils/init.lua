local M = {}

---Get border characters by highlight group
---@param hl string @Highlight group name
---@param style string @Border style (default: "rounded")
---@return table
function M.border_highlight(hl, style)
	local border_tbl
	style = style or "rounded"

	if style == "rounded" then
		border_tbl = {
			{ "╭", hl },
			{ "─", hl },
			{ "╮", hl },
			{ "│", hl },
			{ "╯", hl },
			{ "─", hl },
			{ "╰", hl },
			{ "│", hl },
		}
	else
		border_tbl = {
			{ '┌', hl },
			{ '─', hl },
			{ '┐', hl },
			{ '│', hl },
			{ '┘', hl },
			{ '─', hl },
			{ '└', hl },
			{ '│', hl },
		}
	end

	return border_tbl
end

return M
