return {
	'folke/zen-mode.nvim',
	keys = ',a',
	config = function()
		local wk = require('which-key')

		require('zen-mode').setup({
			window = {
				width = 90,
				height = 1,
			},
		})

		wk.register({
			[',a'] = { '<cmd>ZenMode<CR>', 'Focus mode' },
		})
	end,
}
