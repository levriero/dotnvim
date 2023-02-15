return {
	"hrsh7th/nvim-cmp",
	lazy = true,
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-buffer" },
		{ "onsails/lspkind.nvim" },
		{ "saadparwaiz1/cmp_luasnip" },
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = function()
				local snippet_path = vim.fn.stdpath("config") .. "/snips/"

				if not vim.tbl_contains(vim.opt.rtp:get(), snippet_path) then
					vim.opt.rtp:append(snippet_path)
				end

				require("luasnip").config.set_config({
					history = true,
					updateevents = "TextChanged,TextChangedI",
					delete_check_events = "TextChanged,InsertLeave",
				})

				require("luasnip.loaders.from_lua").lazy_load()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_snipmate").lazy_load()
			end
		},
		{
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup()

				-- If you want insert `(` after select function or method item
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				local cmp = require("cmp")

				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		local icons = {
			kind = require("modules.utils.icons").get("kind"),
			type = require("modules.utils.icons").get("type"),
			cmp = require("modules.utils.icons").get("cmp"),
		}

		local border = function(hl)
			return {
				{ "╭", hl },
				{ "─", hl },
				{ "╮", hl },
				{ "│", hl },
				{ "╯", hl },
				{ "─", hl },
				{ "╰", hl },
				{ "│", hl },
			}
		end

		cmp.setup({
			window = {
				completion = {
					border = border("Normal"),
				},
				documentation = {
					border = border("CmpDocBorder"),
				},
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = lspkind.cmp_format({
								mode = "symbol_text",
								maxwidth = 50,
								symbol_map = vim.tbl_deep_extend("force", icons.kind, icons.type, icons.cmp),
							})(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })

					kind.kind = " " .. strings[1] .. " "
					kind.menu = "    (" .. strings[2] .. ")"

					return kind
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping.scroll_docs( -4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.close(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable( -1) then
						luasnip.jump( -1)
					else
						fallback()
					end
				end, { "i", "s" }),
			})
		})
	end
}
