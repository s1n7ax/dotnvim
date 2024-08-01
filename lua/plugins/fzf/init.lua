return {
	'ibhagwan/fzf-lua',
	cmd = { 'FzfLua' },
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
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = function()
		return {
			grep = {
				actions = {
					['ctrl-g'] = { require('fzf-lua.actions').toggle_ignore },
				},
			},
			winopts = {
				preview = {
					delay = 0,
				},
			},
			fzf_bin = 'sk',
			keymap = {
				fzf = {
					['ctrl-e'] = 'up',
					['ctrl-n'] = 'down',
				},
			},
		}
	end,
}
