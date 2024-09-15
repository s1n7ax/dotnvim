return {
	'folke/noice.nvim',
	optional = true,
	opts = {
		lsp = {
			---@TODO:these should be removed once the issue is fixed
			---@see https://github.com/folke/noice.nvim/issues/930
			signature = {
				size = {
					max_height = vim.api.nvim_win_get_height(0) / 2,
				},
			},
			hover = {
				size = {
					max_height = vim.api.nvim_win_get_height(0) / 2,
				},
			},
		},
	},
}
