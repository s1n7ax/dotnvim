return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
	},
	keys = {
		{
			'<leader>e',
			function()
				require('neo-tree.command')._command('reveal', 'toggle')
			end,
			desc = 'Reveal NeoTree (curren buffer)',
		},
	},
	opts = {
		popup_border_style = 'solid',
		window = {
			mappings = { e = 'none' },
			position = 'float',
		},
		filesystem = {
			window = {
				mappings = {
					['/'] = 'noop',
					['z'] = 'noop',
					['?'] = 'noop',
					['<c-x>'] = 'open_split',
					['<c-v>'] = 'open_vsplit',
				},
			},
		},
	},
}
