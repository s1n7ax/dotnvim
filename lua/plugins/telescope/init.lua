return {
	'nvim-telescope/telescope.nvim',
	keys = function()
		return {}
	end,
	opts = function()
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
