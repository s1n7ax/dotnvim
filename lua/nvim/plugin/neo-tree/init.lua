return {
	'nvim-neo-tree/neo-tree.nvim',
	dependencies = {
		'window-picker',
		'nvim-lua/plenary.nvim',
		'kyazdani42/nvim-web-devicons',
		'MunifTanjim/nui.nvim',
	},
	branch = 'v2.x',
	keys = ',,',
	config = function()
		local HighlightGroups =
			require('nvim.utils.nvim.highlighting.highlight-groups')
		local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')
		local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')
		local Variable = require('nvim.utils.nvim.variable')
		local wk = require('which-key')

		local theme = ThemeManager.get_theme()

		local neotree_highlights = HighlightGroups({
			NeoTreeGitAdded = { guifg = theme.bright.green },
			NeoTreeGitStaged = { guifg = theme.bright.green },

			NeoTreeGitRenamed = { guifg = theme.bright.cyan },
			NeoTreeGitConflict = { guifg = theme.bright.magenta },

			NeoTreeGitDeleted = { guifg = theme.bright.red },
			NeoTreeModified = { guifg = theme.bright.red },
			NeoTreeGitUnstaged = { guifg = theme.bright.red },
			NeoTreeGitUntracked = { guifg = theme.bright.red },

			NeoTreeGitModified = { guifg = theme.bright.yellow },
			NeoTreeGitModified_35 = { guifg = theme.bright.yellow },
			NeoTreeGitModified_60 = { guifg = theme.normal.yellow },
			NeoTreeGitModified_68 = { guifg = theme.normal.yellow },
		})

		Highlighter:new():add(neotree_highlights):register_highlights()

		Variable.g({ { neo_tree_remove_legacy_commands = true } })

		require('neo-tree').setup({
			window = {
				mappings = {
					['[c'] = 'prev_git_modified',
					[']c'] = 'next_git_modified',
					['<esc>'] = 'revert_preview',
					['<c-c>'] = 'close_window',
				},
			},
			filesystem = {
				window = {
					mappings = {
						['o'] = 'open',
						['e'] = 'none',
						['<space>'] = false,
					},
					position = 'float',
				},
				renderers = {
					directory = {
						{
							'icon',
							default = '',
							folder_closed = ' ',
							folder_open = ' ',
							padding = ' ',
						},
						{ 'current_filter' },
						{ 'name' },
						{
							'clipboard',
							highlight = 'NeoTreeDimText',
						},
						{ 'diagnostics', errors_only = true },
					},
				},
			},
			default_component_configs = {
				modified = {
					symbol = '',
					highlight = 'NeoTreeModified',
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
					highlight = 'NeoTreeFileName',
				},
				git_status = {
					symbols = {
						-- Change type
						added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = '✖', -- this can only be used in the git_status source
						renamed = '', -- this can only be used in the git_status source
						-- Status type
						untracked = '',
						ignored = '',
						unstaged = '',
						staged = '',
						conflict = '',
					},
				},
			},
		})

		wk.register({
			[',,'] = {
				'<cmd>NeoTreeRevealToggle<cr>',
				'Toggle open current file in file tree',
			},
		})
	end,
}
