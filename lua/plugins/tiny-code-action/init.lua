return {
	'rachartier/tiny-code-action.nvim',
	keys = {
		{
			'<leader>aa',
			function()
				require('tiny-code-action').code_action()
			end,
			desc = 'Code Action',
		},
	},
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope.nvim' },
	},
	event = 'LspAttach',
	config = true,
}
