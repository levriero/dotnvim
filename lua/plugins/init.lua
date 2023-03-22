local M = {}

table.insert(M, {
	"catppuccin/nvim",
	name = "catppuccin",
	config = require("plugins.config.catppuccin")
})

table.insert(M, {
	"rose-pine/neovim",
	name = "rose-pine",
	config = require("plugins.config.rose-pine")
})

table.insert(M, {
	"folke/tokyonight.nvim",
	name = "tokyonight",
	lazy = false,
	opts = {
		styles = {
			floats = "transparent"
		}
	},
})

table.insert(M, {
	"numToStr/FTerm.nvim",
	config = require("plugins.config.fterm")
})

table.insert(M, {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
	},
	config = require("plugins.config.lsp")
})

table.insert(M, {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"onsails/lspkind.nvim",
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = require("plugins.config.luasnip")
		},
		{ "windwp/nvim-autopairs", config = require("plugins.config.autopairs") }
	},
	config = require("plugins.config.completion")
})

table.insert(M, {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "CursorHold", "CursorHoldI" },
	dependencies = {
		"nvim-treesitter/playground",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"RRethy/nvim-treesitter-endwise",
	},
	config = require("plugins.config.treesitter")
})

table.insert(M, {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
	},
	-- See `:help telescope.builtin`
	keys = {
		{ "<leader>?",       "<Cmd>Telescope oldfiles<CR>",               desc = "Find recently opened files" },
		{ "<leader><space>", "<Cmd>Telescope buffers<CR>",                desc = "Find existing buffers" },
		{ "<leader>sf",      "<Cmd>Telescope find_files<CR>",             desc = "Search Files" },
		{ "<leader>sh",      "<Cmd>Telescope help_tags<CR>",              desc = "Search Help" },
		{ "<leader>s.",      "<Cmd>Telescope find_files hidden=true<CR>", desc = "Search Hidden Files" },
		{ "<leader>sw",      "<Cmd>Telescope grep_string<CR>",            desc = "Search current Word" },
		{ "<leader>sg",      "<Cmd>Telescope live_grep<CR>",              desc = "Search by Grep" },
		{ "<leader>sd",      "<Cmd>Telescope diagnostics<CR>",            desc = "Search Diagnostics" },
		{ "<leader>sc",      "<Cmd>Telescope colorscheme<CR>",            desc = "Search Colorscheme" },
		{
			"<leader>/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					previewer = false }))
			end,
			desc = "Fuzzily search in current buffer"
		},
	},
	config = require("plugins.config.telescope")
})

table.insert(M, {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = require("plugins.config.nvim-notify")
})

table.insert(M, {
	"numToStr/Comment.nvim",
	event = { "CursorHold", "CursorHoldI" },
	config = true
})

table.insert(M, {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufReadPost",
	config = require("plugins.config.indent-blankline")
})

table.insert(M, {
	"j-hui/fidget.nvim",
	event = "BufReadPost",
	config = true,
})

table.insert(M, {
	"goolord/alpha-nvim",
	event = "BufWinEnter",
	config = require("plugins.config.alpha")
})

table.insert(M, {
	"lewis6991/gitsigns.nvim",
	event = { "CursorHold", "CursorHoldI" },
	config = require("plugins.config.gitsigns")
})

table.insert(M, {
	"ggandor/leap.nvim",
	event = "BufReadPost",
	dependencies = { "tpope/vim-repeat" },
	config = require("plugins.config.leap")
})

table.insert(M, {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("plugins.config.lualine")
})

table.insert(M, {
	"ibhagwan/smartyank.nvim",
	event = "BufReadPost",
	config = require("plugins.config.smartyank")
})

table.insert(M, {
	"junegunn/vim-slash",
	event = { "CursorMoved", "InsertEnter" },
})

table.insert(M, {
	"vim-test/vim-test",
	cmd = {
		"TestNearest",
		"TestFile",
		"TestSuite",
		"TestLast",
		"TestVisit",
	},
	config = require("plugins.config.vim-test")
})

table.insert(M, {
	"folke/trouble.nvim",
	cmd = {
		"Trouble",
		"TroubleToggle"
	},
	opts = {
		use_diagnostic_signs = true
	},
})

table.insert(M, {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = require("plugins.config.which-key")
})

table.insert(M, {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	opts = {
		window = {
			backdrop = 1,
		},
		plugins = {
			gitsigns = true,
			alacritty = {
				enabled = true,
				font = "22"
			},
		},
	},
	keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
})

table.insert(M, {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
	config = true
})

table.insert(M, { "MunifTanjim/nui.nvim" })

table.insert(M, {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	init = function()
		-- remove the deprecated commands from v1.x
		vim.g.neo_tree_remove_legacy_commands = 1
	end,
	opts = {
		popup_border_style = "single",
		filesystem = {
			follow_current_file = true
		}
	}
})

table.insert(M, {
	"folke/todo-comments.nvim",
	cmd = { "TodoTrouble", "TodoTelescope" },
	event = { "BufReadPost", "BufNewFile" },
	config = true,
	keys = {
		{ "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
		{ "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
		{ "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
		{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
		{ "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
	},
})

table.insert(M, {
	"stevearc/dressing.nvim",
	lazy = true,
	init = function()
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.select = function(...)
			require("lazy").load({ plugins = { "dressing.nvim" } })
			return vim.ui.select(...)
		end
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.input = function(...)
			require("lazy").load({ plugins = { "dressing.nvim" } })
			return vim.ui.input(...)
		end
	end,
})

return M
