return {
	'mistricky/codesnap.nvim',
	build = 'make',
	cmd = { 'CodeSnap', 'CodeSnapASCII' },
	opts = {
		has_breadcrumbs = true,
		watermark = '',
		bg_x_padding = 15,
		bg_y_padding = 15,
	},
}
