return function()
	local icons = {
		diagnostics = require("modules.utils.icons").get("diagnostics", true),
	}

	local function diff_source()
		local gitsigns = vim.b.gitsigns_status_dict

		if gitsigns then
			return {
				added = gitsigns.added,
				modified = gitsigns.changed,
				removed = gitsigns.removed,
			}
		end
	end

	require("lualine").setup({
		options = {
			icons_enabled = true,
			globalstatus = true,
			theme = "catppuccin",
			disabled_filetypes = {},
			component_separators = "|",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { { "mode" } },
			lualine_b = {
				{ "branch" },
				{ "diff",  source = diff_source }
			},
			lualine_c = {
				{ "filename", file_status = true, path = 1 }
			},
			lualine_x = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = {
						error = icons.diagnostics.Error,
						warn = icons.diagnostics.Warning,
						info = icons.diagnostics.Information,
					},
				},
			},
			lualine_y = {
				{ "filetype", colored = true, icon_only = true },
				{ "encoding" },
			},
			lualine_z = { "progress", "location" },
		}
	})
end
