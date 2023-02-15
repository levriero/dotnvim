local global = require("core.global")

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
  map_leader()
  set_clipboard()

  require("core.options")
  require("core.mappings")
  require("core.autocommands")
  require("core.plugins")
end

load_core()
