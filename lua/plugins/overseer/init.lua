return {
	'stevearc/overseer.nvim',
	event = 'VeryLazy',
	version = 'v1.1.1',
	config = function()
		local wk = require('which-key')

		wk.register({
			r = {
				name = 'Overseer',
				t = { '<CMD>OverseerToggle<CR>', 'Overseer Toggle' },
				r = {
					'<CMD>OverseerQuickAction open float<CR>',
					'Overseer Open in floating window',
				},
				n = { '<CMD>OverseerQuickAction<CR>', 'Overseer Actions' },
				s = { '<CMD>OverseerLoadBundle<CR>', 'Overseer Load' },
				e = { '<CMD>OverseerRunCmd<CR>', 'Overseer Run CMD' },
				o = { '<CMD>OverseerRun<CR>', 'Overseer Run' },
			},
		}, {
			prefix = '<leader>',
		})

		require('overseer').setup()
	end,
}
