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
	callback = function()
		vim.o.guicursor = "a:ver25-blinkon250"
	end
})

-- [[ Set word wrap options for markdown files ]]
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("MarkdownWrapOptions", { clear = true }),
	pattern = "markdown",
	callback = function()
		vim.schedule(function()
			-- Wrap text
			vim.o.wrap = true

			-- Every wrapped line will continue visually indented
			vim.o.breakindent = true

			-- Wrap long lines at a character in 'breakat' rather
			-- than at the last character that fits the screen
			vim.o.linebreak = true

			-- See `:h fo-table`
			vim.o.formatoptions = "l"

			-- Enable spell checking
			vim.o.spell = true
			vim.o.spelllang = "en"
		end)
	end
})
