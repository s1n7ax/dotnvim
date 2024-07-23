return {
	'stevearc/overseer.nvim',
	keys = {
		{ '<leader>rt', '<CMD>OverseerToggle<CR>', desc = 'Overseer Toggle' },
		{
			'<leader>rr',
			'<CMD>OverseerQuickAction open float<CR>',
			desc = 'Overseer Open in floating window',
		},
		{ '<leader>rn', '<CMD>OverseerQuickAction<CR>', desc = 'Overseer Actions' },
		{ '<leader>rs', '<CMD>OverseerLoadBundle<CR>', desc = 'Overseer Load' },
		{ '<leader>re', '<CMD>OverseerRunCmd<CR>', desc = 'Overseer Run CMD' },
		{ '<leader>ro', '<CMD>OverseerRun<CR>', desc = 'Overseer Run' },
	},
	config = true,
}
