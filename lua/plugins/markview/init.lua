return {
	{
		'OXY2DEV/markview.nvim',
		ft = 'markdown',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		},
		opts = function()
			local presets = require('markview.presets')

			return {
				checkboxes = presets.checkboxes.nerd,
				headings = presets.headings.marker,
			}
		end,
	},
	-- Following dependencies are comming from lazyvim markdown extra
	{
		'iamcco/markdown-preview.nvim',
		optional = true,
		enabled = false,
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		optional = true,
		enabled = false,
	},
}
