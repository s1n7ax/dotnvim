return {
	{
		'supermaven-inc/supermaven-nvim',
		event = 'VeryLazy',
		opts = {
			keymaps = {
				accept_suggestion = '<C-o>',
			},
			color = {
				suggestion_color = '#ffffff',
				cterm = 244,
			},
			disable_inline_completion = false,
			disable_keymaps = false,
		},
	},
}
