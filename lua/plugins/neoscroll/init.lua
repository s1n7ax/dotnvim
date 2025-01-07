local keys = {
	'<C-u>',
	'<C-d>',
	'zt',
	'zz',
	'zb',
}

return {
	'karb94/neoscroll.nvim',
	enabled = not vim.g.neovide,
	keys = keys,
	opts = {
		easing = 'quadratic',
		hide_cursor = false,
		mappings = keys,
	},
}
