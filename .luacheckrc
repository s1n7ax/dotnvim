stds.nvim = {
	read_globals = { 'jit' },
}

std = 'lua51+nvim'

-- Global objects defined by the C code
read_globals = {
	'vim',
}

globals = {
	'vim.g',
	'vim.b',
	'vim.w',
	'vim.o',
	'vim.bo',
	'vim.wo',
	'vim.go',
	'vim.env',
	'vim.opt',
}
