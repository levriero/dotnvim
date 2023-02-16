return {
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
		{ "<C-t>", "<Cmd>ToggleTerm<CR>", desc = "Toggle Terminal" }
	},
	config = function()
		local colors = require("catppuccin.palettes").get_palette()

		require("toggleterm").setup({
			open_mapping = "<C-t>",
			direction = "float",
			highlights = {
				FloatBorder = {
					guifg = colors.blue
				}
			},
			float_opts = {
				border = "curved"
			}
		})
	end
}
