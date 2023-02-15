local keymap = vim.keymap
local opts = { noremap = true, silent = true, nowait = true }

keymap.set("n", ";", ":", opts)
keymap.set("n", ":", ";", opts)

keymap.set("n", "<tab>", "<C-w>w", opts)
keymap.set("n", "<S-tab>", "<C-w>W", opts)

keymap.set("n", "<leader>=", "<C-w>=", { noremap = true, silent = true, nowait = true, desc = "Make all windows equal" })
keymap.set("n", "<leader>-", "<C-w>|", { noremap = true, silent = true, nowait = true, desc = "Maximize current window" })
