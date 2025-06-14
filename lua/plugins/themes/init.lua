local colorschemes = {
	{
		'shaunsingh/nord.nvim',
	},
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		opts = {
			custom_highlights = function()
				return {
					Visual = { bg = '#373267' },
				}
			end,
		},
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine',
	},
	{
		'folke/tokyonight.nvim',
		opts = {
			transparent = false,
		},
	},
	{
		'sainnhe/everforest',
	},
	{
		'sainnhe/gruvbox-material',
	},
	{
		'vague2k/vague.nvim',
	},
	{
		'rebelot/kanagawa.nvim',
	},
	{
		'thesimonho/kanagawa-paper.nvim',
	},
}

for _, colorscheme in ipairs(colorschemes) do
	colorscheme.optional = false
	colorscheme.priority = 1000
	colorscheme.lazy = false
end

return colorschemes
