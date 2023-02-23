local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'--single-branch',
		'git@github.com:folke/lazy.nvim.git',
		lazypath,
	})
end

vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup('nvim.plugin', {
	defaults = { lazy = true },
	--  install = { colorscheme = { 'tokyonight', 'habamax' } },
	checker = { enabled = true, notify = false },
	diff = {
		cmd = 'terminal_git',
	},
	performance = {
		cache = {
			enabled = true,
			-- disable_events = {},
		},
	},
	ui = {
		--  custom_keys = {

		--  ['<localleader>d'] = function(plugin)
		--  dd(plugin)
		--  end,
		--  },
	},
	debug = false,
})
