local wk = require('which-key')

wk.register({
	name = 'Command',
	['<c-e>'] = { '<c-p>', 'Previous' },
}, {
	mode = 'c',
})
