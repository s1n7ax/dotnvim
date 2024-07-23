local add_file = function()
	require('harpoon.mark').add_file()
end

local toggle_ui = function()
	require('harpoon.ui').toggle_quick_menu()
end

local nav = function(index)
	return function()
		require('harpoon.ui').nav_file(index)
	end
end

return {
	'ThePrimeagen/harpoon',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ ',l', mode = 'n', add_file, desc = 'Harpoon Add File' },
		{ ',L', mode = 'n', toggle_ui, desc = 'Harpoon Toggle UI' },
		{ '<c-1>', mode = 'n', nav(1), desc = 'Harpoon Jump to 1st' },
		{ '<c-2>', mode = 'n', nav(2), desc = 'Harpoon Jump to 2nd' },
		{ '<c-3>', mode = 'n', nav(3), desc = 'Harpoon Jump to 3rd' },
		{ '<c-4>', mode = 'n', nav(4), desc = 'Harpoon Jump to 4rd' },
	},
	config = true,
}
