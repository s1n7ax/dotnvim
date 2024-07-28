local wk = require('which-key')

wk.add({
	{
		mode = { 'n', 'o', 'x' },
		{ '<c-l>', '<c-i>', desc = 'Jump to previous jump point' },
		{ 'E', 'K', desc = 'Keyword lookup' },
		{ 'H', 'I', desc = 'Insert at line start' },
		{ 'K', 'N', desc = 'Find prev' },
		{ 'L', 'E', desc = 'Last char before white space' },
		{ 'N', 'J', desc = 'Join below line' },
		{ 'e', '<up>', desc = 'Up' },
		{ 'h', 'i', desc = 'Insert' },
		{ 'i', '<right>', desc = 'Right' },
		{ 'j', 'm', desc = 'Create mark' },
		{ 'k', 'n', desc = 'Find next' },
		{ 'l', 'e', desc = 'Next end of word' },
		{ 'm', '<left>', desc = 'Left' },
		{ 'n', '<down>', desc = 'Down' },
	},
})
