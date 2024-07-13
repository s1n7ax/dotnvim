return {
	'folke/zen-mode.nvim',
	keys = { ',a', '<cmd>ZenMode<cr>', desc = 'Zen Mode' },
	opts = {
		window = {
			backdrop = 0.95,
			width = 90,
			options = {
				signcolumn = 'yes',
				number = true,
				relativenumber = true,
				-- cursorline = false, -- disable cursorline
				-- cursorcolumn = false, -- disable cursor column
				-- foldcolumn = "0", -- disable fold column
				-- list = false, -- disable whitespace characters
			},
		},
	},
}
