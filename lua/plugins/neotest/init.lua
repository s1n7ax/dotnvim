return {
	'nvim-neotest/neotest',
	optional = true,
	keys = {
		{
			'<leader>tr',
			function()
				vim.print('executed')
			end,
		},
	},
}
