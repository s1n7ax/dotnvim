return {
	'ibhagwan/fzf-lua',
	optional = true,
	keys = {
		{
			',,',
			function()
				require('fzf-lua').files()
			end,
			desc = 'Find Files',
		},
		{
			'<leader>n',
			function()
				require('fzf-lua').buffers()
			end,
			desc = 'Find Buffers',
		},
		{
			'<leader>/',
			function()
				require('fzf-lua').live_grep()
			end,
			desc = 'Find Text',
		},
		{
			',.',
			function()
				require('fzf-lua').lsp_live_workspace_symbols()
			end,
			desc = 'Find Workspace Symbol',
		},
	},
	opts = {
		previewers = {
			builtin = {
				-- disable treesitter for files bigger than 100KB
				syntax_limit_b = 1024 * 100, -- 100KB
			},
		},

		oldfiles = {
			cwd_only = true,
			stat_file = true,
			include_current_session = true,
		},
		winopts = {
			preview = {
				delay = 70,
			},
		},
		keymap = {
			fzf = {
				['ctrl-e'] = 'up',
				['ctrl-n'] = 'down',
			},
		},
	},
}
