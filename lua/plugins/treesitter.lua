return {
	"nvim-treesitter/nvim-treesitter",
	lazy = true,
	build = ":TSUpdate",
	event = { "CursorHold", "CursorHoldI" },
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
	},
	config = function()
		-- [[ Configure Treesitter ]]
		-- See `:help nvim-treesitter`
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"go",
				"gomod",
				"help",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"ruby",
				"yaml",
			},
			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,
			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
			highlight = {
				-- `false` will disable the whole extension
				enable = true,

				disable = function(lang, buf)
					-- Disable treesitter for vimscript
					if vim.tbl_contains({ "vim" }, lang) then
						return true
					end

					-- Also disable for large files
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true, disable = { "python" } },
			textobjects = {
				select = {
					enable = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]["] = "@function.outer",
						["]m"] = "@class.outer",
					},
					goto_next_end = {
						["]]"] = "@function.outer",
						["]M"] = "@class.outer",
					},
					goto_previous_start = {
						["[["] = "@function.outer",
						["[m"] = "@class.outer",
					},
					goto_previous_end = {
						["[]"] = "@function.outer",
						["[M"] = "@class.outer",
					},
				},
			},
		})
	end
}
