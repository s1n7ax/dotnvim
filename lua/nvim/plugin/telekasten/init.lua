return {
	'renerocksai/telekasten.nvim',
	event = 'VeryLazy',
	dependencies = {
		'nvim-telescope/telescope.nvim',
		'renerocksai/calendar-vim',
	},
	config = function()
		require('telekasten').setup({
			home = vim.fn.expand('~/Notes'), -- Put the name of your notes directory here
		})
	end,
}
