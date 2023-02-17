-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
return function()
	local config_opts = {
		defaults = {
			mappings = {
				i = {
					["<C-u>"] = false,
					["<C-d>"] = require("telescope.actions").delete_buffer,
				},
			}
		}
	}

	-- Load Telescope and extensions
	require("telescope").setup(config_opts)
	require("telescope").load_extension("fzf")
end
