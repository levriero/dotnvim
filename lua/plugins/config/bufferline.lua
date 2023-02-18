-- See `:h bufferline-configuration`
return function()
	local icons = { ui = require("modules.utils.icons").get("ui") }

	require("bufferline").setup({
		options = {
			modified_icon = icons.ui.Modified_alt,
			buffer_close_icon = icons.ui.Close,
			left_trunc_marker = icons.ui.Left,
			right_trunc_marker = icons.ui.Right,
			show_close_icon = false,
			show_buffer_close_icons = false,
			always_show_bufferline = false,
			separator_style = "thin",
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count)
				return "(" .. count .. ")"
			end,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "left",
					padding = 1
				}
			}
		},
		highlights = require("catppuccin.groups.integrations.bufferline").get()
	})
end
