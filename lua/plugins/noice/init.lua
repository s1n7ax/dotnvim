return {
	'folke/noice.nvim',
	-- snaks.notify replaces this plugin
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
