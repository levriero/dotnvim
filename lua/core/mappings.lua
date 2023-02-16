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
nmap("gd", vim.lsp.buf.definition, "LSP: [G]oto [D]efinition")
nmap("gr", "<Cmd>Telescope lsp_references<CR>", "LSP: [G]oto [R]eferences")
nmap("gI", vim.lsp.buf.implementation, "LSP: [G]oto [I]mplementation")
nmap("<leader>D", vim.lsp.buf.type_definition, "LSP: Type [D]efinition")
nmap("<leader>rn", vim.lsp.buf.rename, "LSP: [R]e[N]ame")
nmap("<leader>ca", vim.lsp.buf.code_action, "LSP: [C]ode [A]ction")
nmap("<leader>ds", "<Cmd>Telescope lsp_document_symbols<CR>", "LSP: [D]ocument [S]ymbols")
nmap("<leader>ws", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "LSP: [W]orkspace [S]ymbols")
nmap("K", vim.lsp.buf.hover, "LSP: Hover Documentation") -- see `:help K` for why this keymap
nmap("<C-k>", vim.lsp.buf.signature_help, "LSP: Signature Documentation")
nmap("<leader>fm", vim.lsp.buf.format, "LSP: Format current buffer")

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
