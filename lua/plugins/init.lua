local M = {}

table.insert(M, {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	config = require("plugins.config.catppuccin")
})

table.insert(M, { "ellisonleao/gruvbox.nvim", })
table.insert(M, { "folke/tokyonight.nvim" })

table.insert(M, {
	"folke/styler.nvim",
	event = "VeryLazy",
	opts = {
		themes = {
			markdown = { colorscheme = "gruvbox" },
		},
	},
})

table.insert(M, {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"ray-x/lsp_signature.nvim",
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
		"nvim-treesitter/nvim-treesitter-textobjects",
		"RRethy/nvim-treesitter-endwise"
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
		{ "<leader>?",       "<Cmd>Telescope oldfiles<CR>",    desc = "Find recently opened files" },
		{ "<leader><space>", "<Cmd>Telescope buffers<CR>",     desc = "Find existing buffers" },
		{ "<leader>sf",      "<Cmd>Telescope find_files<CR>",  desc = "Search Files" },
		{ "<leader>sh",      "<Cmd>Telescope help_tags<CR>",   desc = "Search Help" },
		{ "<leader>sw",      "<Cmd>Telescope grep_string<CR>", desc = "Search current Word" },
		{ "<leader>sg",      "<Cmd>Telescope live_grep<CR>",   desc = "Search by Grep" },
		{ "<leader>sd",      "<Cmd>Telescope diagnostics<CR>", desc = "Search Diagnostics" },
		{ "<leader>sc",      "<Cmd>Telescope colorscheme<CR>", desc = "Search Colorscheme" },
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
	opts = {
		window = {
			blend = 0
		},
	}
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
	"akinsho/toggleterm.nvim",
	cmd = {
		"ToggleTerm",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
		"ToggleTermSendVisualLines",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualSelection",
	},
	keys = {
		{ "<C-t>", "<Cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
		{ "<leader>g", function()
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

			lazygit:toggle()
		end, desc = "Toggle Terminal with Lazygit" }
	},
	config = require("plugins.config.toggleterm")
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
	"akinsho/bufferline.nvim",
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("plugins.config.bufferline"),
})

table.insert(M, {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	opts = {
		plugins = {
			gitsigns = true,
		}
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
		popup_border_style = 'single',
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

return M
