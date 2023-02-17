-- [[ Configure indent-blankline ]]
-- See `:help indent_blankline.txt`
return function()
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
