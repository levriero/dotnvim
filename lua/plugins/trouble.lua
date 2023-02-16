return {
	"folke/trouble.nvim",
	lazy = true,
	cmd = {
		"Trouble",
		"TroubleToggle",
		"TroubleRefresh"
	},
	config = function()
		require("trouble").setup({
			mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
		})
	end
}
