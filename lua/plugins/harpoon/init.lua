local add_file = function()
	require('harpoon'):list():add()
end

local toggle_ui = function()
	local harpoon = require('harpoon')
	harpoon.ui:toggle_quick_menu(harpoon:list())
end

local nav = function(index)
	return function()
		require('harpoon'):list():select(index)
	end
end

return {
	'ThePrimeagen/harpoon',
	optional = true,
	keys = function()
		local keys = {
			{ ',l', mode = 'n', add_file, desc = 'Harpoon Add File' },
			{ ',L', mode = 'n', toggle_ui, desc = 'Harpoon Toggle UI' },
		}

		for i = 1, 5 do
			table.insert(
				keys,
				{ '<c-' .. i .. '>', nav(i), desc = 'Harpoon Jump to File ' .. i }
			)
		end

		return keys
	end,
}
