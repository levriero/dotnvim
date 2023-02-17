-- Map keys in normal mode
local nmap = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { noremap = true, silent = true, nowait = true, desc = desc })
end

nmap(";", ":")
nmap(":", ";")

nmap("<tab>", "<C-w>w")
nmap("<S-tab>", "<C-w>W")

nmap("<leader>=", "<C-w>=", "Make all windows equal")
nmap("<leader>-", "<C-w>|", "Maximize current window")

-- LSP
-- Mappings can be found in lua/plugins/lsp.lua

-- vim-slash
vim.api.nvim_set_keymap("n", "<Plug>(slash-after)", "zz", {})

-- nvim-tree
nmap("<leader>e", vim.cmd.NvimTreeFindFileToggle, "[E]xplore Files")

-- Trouble
nmap("gt", "<Cmd>TroubleToggle<CR>", "LSP: Toggle trouble list")
nmap("<leader>tr", "<Cmd>TroubleToggle lsp_references<CR>", "LSP: Show LSP references")
nmap("<leader>td", "<Cmd>TroubleToggle document_diagnostics<CR>", "LSP: Show document diagnostics")
nmap("<leader>tw", "<Cmd>TroubleToggle workspace_diagnostics<CR>", "LSP: Show workspace diagnostics")
nmap("<leader>tq", "<Cmd>TroubleToggle quickfix<CR>", "LSP: Show quickfix list")

-- vim-test
nmap("<leader>tn", vim.cmd.TestNearest, "[T]est [N]earest")
nmap("<leader>tf", vim.cmd.TestFile, "[T]est [F]ile")
nmap("<leader>ts", vim.cmd.TestSuite, "[T]est [S]uite")
nmap("<leader>tl", vim.cmd.TestLast, "[T]est [L]ast")
nmap("<leader>tv", vim.cmd.TestVisit, "[T]est [V]isit")
