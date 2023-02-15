return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	cmd = "Telescope",
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
	},
	-- See `:help telescope.builtin`
	keys = {
		{ "<leader>?",       "<Cmd>Telescope oldfiles<CR>",    desc = "[?] Find recently opened files" },
		{ "<leader><space>", "<Cmd>Telescope buffers<CR>",     desc = "[ ] Find existing buffers" },
		{ "<leader>sf",      "<Cmd>Telescope find_files<CR>",  desc = "[S]earch [F]iles" },
		{ "<leader>sh",      "<Cmd>Telescope help_tags<CR>",   desc = "[S]earch [H]elp" },
		{ "<leader>sw",      "<Cmd>Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },
		{ "<leader>sg",      "<Cmd>Telescope live_grep<CR>",   desc = "[S]earch by [G]rep" },
		{ "<leader>sd",      "<Cmd>Telescope diagnostics<CR>", desc = "[S]earch [D]iagnostics" },
	},
	config = function()
		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		local config_opts = {
			mappings = {
				i = {
					["<C-u>"] = false,
					["<C-d>"] = require("telescope.actions").delete_buffer,
				}
			}
		}

		-- Load Telescope and extensions
		require("telescope").setup(config_opts)
		require("telescope").load_extension("fzf")

		-- Advanced keymaps
		vim.keymap.set("n", "<leader>/", function()
			local builtin = require("telescope.builtin")
			local themes = require("telescope.themes")
			local opts = { previewer = false }

			builtin.current_buffer_fuzzy_find(themes.get_dropdown(opts))
		end, { desc = "[/] Fuzzily search in current buffer]" })
	end
}
