return {
	'saghen/blink.cmp',
	enabled = false,
	opts = {
		signature = { enabled = true },
		sources = {
			compat = {},
			default = { 'lsp', 'path', 'snippets', 'buffer' },
			cmdline = {},
		},
		keymap = {
			preset = 'enter',
			['<c-n>'] = { 'select_next', 'fallback' },
			['<c-e>'] = { 'select_prev', 'fallback' },
			['<cr>'] = { 'select_and_accept', 'fallback' },
		},
	},
}
