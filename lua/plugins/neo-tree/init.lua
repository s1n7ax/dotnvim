return {
	'nvim-neo-tree/neo-tree.nvim',
	keys = {
		{
			'<leader>e',
			':Neotree reveal<cr>',
			desc = 'Reveal NeoTree (curren buffer)',
		},
	},
	opts = {
		window = {
			mappings = { e = 'none' },
			position = 'float',
		},
		filesystem = {
			window = {
				mappings = {
					['/'] = 'noop',
					['z'] = 'noop',
				},
			},
		},
	},
}
