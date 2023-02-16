return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = true,
	event = "BufReadPost",
	config = function()
		-- See `:help indent_blankline.txt`
		require('indent_blankline').setup {
			char = "│",
			show_trailing_blankline_indent = false,
			filetype_exclude = {
				"", -- for all buffers without a file type
				"NvimTree",
				"TelescopePrompt",
				"lspinfo",
				"checkhealth",
				"help",
				"man",
			}
		}
	end
}
