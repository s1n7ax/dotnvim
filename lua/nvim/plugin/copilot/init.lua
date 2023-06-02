return {
	'github/copilot.vim',
	event = 'VeryLazy',
	cmd = {
		'Copilot',
	},
	setup = function()
		local wk = require('which-key')

		wk.register({
			['<c-i>'] = { [[copilot#Accept("\<CR>")]], '(Copilot) Expand' },
		}, { mode = { 'i' } })
	end,
}
