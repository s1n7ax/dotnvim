return {
	's1n7ax/nvim-comment-frame',
	dependencies = {
		{ 'nvim-treesitter' },
	},
	keys = {
		{
			'<leader><leader>c',
			function()
				require('nvim-comment-frame').add_comment()
			end,
			desc = 'Add comment frame',
		},
		{
			'<leader><leader>CC',
			function()
				require('nvim-comment-frame').add_multiline_comment()
			end,
			'Add multiline comment frame',
		},
	},
	config = true,
}
