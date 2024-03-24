return {
	'ThePrimeagen/harpoon',
	keys = {
		{
			',l',
			function()
				require('harpoon'):list():append()
			end,
			desc = 'Harpoon file',
		},
		{
			',L',
			function()
				local harpoon = require('harpoon')
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = 'Harpoon quick menu',
		},
		{
			'<c-1>',
			function()
				require('harpoon'):list():select(1)
			end,
			desc = 'Harpoon to file 1',
		},
		{
			'<c-2>',
			function()
				require('harpoon'):list():select(2)
			end,
			desc = 'Harpoon to file 2',
		},
		{
			'<c-3>',
			function()
				require('harpoon'):list():select(3)
			end,
			desc = 'Harpoon to file 3',
		},
		{
			'<c-4>',
			function()
				require('harpoon'):list():select(4)
			end,
			desc = 'Harpoon to file 4',
		},
		{
			'<c-5>',
			function()
				require('harpoon'):list():select(5)
			end,
			desc = 'Harpoon to file 5',
		},
	},
}
