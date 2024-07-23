return {
	'echasnovski/mini.move',
	keys = {
		{ '<c-n>', mode = { 'x' }, desc = 'Move down' },
		{ '<c-e>', mode = { 'x' }, desc = 'Move down' },
		{ '<c-m>', mode = { 'x' }, desc = 'Indent left' },
		{ '<c-i>', mode = { 'x' }, desc = 'Indent right' },
	},
	opts = {
		mappings = {
			left = '<c-m>',
			right = '<c-i>',
			down = '<c-n>',
			up = '<c-e>',

			line_left = nil,
			line_right = nil,
			line_down = nil,
			line_up = nil,
		},
	},
}
