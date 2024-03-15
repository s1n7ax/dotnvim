return {
	'phaazon/hop.nvim',
	branch = 'v2',
	keys = function()
		return {
			{ '<CR>', '<CMD>HopWord<CR>', 'Hop to word' },
			{ 'M', '<CMD>HopLine<CR>', 'Hop to line' },
		}
	end,
	opts = {
		keys = 'tnseriaoplfudhwyqzxcv',
	},
}
