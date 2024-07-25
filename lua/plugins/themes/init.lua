local colorschemes = {
	{
		'shaunsingh/nord.nvim',
	},
	{
		'neanias/everforest-nvim',
		name = 'everforest',
		opts = { transparent_background_level = 2 },
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		opts = { highlight_groups = { Visual = { bg = '#373267' } } },
	},
	{
		'folke/tokyonight.nvim',
		opts = {
			transparent = true,
			styles = {
				sidebars = 'transparent',
				floats = 'transparent',
			},
		},
	},
}

for _, colorscheme in ipairs(colorschemes) do
	colorscheme.priority = 1000
	colorscheme.lazy = false
end

return colorschemes
