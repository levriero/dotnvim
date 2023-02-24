return function()
	local transparent_background = false

	require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		transparent_background = transparent_background,
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
			neotree = true,
			telescope = true,
			treesitter = true,
			which_key = true,
		},
		highlight_overrides = {
			all = function(colors)
				return {
					NormalFloat = { fg = colors.text, bg = transparent_background and colors.none or colors.base },
					CmpBorder = { fg = colors.blue },
					CmpDocBorder = { fg = colors.flamingo },
				}
			end,
			mocha = function(colors)
				return {
					-- For native lsp configs.
					DiagnosticVirtualTextError = { bg = colors.none },
					DiagnosticVirtualTextWarn = { bg = colors.none },
					DiagnosticVirtualTextInfo = { bg = colors.none },
					DiagnosticVirtualTextHint = { bg = colors.none },
					-- For fidget.
					FidgetTask = { bg = colors.none, fg = colors.surface2 },
					FidgetTitle = { fg = colors.blue, style = { "bold" } },
				}
			end
		},
	})
end
