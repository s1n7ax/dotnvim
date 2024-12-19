return {
	'saghen/blink.cmp',
	build = 'nix run .#build-plugin',
	optional = true,
	opts = {
		signature = { enabled = true },
		keymap = {
			['<c-e>'] = { 'select_prev', 'fallback' },
			['<cr>'] = { 'select_and_accept', 'fallback' },
		},
	},
}
