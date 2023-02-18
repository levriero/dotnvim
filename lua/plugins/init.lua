local M = {}

table.insert(M, {
	"catppuccin/nvim",
	lazy = false,
	config = require("plugins.config.catppuccin")
})

table.insert(M, {
	"neovim/nvim-lspconfig",
	lazy = true,
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
	lazy = true,
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
	lazy = true,
	build = ":TSUpdate",
	event = { "CursorHold", "CursorHoldI" },
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	config = require("plugins.config.treesitter")
})

table.insert(M, {
	"nvim-telescope/telescope.nvim",
	lazy = true,
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
	lazy = true,
	event = "VeryLazy",
	config = require("plugins.config.nvim-notify")
})

table.insert(M, {
	"numToStr/Comment.nvim",
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("plugins.config.comment")
})

table.insert(M, {
	"lukas-reineke/indent-blankline.nvim",
	lazy = true,
	event = "BufReadPost",
	config = require("plugins.config.indent-blankline")
})

table.insert(M, {
	"j-hui/fidget.nvim",
	lazy = true,
	event = "BufReadPost",
	config = require("plugins.config.fidget")
})

table.insert(M, {
	"nvim-tree/nvim-tree.lua",
	lazy = true,
	cmd = {
		"NvimTreeToggle",
		"NvimTreeOpen",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeRefresh",
	},
	config = require("plugins.config.nvim-tree")
})

table.insert(M, {
	"goolord/alpha-nvim",
	lazy = true,
	event = "BufWinEnter",
	config = require("plugins.config.alpha")
})

table.insert(M, {
	"lewis6991/gitsigns.nvim",
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("plugins.config.gitsigns")
})

table.insert(M, {
	"ggandor/leap.nvim",
	lazy = true,
	event = "BufReadPost",
	dependencies = { "tpope/vim-repeat" },
	config = require("plugins.config.leap")
})

table.insert(M, {
	"nvim-lualine/lualine.nvim",
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("plugins.config.lualine")
})

table.insert(M, {
	"akinsho/toggleterm.nvim",
	lazy = true,
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
	lazy = true,
	event = "BufReadPost",
	config = require("plugins.config.smartyank")
})

table.insert(M, {
	"tpope/vim-fugitive",
	lazy = true,
	cmd = {
		"G",
		"Git",
		"Gread"
	},
})

table.insert(M, {
	"junegunn/vim-slash",
	lazy = true,
	event = { "CursorMoved", "InsertEnter" },
})

table.insert(M, {
	"vim-test/vim-test",
	lazy = true,
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
	lazy = true,
	cmd = {
		"Trouble",
		"TroubleToggle",
		"TroubleRefresh"
	},
	config = require("plugins.config.trouble")
})

table.insert(M, {
	"folke/which-key.nvim",
	lazy = true,
	event = "VeryLazy",
	config = require("plugins.config.which-key")
})

table.insert(M, {
	"akinsho/bufferline.nvim",
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("plugins.config.bufferline"),
})

return M
