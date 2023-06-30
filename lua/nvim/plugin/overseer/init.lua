return {
	'stevearc/overseer.nvim',
	event = 'VeryLazy',
	config = function()
		local wk = require('which-key')

		wk.register({
			['<leader>r'] = {
				name = 'Overseer',
				t = { '<CMD>OverseerToggle<CR>', 'Overseer Toggle' },
				r = {
					'<CMD>OverseerQuickAction open float<CR>',
					'Overseer Open in floating window',
				},
				n = { '<CMD>OverseerQuickAction<CR>', 'Overseer Actions' },
				s = { '<CMD>OverseerLoadBundle<CR>', 'Overseer Load' },
			},
		})

		require('overseer').setup()
	end,
}
