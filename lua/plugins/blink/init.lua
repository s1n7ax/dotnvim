return {
	'saghen/blink.cmp',
	opts = {
		signature = { enabled = true },
		keymap = {
			preset = 'none',
			['<c-n>'] = { 'select_next', 'fallback' },
			['<c-e>'] = { 'select_prev', 'fallback' },
			['<cr>'] = { 'select_and_accept', 'fallback' },
		},
	},
}
