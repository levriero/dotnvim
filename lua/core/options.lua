vim.o.encoding = "utf-8"
vim.o.clipboard = "unnamedplus"

vim.o.termguicolors = true
vim.o.guicursor = require("core.global").cursor_style

vim.o.number = true
vim.o.relativenumber = true

vim.o.autoindent = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.infercase = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.completeopt = "menuone,noselect"
vim.o.updatetime = 50

vim.o.timeout = true
vim.o.timeoutlen = 300

vim.o.laststatus = 3

vim.o.showmode = false

vim.o.wrap = false

vim.o.cursorline = true

vim.o.fillchars = "eob: " -- hide indicators for empty lines at the end of a buffer
