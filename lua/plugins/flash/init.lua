local flash = function(func_name)
	return function()
		require('flash')[func_name]()
	end
end

local keys = {
	{ '<CR>', mode = { 'n', 'x', 'o' }, flash('jump'), desc = 'Flash' },
	{ '<c-s>', mode = { 'c' }, flash('toggle'), desc = 'Toggle Flash Search' },
	{ 'r', mode = 'o', flash('remote'), desc = 'Remote Flash' },
	{
		'S',
		mode = { 'n', 'o', 'x' },
		flash('treesitter'),
		desc = 'Flash Treesitter',
	},
	{
		'R',
		mode = { 'o', 'x' },
		flash('treesitter_search'),
		desc = 'Treesitter Search',
	},
}

return {
	'folke/flash.nvim',
	event = 'VeryLazy',
	opts = {
		modes = {
			search = {
				enabled = false,
			},
		},
	},
	keys = keys,
}
