local priority = 1000

return {
	{
		'neanias/everforest-nvim',
		name = 'everforest',
		lazy = false,
		priority = priority,
		opts = {
			transparent_background_level = 2,
		},
	},
	{
		'rose-pine/neovim',
		lazy = false,
		priority = priority,
		name = 'rose-pine',
		opts = {
			highlight_groups = {
				Visual = { bg = '#373267' },
			},
		},
	},
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = priority,
		opts = {
			transparent = true,
			styles = {
				sidebars = 'transparent',
				floats = 'transparent',
			},
		},
	},
}
