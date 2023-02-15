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
		local icons = {
			ui = require("modules.utils.icons").get("ui", true),
			misc = require("modules.utils.icons").get("misc", true)
		}

		-- Set up Lsp border
		require("lspconfig.ui.windows").default_options.border = "single"

		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local opts = {
			on_attach = function()
				-- Delegate to lsp_signature
				-- see `:h lsp_signature-full_configuration_(with_default_values)`
				require("lsp_signature").on_attach({
					bind = true,
					floating_window = true,
					fix_pos = true,
					hint_enable = true,
					hi_parameter = "LspSignatureActiveParameter",
					handler_opts = {
						border = "rounded"
					},
				})
			end,
			capabilities = capabilities,
		}

		-- Set up mason
		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_pending = icons.ui.Modified_alt,
					package_installed = icons.ui.Check,
					package_uninstalled = icons.misc.Ghost,
				}
			}
		})

		-- Ensure the following servers are installed
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls"
			}
		})

		-- Automatic server setup
		-- see `:help mason-lspconfig-automatic-server-setup`
		mason_lspconfig.setup_handlers({
			function(server_name) -- default handler
				require("lspconfig")[server_name].setup({
					capabilities = opts.capabilities,
					on_attach = opts.on_attach
				})
			end,

			lua_ls = function()
				local _opts = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
								disable = { "different-requires" },
							},
							workspace = {
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
								},
							},
							telemetry = { enable = false },
							-- Do not override treesitter lua highlighting with lua_ls's highlighting
							semantic = { enable = false },
						},
					},
				}
				local final_opts = vim.tbl_deep_extend("keep", _opts, opts)

				nvim_lsp.lua_ls.setup(final_opts)
			end
		})
	end
}
