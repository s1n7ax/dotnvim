return {
	'saghen/blink.cmp',
	optional = true,
	enabled = true,
	-- dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
	opts = {
		snippets = { preset = 'luasnip' },
		signature = { enabled = true },
		sources = {
			default = { 'lsp', 'path', 'buffer' },

			transform_items = function(_, items)
				return vim.tbl_filter(function(item)
					return item.kind
						~= require('blink.cmp.types').CompletionItemKind.Snippet
				end, items)
			end,
		},

		keymap = {
			preset = 'none',
			['<c-space>'] = { 'show' },
			['<c-n>'] = { 'select_next', 'snippet_forward', 'fallback' },
			['<c-e>'] = { 'select_prev', 'snippet_backward', 'fallback' },
			['<cr>'] = { 'select_and_accept', 'fallback' },
		},
	},
}
