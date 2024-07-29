return {
	'folke/zen-mode.nvim',
	keys = {
		{
			',a',
			function()
				require('zen-mode').toggle()
			end,
			desc = 'Zen Mode',
		},
	},
	opts = {
		window = {
			backdrop = 0.5,
			width = 100,
			options = {
				signcolumn = 'yes',
				number = true,
				relativenumber = true,
			},
		},
	},
}
