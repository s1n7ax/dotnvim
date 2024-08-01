return {
	'mistweaverco/kulala.nvim',
	optional = true,
	keys = {
		{ '<leader>r', '', desc = '+Rest' },
		{
			'<leader>rs',
			require('kulala').run,
			desc = 'Send the request',
		},
		{
			'<leader>rt',
			require('kulala').toggle_view,
			desc = 'Toggle headers/body',
		},
		{
			'<leader>re',
			require('kulala').jump_prev,
			desc = 'Jump to previous request',
		},
		{
			'<leader>rn',
			require('kulala').jump_next,
			desc = 'Jump to next request',
		},
	},
	opts = {},
}
