return function()
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
			border = "single"
		}
	})
end
