local f = require('utils.file').is_pkg_dir
local helper = require('plugins.luasnip.helper')

return {
	'L3MON4D3/LuaSnip',
	optional = false,
	enabled = true,
	dependencies = {
		{
			's1n7ax/nvim-snips',
			dir = f('~/Workspace/my-projects/nvim-snips'),
		},
		'nvim-treesitter/nvim-treesitter',
		{
			's1n7ax/nvim-ts-utils',
			dir = f('~/Workspace/nvim-ts-utils'),
		},
	},
	keys = function()
		-- stylua: ignore
		return {
			-- { '<s-Tab>', '<s-Tab>', desc = 'Shift Tab Space', mode = { 'i', 's' } },
			{ '<Tab>', '<Tab>', desc = 'Tab Space', mode = { 'i', 's' } },
			{ '<c-i>', helper.expand_or_jump(), desc = '(Snippet) Expand or jump', mode = {'i', 's' } },
			{ '<c-m>', helper.jump_prev(), desc = '(Snippet) Jump prev placeholder', mode = { 's' } },
			{ '<c-l>', helper.change_choice(), desc = '(Snippet) Change choice', mode = { 'i', 's' } },
		}
	end,
	config = function()
		helper.register_snippets()
	end,
}
