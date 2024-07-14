local flash = function(func_name)
	return function()
		require('flash')[func_name]()
	end
end

local keys = {
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
	opts = {
		modes = {
			search = {
				enabled = false,
			},
			char = {
				enabled = true,
				keys = { 'F', 'f', 'T', 't' },
			},
		},
	},
	keys = keys,
}
