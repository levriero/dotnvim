-- Map keys in normal mode
local nmap = function(keys, func, desc)
	vim.api.nvim_set_keymap("n", keys, func, { noremap = true, silent = true, nowait = true, desc = desc })
end

-- Command
nmap(";", ":")
nmap(":", ";")

-- Windows
nmap("<leader>-", "<C-W>s", "Split window horizonally")
nmap("<leader>\\", "<C-W>v", "Split window vertically")
nmap("<leader>=", "<C-w>=", "Make all windows equal")

-- Buffers
nmap("<tab>", "<C-w>w")
nmap("<S-tab>", "<C-w>W")

-- Bufferline
nmap("[b", "<cmd>BufferLineCyclePrev<cr>", "Prev buffer")
nmap("]b", "<cmd>BufferLineCycleNext<cr>", "Next buffer")


-- LSP
-- Mappings can be found in lua/plugins/lsp.lua

-- vim-slash
nmap("<Plug>(slash-after)", "zz")

-- Trouble
nmap("<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)")
nmap("<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics (Trouble)")
nmap("<leader>xL", "<cmd>TroubleToggle loclist<cr>", "Location List (Trouble)")
nmap("<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", "Quickfix List (Trouble)")

-- vim-test
nmap("<leader>tn", "<Cmd>TestNearest<CR>", "Test Nearest")
nmap("<leader>tf", "<Cmd>TestFile<CR>", "Test File")
nmap("<leader>ts", "<Cmd>TestSuite<CR>", "Test Suite")
nmap("<leader>tl", "<Cmd>TestLast<CR>", "Test Last")
nmap("<leader>tv", "<Cmd>TestVisit<CR>", "Test Visit")

-- Neotree
nmap("<leader>e", "<Cmd>NeoTreeFloatToggle<CR>", "Toggle Neotree in floating window")
