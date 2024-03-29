return {
	'hoob3rt/lualine.nvim',
	event = 'VeryLazy',
	dependencies = {
		'kyazdani42/nvim-web-devicons',
		'folke/tokyonight.nvim',
	},
	config = function()
		-- Bubbles config for lualine
		-- Author: lokesh-krishna
		-- MIT license, see LICENSE for more details.

		-- stylua: ignore
		require('lualine').setup {
			options = {
				theme = 'tokyonight',
				component_separators = '|',
				section_separators = { left = '', right = '' },
			},
			sections = {
				lualine_a = {
					{ 'mode', separator = { left = '' }, right_padding = 2 },
				},
				lualine_b = { 'filename', 'branch' },
				lualine_c = { 'fileformat' },
				lualine_x = {},
				lualine_y = { 'filetype', 'progress' },
				lualine_z = {
					{ 'location', separator = { right = '' }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { 'filename' },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { 'location' },
			},
			tabline = {},
			extensions = {},
		}
	end,
}
