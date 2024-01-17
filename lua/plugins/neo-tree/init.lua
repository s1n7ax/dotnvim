return {
	'nvim-neo-tree/neo-tree.nvim',
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
