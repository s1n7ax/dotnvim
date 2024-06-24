local function toggle()
	local tsj = require('treesj')
	tsj.toggle()
end

return {
	'Wansmer/treesj',
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	keys = {
		{
			'<leader>it',
			toggle,
			desc = 'Spread/collapse block',
		},
	},
	opts = {

		use_default_keymaps = false,
	},
}
