return {
	"dstein64/nvim-scrollview",
	lazy = true,
	event = "BufReadPost",
	config = function()
		-- see `:help nvim-scrollview`
		require("scrollview").setup({
			current_only = true
		})
	end
}
