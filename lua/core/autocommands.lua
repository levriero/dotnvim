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

-- [[ Autoformat on save ]]
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	group = vim.api.nvim_create_augroup("AutoFormatOnSave", { clear = true }),
	callback = function()
		local buf_client = vim.lsp.buf_get_clients()[1]


		if buf_client ~= nil and buf_client.server_capabilities.documentFormattingProvider then
			vim.lsp.buf.format()
		end
	end
})
