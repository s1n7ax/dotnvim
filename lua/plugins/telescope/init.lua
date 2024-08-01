return {
	'nvim-telescope/telescope.nvim',
	cmd = { 'Telescope' },
	opts = {
		defaults = {
			mappings = {
				i = {
					['<C-n>'] = 'move_selection_next',
					['<C-e>'] = 'move_selection_previous',
				},
			},
		},
	},
}
