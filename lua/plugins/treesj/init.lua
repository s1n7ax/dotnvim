local function toggle()
	local tsj = require('treesj')
	tsj.toggle()
end

return {
	'Wansmer/treesj',
	dependencies = { 'treesitter' },
	keys = {
		{
			'<leader>it',
			toggle,
			desc = 'Spread/collapse block',
		},
	},
	config = function()
		local tsj = require('treesj')

		tsj.setup({
			use_default_keymaps = false,
		})
	end,
}
