return {
	'stevearc/oil.nvim',
	keys = {
		{
			'<leader>e',
			'<cmd>Oil<cr>',
			desc = 'Open File Viewer',
		},
	},
	opts = {
		delete_to_trash = false,
		keymaps = {
			['<C-s>'] = false,
			['<C-h>'] = false,
			['<C-v>'] = 'actions.select_vsplit',
			['<C-x>'] = 'actions.select_split',
		},
	},
	dependencies = { 'nvim-tree/nvim-web-devicons' },
}
