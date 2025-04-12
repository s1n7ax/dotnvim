return {
	'folke/zen-mode.nvim',
	optional = true,
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
			options = {
				signcolumn = 'yes',
				number = true,
				relativenumber = true,
			},
		},

		plugins = {
			alacritty = {
				enabled = true,
				font = '24',
			},
		},
	},
}
