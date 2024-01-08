return {
	'sindrets/winshift.nvim',
	keys = {
		{ '<c-w>m', '<cmd>WinShift<cr>', 'Shift window mode' },
	},
	opts = {
		keymaps = {
			disable_defaults = true,
			win_move_mode = {
				['m'] = 'left',
				['n'] = 'down',
				['e'] = 'up',
				['i'] = 'right',
				['M'] = 'far_left',
				['N'] = 'far_down',
				['E'] = 'far_up',
				['I'] = 'far_right',
				['<left>'] = 'left',
				['<down>'] = 'down',
				['<up>'] = 'up',
				['<right>'] = 'right',
				['<S-left>'] = 'far_left',
				['<S-down>'] = 'far_down',
				['<S-up>'] = 'far_up',
				['<S-right>'] = 'far_right',
			},
		},
	},
}
