return function()
	local fterm = require("FTerm")
	local config = { hl = 'FTermNormal', }

	local lazygit = fterm:new({
		ft = "fterm_lazygit",
		cmd = "lazygit"
	})

	vim.keymap.set("n", "<leader>g", function ()
		lazygit:toggle()
	end)

	fterm.setup(config)
end
