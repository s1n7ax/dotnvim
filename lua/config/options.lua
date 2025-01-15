local format = require('utils.lsp.diagnostic.format')
vim.opt.listchars = {
	nbsp = '+',
	tab = '> ',
}

vim.o.report = 10000000
vim.o.pumblend = 0
vim.o.hlsearch = false
vim.o.scrolloff = 10
vim.o.colorcolumn = '80'
vim.o.splitkeep = 'cursor'
vim.o.termguicolors = true
vim.o.foldlevel = 1000
vim.o.signcolumn = 'yes:2'

vim.diagnostic.config({
	virtual_text = false,
	float = {
		format = function(diagnostic)
			return format(diagnostic)
		end,
	},
})

-- I'm using nixos so mason executables are not working.
-- By default mason will not be used to install some of the packages
vim.g.use_mason_for_ls = false

-- disable annoying keymaps added by neovim in sql files
vim.g.omni_sql_no_default_maps = false

vim.g.lazyvim_cmp = 'nvim-cmp'

-- disable annoying animations
vim.g.snacks_animate = false

if vim.g.neovide then
	vim.o.guifont = 'Maple Mono NF:h17'
	vim.opt.linespace = 0
	vim.g.neovide_scale_factor = 1.0
	vim.g.neovide_text_gamma = 0.0
	vim.g.neovide_text_contrast = 0.5
	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0

	-- Helper function for transparency formatting
	local alpha = function()
		return string.format('%x', math.floor((255 * vim.g.transparency) or 0.8))
	end
	vim.g.transparency = 0.8
	vim.g.neovide_background_color = '#0f1117' .. alpha()

	vim.g.neovide_window_blurred = true
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0

	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 10
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 5
	vim.g.neovide_transparency = 0.8
	vim.g.neovide_show_border = true
	vim.g.neovide_position_animation_length = 0.15
	vim.g.neovide_scroll_animation_length = 0.3
	vim.g.neovide_scroll_animation_far_lines = 1
	vim.g.neovide_hide_mouse_when_typing = false
	vim.g.neovide_underline_stroke_scale = 1.0
	vim.g.neovide_theme = 'auto'
	vim.g.experimental_layer_grouping = false
	vim.g.neovide_refresh_rate = 120
	vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_no_idle = true
	vim.g.neovide_confirm_quit = true
	vim.g.neovide_detach_on_quit = 'always_quit'
	vim.g.neovide_fullscreen = true
	vim.g.neovide_remember_window_size = true
end
