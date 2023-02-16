local global = require("core.global")

vim.o.encoding = "utf-8"
vim.o.clipboard = "unnamedplus"

vim.o.termguicolors = true
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20" -- display cursor as single line when in insert mode

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
-- You will feel delay when you input <Space> at lazygit interface if you set it a positive value like 300(ms).
vim.o.timeoutlen = 300

if global.is_mac then
	vim.g.python3_host_prog = os.getenv("HOMEBREW_PREFIX") .. "/bin/python3"

	if vim.fn.executable("volta") == 1 then
		vim.g.node_host_prog = vim.fn.trim(vim.fn.system("volta which neovim-node-host"))
	end
end
