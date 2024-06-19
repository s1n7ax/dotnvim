return {
	'nvim-pack/nvim-spectre',
	keys = {
		{
			'<leader>is',
			function()
				require('spectre').open_file_search()
			end,
			desc = 'Current file search and replace',
		},
		{
			'<leader>iS',
			function()
				require('spectre').open_visual()
			end,
			desc = 'All file search and replace',
		},
	},
	dependencies = { 'nvim-lua/plenary.nvim' },
}
