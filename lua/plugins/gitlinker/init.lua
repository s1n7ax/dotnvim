return {
	{
		'linrongbin16/gitlinker.nvim',
		cmd = { 'GitLink' },
		config = function()
			require('gitlinker').setup()
		end,
	},
}
