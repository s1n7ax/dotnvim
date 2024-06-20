return {
	'smoka7/hop.nvim',
	keys = function()
		return {
			{
				'<CR>',
				function()
					require('hop').hint_words()
				end,
				desc = 'Hop to word',
			},
			{
				'M',
				function()
					require('hop').hint_lines()
				end,
				desc = 'Hop to line',
			},
		}
	end,
	opts = {
		keys = 'dhwyfuplaorisetn',
	},
}
