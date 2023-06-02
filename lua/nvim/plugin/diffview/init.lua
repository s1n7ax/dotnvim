return {
	'sindrets/diffview.nvim',
	dependencies = 'nvim-lua/plenary.nvim',
	keys = {
		'<leader>hd',
		'<leader>hD',
		{ '<leader>hd', mode = 'v' },
	},
	cmd = {
		'DiffviewOpen',
		'DiffviewFileHistory',
		'DiffviewToggleFiles',
		'DiffviewFocusFiles',
		'DiffviewRefresh',
		'DiffviewLog',
	},
	config = function()
		local wk = require('which-key')

		wk.register({
			name = 'Git',
			hd = { '<cmd>DiffviewFileHistory %<cr>', 'Git diff file' },
			hD = { '<cmd>DiffviewFileHistory<cr>', 'Git diff branch' },
		}, { prefix = '<leader>' })

		wk.register({
			name = 'Git',
			hd = { ':DiffviewFileHistory<cr>', 'Git diff selection' },
		}, { prefix = '<leader>', mode = 'v' })
	end,
}
