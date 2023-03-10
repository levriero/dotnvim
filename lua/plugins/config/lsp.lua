return function()
	local nvim_lsp = require("lspconfig")
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")
	local icons = {
		ui = require("modules.utils.icons").get("ui", true),
		misc = require("modules.utils.icons").get("misc", true),
		diagnostics = require("modules.utils.icons").get("diagnostics", true),
	}

	-- Configure diagnostics globally
	-- See `:help vim.diagnostic.config`
	vim.diagnostic.config({
		virtual_text = { spacing = 4, prefix = "●" },
		severity_sort = true,
	})

	-- Change diagnostic symbols in the sign column
	local signs = {
		Error = icons.diagnostics.Error,
		Warn = icons.diagnostics.Warning,
		Hint = icons.diagnostics.Hint,
		Info = icons.diagnostics.Information
	}
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type

		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	local diagnostic_goto = function(direction, severity)
		local go_to
		severity = severity and vim.diagnostic.severity[severity] or nil

		if direction == "next" then
			go_to = vim.diagnostic.goto_next
		else
			go_to = vim.diagnostic.goto_prev
		end

		return function()
			go_to({ severity = severity })
		end
	end

	-- Add additional capabilities supported by nvim-cmp
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	local on_attach = function(_, bufnr)
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
		lsp_map("<leader>fm", function() vim.lsp.buf.format({ async = true }) end, "Format Buffer")
		lsp_map("<leader>ds", telescope.lsp_document_symbols, "Document Symbols")
		lsp_map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "Workspace Symbols")

		lsp_map("]d", diagnostic_goto("next"), "Next Diagnostic")
		lsp_map("[d", diagnostic_goto("prev"), "Prev Diagnostic")
		lsp_map("]e", diagnostic_goto("next", "ERROR"), "Next Error")
		lsp_map("[e", diagnostic_goto("prev", "ERROR"), "Prev Erorr")
		lsp_map("]w", diagnostic_goto("next", "WARN"), "Next Warning")
		lsp_map("[w", diagnostic_goto("prev", "WARN"), "Prev Warning")
	end

	-- Border settings
	local border = require("modules.utils").border_highlight("FloatBorder", "single")
	local handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
	}

	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
		handlers = handlers
	}

	-- Set up mason
	mason.setup({
		ui = {
			border = "single",
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
		-- default handler
		function(server_name)
			nvim_lsp[server_name].setup({
				capabilities = opts.capabilities,
				on_attach = opts.on_attach,
				handlers = opts.handlers,
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
