return {
	'mistweaverco/kulala.nvim',
	optional = true,
	keys = {
		{ '<leader>r', '', desc = '+Rest' },
		{
			'<leader>ra',
			function()
				require('kulala').run_all()
			end,
			desc = 'Send the request',
		},
		{
			'<leader>rs',
			function()
				require('kulala').run()
			end,
			desc = 'Send the request',
		},
		{
			'<leader>rt',
			function()
				require('kulala').toggle_view()
			end,
			desc = 'Toggle headers/body',
		},
		{
			'<leader>re',
			function()
				require('kulala').jump_prev()
			end,
			desc = 'Jump to previous request',
		},
		{
			'<leader>rn',
			function()
				require('kulala').jump_next()
			end,
			desc = 'Jump to next request',
		},
	},
	opts = {
		default_view = 'headers_body',
		icons = {
			inlay = {
				loading = '',
				done = '',
				error = '',
			},
			lualine = '🐼',
		},
	},
}
