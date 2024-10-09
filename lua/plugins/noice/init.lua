return {
	'folke/noice.nvim',
	optional = true,
	opts = {
		lsp = {
			---@TODO:these should be removed once the issue is fixed
			---@see https://github.com/folke/noice.nvim/issues/930
			signature = {
				enabled = false,
			},
			hover = {
				enabled = false,
			},
		},
	},
}
