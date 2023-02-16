return {
	"j-hui/fidget.nvim",
	lazy = true,
	event = "BufReadPost",
	config = function()
		require("fidget").setup({
			window = { blend = 0 },
		})
	end
}
