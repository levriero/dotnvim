return function()
	local dashboard = require("alpha.themes.dashboard")
	local icons = {
		documents = require("modules.utils.icons").get("documents", true),
		misc = require("modules.utils.icons").get("misc", true),
		ui = require("modules.utils.icons").get("ui", true),
	}

	dashboard.section.header.val = require("modules.utils.ascii_art").sharp
	dashboard.section.header.opts.hl = "Boolean"

	dashboard.section.buttons.val = {
		dashboard.button("space s f", icons.documents.FileTree .. "Search files", "<cmd>Telescope find_files<cr>"),
		dashboard.button("space s g", icons.ui.Search .. "Search text", "<cmd>Telescope live_grep<cr>"),
		dashboard.button("space s h", icons.misc.ManUp .. "Search help", "<cmd>Telescope oldfiles<cr>"),
		dashboard.button("space ?", icons.ui.History .. "Search history", "<cmd>Telescope oldfiles<cr>"),
	}
	dashboard.section.buttons.opts.hl = "String"

	local function footer()
		local stats = require("lazy").stats()
		local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

		return icons.misc.Vim
				.. "neovim"
				.. " v"
				.. vim.version().major
				.. "."
				.. vim.version().minor
				.. "."
				.. vim.version().patch
				.. " – "
				.. icons.misc.Glass
				.. stats.count
				.. " plugins in "
				.. ms
				.. "ms"
	end

	dashboard.section.footer.val = footer()
	dashboard.section.footer.opts.hl = "Function"

	local head_butt_padding = 2
	local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
	local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
	local foot_butt_padding = 2

	dashboard.config.layout = {
		{ type = "padding", val = header_padding },
		dashboard.section.header,
		{ type = "padding", val = head_butt_padding },
		dashboard.section.buttons,
		{ type = "padding", val = foot_butt_padding },
		dashboard.section.footer,
	}

	dashboard.opts.opts.noautocmd = true
	require("alpha").setup(dashboard.opts)

	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		callback = function()
			dashboard.section.footer.val = footer()
			pcall(vim.cmd.AlphaRedraw)
		end,
	})
end
