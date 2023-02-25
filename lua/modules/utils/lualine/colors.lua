local C = require("catppuccin.palettes").get_palette()
local catppuccin = {}

local transparent_bg = true
local bg_color = transparent_bg and "NONE" or C.mantle

catppuccin.normal = {
	a = { bg = C.blue, fg = C.mantle, gui = "bold" },
	b = { bg = C.surface1, fg = C.blue },
	c = { bg = bg_color, fg = C.text },
}

catppuccin.insert = {
	a = { bg = C.green, fg = C.base, gui = "bold" },
	b = { bg = C.surface1, fg = C.teal },
}

catppuccin.terminal = {
	a = { bg = C.green, fg = C.base, gui = "bold" },
	b = { bg = C.surface1, fg = C.teal },
}

catppuccin.command = {
	a = { bg = C.peach, fg = C.base, gui = "bold" },
	b = { bg = C.surface1, fg = C.peach },
}

catppuccin.visual = {
	a = { bg = C.mauve, fg = C.base, gui = "bold" },
	b = { bg = C.surface1, fg = C.mauve },
}

catppuccin.replace = {
	a = { bg = C.red, fg = C.base, gui = "bold" },
	b = { bg = C.surface1, fg = C.red },
}

catppuccin.inactive = {
	a = { bg = bg_color, fg = C.blue },
	b = { bg = bg_color, fg = C.surface1, gui = "bold" },
	c = { bg = bg_color, fg = C.overlay0 },
}

return catppuccin
