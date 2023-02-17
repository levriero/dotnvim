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

		local on_attach = function(_client, bufnr)
			local telescope = require("telescope.builtin")

			-- Mappings.
			local lsp_map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { noremap = true, silent = true, buffer = bufnr, desc = "LSP: " .. desc })
			end

			-- See `:help vim.lsp.*` for documentation on any of the below functions
			lsp_map("K", vim.lsp.buf.hover, "Hover Documentation")
			lsp_map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

			lsp_map("gd", vim.lsp.buf.definition, "Go to Definition")
			lsp_map("gI", vim.lsp.buf.implementation, "Go to Implementation")
			lsp_map("gr", telescope.lsp_references, "Go to References")

			lsp_map("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
			lsp_map("<leader>rn", vim.lsp.buf.rename, "Rename")
			lsp_map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
			lsp_map("<leader>fm", vim.lsp.buf.format, "Format Buffer")
			lsp_map("<leader>ds", telescope.lsp_document_symbols, "Document Symbols")
			lsp_map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "Workspace Symbols")

			-- [[ lsp-signature ]]
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
		end

		local opts = {
			on_attach = on_attach,
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
