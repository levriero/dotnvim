-- [[ Configure and install plugins ]]
require("lazy").setup({
	require("plugins/tokyonight"),

	require("plugins/which-key"),

	require("plugins/telescope"),

	require("plugins/gitsigns"),

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	require("plugins/todo-comments"),

	require("plugins/cmp"),
	require("plugins/lspconfig"),
	require("plugins/conform"),
	require("plugins/treesitter"),
})

-- vim: ts=2 sts=2 sw=2 et
