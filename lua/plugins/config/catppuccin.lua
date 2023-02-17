return function()
	require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		transparent_background = true,
		integrations = {
			cmp = true,
			fidget = true,
			gitsigns = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
			leap = true,
			mason = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
			notify = true,
			nvimtree = true,
			telescope = true,
			treesitter = true,
			which_key = true,
		}
	})
end
