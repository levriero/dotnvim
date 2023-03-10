-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end
})

-- [[ Remove trailing whitespace ]]
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("RemoveTrailingWhitespace", { clear = true }),
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- [[ Restore cursor style after exiting or suspending, and resuming Nvim ]]
local restore_cursor_augroup = vim.api.nvim_create_augroup("RestoreCursorStyle", { clear = true })

vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
	group = restore_cursor_augroup,
	pattern = "*",
	callback = function()
		vim.o.guicursor = require("core.global").cursor_style
	end
})

vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
	group = restore_cursor_augroup,
	pattern = "*",
	callback = function ()
		vim.o.guicursor = "a:ver25-blinkon250"
	end
})
