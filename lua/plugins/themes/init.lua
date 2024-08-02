local colorschemes = {
	{
		'shaunsingh/nord.nvim',
	},
	{
		'catppuccin/nvim',
		name = 'catppuccin',
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		opts = { highlight_groups = { Visual = { bg = '#373267' } } },
	},
	{
		'folke/tokyonight.nvim',
		opts = {
			transparent = false,
		},
	},
}

for _, colorscheme in ipairs(colorschemes) do
	colorscheme.optional = false
	colorscheme.priority = 1000
	colorscheme.lazy = false
end

return colorschemes
