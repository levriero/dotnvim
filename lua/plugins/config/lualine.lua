return function()
	local icons = {
		diagnostics = require("modules.utils.icons").get("diagnostics", true),
		git = require("modules.utils.icons").get("git", true),
	}

	require("lualine").setup({
		options = {
			icons_enabled = true,
			globalstatus = true,
			theme = 'tokyonight',
			disabled_filetypes = {},
			component_separators = "",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {},
			lualine_b = {
				{
					"branch",
					icon = icons.git.Branch,
				},
				{
					"diff",
					symbols = {
						added = icons.git.Add,
						modified = icons.git.Mod_alt,
						removed = icons.git.Remove,
					},
				},
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
			lualine_z = { { "location", separator = { left = "", right = "" } } },
		}
	})
end
