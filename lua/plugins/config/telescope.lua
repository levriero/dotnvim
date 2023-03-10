-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
return function()
	local icons = { ui = require("modules.utils.icons").get("ui", true) }

	local config_opts = {
		defaults = {
			prompt_prefix = " " .. icons.ui.Telescope .. " ",
			selection_caret = icons.ui.ChevronRight,
			borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
			mappings = {
				i = {
					["<C-u>"] = false,
					["<C-d>"] = require("telescope.actions").delete_buffer,
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false
			}
		},
	}

	-- Load Telescope and extensions
	require("telescope").setup(config_opts)
	require("telescope").load_extension("fzf")
end
