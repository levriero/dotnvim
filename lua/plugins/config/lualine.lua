return function()
	local icons = {
		diagnostics = require("modules.utils.icons").get("diagnostics", true),
	}

	require("lualine").setup({
		options = {
			icons_enabled = true,
			globalstatus = true,
			theme = 'rose-pine',
			disabled_filetypes = {},
			component_separators = "|",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { { "mode", separator = { left = "", right = "" } } },
			lualine_b = {
				{ "branch" },
				{ "diff" }
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
				{ "progress" }
			},
			lualine_z = { { "location", separator = { left = "", right = "" } } },
		}
	})
end
