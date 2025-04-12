return {
	'echasnovski/mini.surround',
	optional = true,
	opts = {
		mappings = {
			add = ',sa', -- Add surrounding in Normal and Visual modes
			delete = ',sd', -- Delete surrounding
			find = ',sf', -- Find surrounding (to the right)
			find_left = ',sF', -- Find surrounding (to the left)
			highlight = ',sh', -- Highlight surrounding
			replace = ',sr', -- Replace surrounding
			update_n_lines = ',sn', -- Update `n_lines`
		},
	},
}
