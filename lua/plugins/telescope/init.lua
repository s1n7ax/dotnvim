return {
	'nvim-telescope/telescope.nvim',
	optional = true,
	keys = function()
		return {}
	end,
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
