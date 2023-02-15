return {
	"neovim/nvim-lspconfig",
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "ray-x/lsp_signature.nvim" },
	},
	config = function()
		local nvim_lsp = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		-- Enable these language servers.
		-- Additional override configuration will be passed 
		-- to the settings field in the server config.
		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					}
				}
			}
		}

		-- Delegate on_attach to lsp_signature
		local on_attach = function()
			require("lsp_signature").on_attach({
				bind = true,
				floating_window = true,
				fix_pos = true,
				hint_enable = true,
				hi_parameter = "Search",
				handler_opts = { border = "rounded" },
			})
		end

		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		
		-- Set up mason and ensure servers are installed and configured
		mason.setup()
		mason_lspconfig.setup({ ensure_installed = vim.tbl_keys(servers) })
		mason_lspconfig.setup_handlers({
			function(server)
				nvim_lsp[server].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server]
				})
			end
		})
	end
}
