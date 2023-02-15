local global = require("core.global")
local data_dir = global.data_dir
local Lazy = {}

print(vim.inspect(data_dir))

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
    performance = {
      cache = {
        enabled = true,
      },
      reset_packpath = true, -- reset the package path to improve startup time
      rtp = {
        reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
        ---@type string[]
        paths = {}, -- add any custom paths here that you want to includes in the rtp
        ---@type string[] list any plugins you want to disable here
        disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
        },
      },
    },
  }

  if not vim.loop.fs_stat(lazy_path) then
    local lazy_repo = "https://github.com/folke/lazy.nvim.git"

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
