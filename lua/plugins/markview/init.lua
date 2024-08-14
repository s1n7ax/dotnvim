return {
	{
		'OXY2DEV/markview.nvim',
		ft = 'markdown',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		},
	},
	-- Following dependencies are comming from lazyvim markdown extra
	{
		'iamcco/markdown-preview.nvim',
		optional = true,
		enabled = false,
	},
	{
		'MeanderingProgrammer/markdown.nvim',
		optional = true,
		enabled = false,
	},
}
