return function()
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
