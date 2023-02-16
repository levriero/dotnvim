return {
	"ggandor/leap.nvim",
	lazy = true,
	event = "BufReadPost",
	dependencies = {
		{ "tpope/vim-repeat" }
	},
	config = function()
		require("leap").add_default_mappings()
	end
}
