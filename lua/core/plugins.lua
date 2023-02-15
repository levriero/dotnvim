local global = require("core.global")
local data_dir = global.data_dir

local icons = {
	kind = require("modules.utils.icons").get("kind"),
	documents = require("modules.utils.icons").get("documents"),
	ui = require("modules.utils.icons").get("ui"),
	ui_sep = require("modules.utils.icons").get("ui", true),
	misc = require("modules.utils.icons").get("misc"),
}

local Lazy = {}

function Lazy:load_lazy()
	local lazy_path = data_dir .. "/lazy/lazy.nvim"
	local lazy_settings = {
		root = data_dir .. "lazy", -- Directory where plugins will be installed
		install = {
			-- install missing plugins on startup. This doesn't increase startup time.
			missing = true,
			-- try to load one of these colorschemes when starting an installation during startup
			colorscheme = { "catppuccin" },
		},
		ui = {
			border = "rounded",
			icons = {
				cmd = icons.misc.Code,
				config = icons.ui.Gear,
				event = icons.kind.Event,
				ft = icons.documents.Files,
				init = icons.misc.ManUp,
				import = icons.documents.Import,
				keys = icons.ui.Keyboard,
				loaded = icons.ui.Check,
				not_loaded = icons.misc.Ghost,
				plugin = icons.ui.Package,
				runtime = icons.misc.Vim,
				source = icons.kind.StaticMethod,
				start = icons.ui.Play,
				list = {
					icons.ui_sep.BigCircle,
					icons.ui_sep.BigUnfilledCircle,
					icons.ui_sep.Square,
					icons.ui_sep.ChevronRight,
				}
			}
		},
		performance = {
			cache = {
				enabled = true,
				path = vim.fn.stdpath("cache") .. "/lazy/cache",
			},
			reset_packpath = true, -- reset the package path to improve startup time
			rtp = {
				reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
				---@type string[]
				paths = {}, -- add any custom paths here that you want to includes in the rtp
			},
		},
	}

	if not vim.loop.fs_stat(lazy_path) then
		vim.notify("Cloning plugin manager...")
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazy_path,
		})
	end

	vim.opt.rtp:prepend(lazy_path)
	require("lazy").setup("plugins", lazy_settings)
end

Lazy:load_lazy()
