local wk = require('which-key')

wk.add({
	{ 'p', 'P', desc = 'Paste yanked text', mode = 'x' },
	{ '$', 'g_', desc = 'Select until end of line', mode = 'x' },
})
