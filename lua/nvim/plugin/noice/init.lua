return {
	'folke/noice.nvim',
	event = 'VeryLazy',
	version = '1.10.2',
	dependencies = {
		'MunifTanjim/nui.nvim',
		'notify',
	},
	config = {
		lsp = {
			hover = {
				enabled = false,
			},
			signature = {
				enabled = false,
			},
		},
	},
}
