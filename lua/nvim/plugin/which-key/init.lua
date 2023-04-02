return {
	'folke/which-key.nvim',
	name = 'which-key',
	version = '1.1.0',
	config = function()
		vim.o.timeoutlen = 3000
		require('which-key').setup({
			triggers_blacklist = { i = { 'n' }, n = { 'v' } },
		})
	end,
}
