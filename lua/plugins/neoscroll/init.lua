return {
	'karb94/neoscroll.nvim',
	event = 'VeryLazy',
	opts = {
		easing = 'quadratic',
		hide_cursor = false,
		mappings = { -- Keys to be mapped to their corresponding default scrolling animation
			'<C-u>',
			'<C-d>',
			-- '<C-b>',
			-- '<C-f>',
			-- '<C-y>',
			-- '<C-e>',
			'zt',
			'zz',
			'zb',
		},
	},
}
