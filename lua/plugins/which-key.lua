return {
	"folke/which-key.nvim",
	lazy = true,
	event = "VeryLazy",
	config = function()
		local icons = {
			ui = require("modules.utils.icons").get("ui"),
			misc = require("modules.utils.icons").get("misc"),
		}
		require("which-key").setup({
			plugins = {
				presets = {
					operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
			icons = {
				breadcrumb = icons.ui.Separator,
				separator = icons.misc.Vbar,
				group = icons.misc.Add,
			},
		})
	end
}
