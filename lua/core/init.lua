local global = require("core.global")

local disable_distribution_plugins = function()
	-- Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim 
	-- (all these plugins are related to checking files inside compressed files)
	vim.g.loaded_gzip = 1
	vim.g.loaded_tar = 1
	vim.g.loaded_tarPlugin = 1
	vim.g.loaded_vimball = 1
	vim.g.loaded_vimballPlugin = 1
	vim.g.loaded_zip = 1
	vim.g.loaded_zipPlugin = 1

	-- Disable sql omni completion.
	vim.g.loaded_sql_completion = 1

	-- Do not load tohtml.vim
	vim.g.loaded_2html_plugin = 1
end

local map_leader = function()
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
  vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end

local set_clipboard = function()
  if global.is_mac then
    vim.g.clipboard = {
      name = "macOS-clipboard",
      copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
      paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
      cache_enabled = 0,
    }
  elseif os.getenv("TMUX") then
    vim.g.clipboard = {
      name = "tmux-clipboard",
      copy = {
        ["+"] = "tmux set-buffer -w",
        ["*"] = "tmux set-buffer -w",
      },
      paste = {
        ["+"] = "tmux save-buffer -",
        ["*"] = "tmux save-buffer -",
      },
      cache_enabled = 0,
    }
  end
end


local load_core = function()
  disable_distribution_plugins()
  map_leader()
  set_clipboard()

  require("core.options")
  require("core.mappings")
  require("core.autocommands")
  require("core.plugins")

  vim.api.nvim_command("colorscheme catppuccin")
end

load_core()
