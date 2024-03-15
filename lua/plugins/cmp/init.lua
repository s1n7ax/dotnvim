-- stylua: ignore start
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })

vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
-- stylua: ignore end

return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'onsails/lspkind.nvim',
	},
	opts = function(_, opts)
		local cmp = require('cmp')

		opts.experimental.ghost_text = false

		opts.mapping = {
			['<C-e>'] = cmp.mapping.select_prev_item({
				behavior = cmp.SelectBehavior.Insert,
			}),
			['<C-n>'] = cmp.mapping.select_next_item({
				behavior = cmp.SelectBehavior.Insert,
			}),
			['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
			['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
			['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			['<C-y>'] = cmp.config.disable,
			['<C-l>'] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			['<CR>'] = cmp.mapping.confirm({ select = false }),
		}

		opts.completion = {
			completeopt = 'menu,menuone',
		}

		opts.window = {
			completion = {
				winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
				col_offset = -3,
				side_padding = 0,
			},
		}

		opts.formatting = {
			fields = { 'kind', 'abbr', 'menu' },
			format = function(entry, vim_item)
				local kind = require('lspkind').cmp_format({
					mode = 'symbol_text',
					maxwidth = 50,
				})(entry, vim_item)
				local strings = vim.split(kind.kind, '%s', { trimempty = true })
				kind.kind = ' ' .. (strings[1] or '') .. ' '
				kind.menu = '    ' .. (strings[2] or '')

				return kind
			end,
		}
		opts.sources = {

			{
				name = 'nvim_lsp_signature_help',
				priority = 100,
				group_index = 1,
			},
			{
				name = 'nvim_lsp',
				priority = 100,
				group_index = 1,
			},
			{
				name = 'nvim_lua',
				priority = 100,
				group_index = 1,
			},
			{
				name = 'path',
				priority = 90,
				group_index = 2,
			},
			{
				name = 'luasnip',
				keyword_length = 3,
				max_item_count = 3,
				autocomplete = false,
				priority = 80,
				group_index = 3,
			},
			{
				name = 'spell',
				keyword_length = 3,
				max_item_count = 3,
				autocomplete = false,
				priority = 70,
				group_index = 3,
			},
			{
				name = 'buffer',
				keyword_length = 3,
				autocomplete = false,
				max_item_count = 3,
				priority = 50,
				group_index = 3,
			},
		}

		return opts
	end,
}
