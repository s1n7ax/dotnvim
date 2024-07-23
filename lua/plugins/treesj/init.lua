local function toggle()
	require('treesj').toggle()
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
