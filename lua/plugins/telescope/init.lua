return {
	'nvim-telescope/telescope.nvim',
	opts = function(_, opts)
		return {
			defaults = {
				-- Default configuration for telescope goes here:
				-- config_key = value,
				mappings = {
					i = {
						['<C-n>'] = 'move_selection_next',
						['<C-e>'] = 'move_selection_previous',
					},
				},
			},
		}
	end,
}
