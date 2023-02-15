local autocmd = {}
local cmd = vim.api.nvim_command

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
  pattern = "*",
  callback = function() 
    vim.highlight.on_yank()
  end
})
