return {
	"vim-test/vim-test",
	lazy = true,
	cmd = {
		"TestNearest",
		"TestFile",
		"TestSuite",
		"TestLast",
		"TestVisit",
	},
	config = function()
		vim.g["test#strategy"] = "toggleterm"
	end
}
