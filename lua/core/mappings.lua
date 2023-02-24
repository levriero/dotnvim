-- Map keys in normal mode
local nmap = function(keys, func, desc)
	vim.api.nvim_set_keymap("n", keys, func, { noremap = true, silent = true, nowait = true, desc = desc })
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
nmap("<Plug>(slash-after)", "zz")

-- Trouble
nmap("gt", "<Cmd>TroubleToggle<CR>", "LSP: Toggle trouble list")
nmap("<leader>tr", "<Cmd>TroubleToggle lsp_references<CR>", "LSP: Show LSP references")
nmap("<leader>td", "<Cmd>TroubleToggle document_diagnostics<CR>", "LSP: Show document diagnostics")
nmap("<leader>tw", "<Cmd>TroubleToggle workspace_diagnostics<CR>", "LSP: Show workspace diagnostics")
nmap("<leader>tq", "<Cmd>TroubleToggle quickfix<CR>", "LSP: Show quickfix list")

-- vim-test
nmap("<leader>tn", "<Cmd>TestNearest<CR>", "Test Nearest")
nmap("<leader>tf", "<Cmd>TestFile<CR>", "Test File")
nmap("<leader>ts", "<Cmd>TestSuite<CR>", "Test Suite")
nmap("<leader>tl", "<Cmd>TestLast<CR>", "Test Last")
nmap("<leader>tv", "<Cmd>TestVisit<CR>", "Test Visit")
