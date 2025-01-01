local keys = {
	'<C-u>',
	'<C-d>',
	'zt',
	'zz',
	'zb',
}

return {
	'karb94/neoscroll.nvim',
	enabled = true,
	keys = keys,
	opts = {
		easing = 'quadratic',
		hide_cursor = false,
		mappings = keys,
	},
}
