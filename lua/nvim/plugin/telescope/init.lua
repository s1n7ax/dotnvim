return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-ui-select.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	cmd = 'Telescope',
	keys = {
		'<leader>nn',
		'<leader>ne',
		'<leader>nt',
		'<leader>ni',
		'<leader>ns',
		'<leader>no',
		{ '<c-r>', mode = 'i' },
	},
	config = function()
		local telescope = require('telescope')
		local action = require('telescope.actions')

		telescope.setup({
			defaults = {
				prompt_prefix = '   ',
				selection_caret = '  ',
				entry_prefix = '   ',
				path_display = { 'truncate' },
				file_ignore_patterns = {
					'dist',
					'target',
					'node_modules',
					'pack/plugins',
				},

				mappings = {
					i = {
						['<C-t>'] = action.close,
						['<C-h>'] = action.which_key,
						['<C-n>'] = action.move_selection_next,
						['<C-e>'] = action.move_selection_previous,
						['<C-c>'] = action.close,
						['<esc>'] = action.close,
					},
				},
			},
			extensions = {
				recent_files = {
					only_cwd = true,
				},
			},
		})

		-- load plugins
		telescope.load_extension('fzf')
		telescope.load_extension('ui-select')

		-- load other configurations
		require('nvim.plugin.telescope.keymaps')
		--  require('nvim.plugin.telescope.ui')
	end,
}
