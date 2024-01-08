return {
	'sindrets/diffview.nvim',
	dependencies = 'nvim-lua/plenary.nvim',
	keys = {
		{
			'<leader>hd',
			'<cmd>DiffviewFileHistory %<cr>',
			desc = 'Git diff file',
			mode = 'n',
		},
		{
			'<leader>hD',
			'<cmd>DiffviewFileHistory<cr>',
			desc = 'Git diff branch',
			mode = 'n',
		},

		{
			'<leader>hd',
			':DiffviewFileHistory<cr>',
			desc = 'Git diff selection',
			mode = 'v',
		},
	},
	cmd = {
		'DiffviewOpen',
		'DiffviewFileHistory',
		'DiffviewToggleFiles',
		'DiffviewFocusFiles',
		'DiffviewRefresh',
		'DiffviewLog',
	},
}
