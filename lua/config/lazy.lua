local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require('lazy').setup({
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = false,
		notify = false, -- get a notification when changes are found
	},
	concurrency = 5,
	spec = {
		-- add LazyVim and import its plugins
		{
			'LazyVim/LazyVim',
			opts = {
				-- colorscheme = 'rose-pine-moon',
				-- colorscheme = 'catppuccin-frappe',
				colorscheme = 'tokyonight',
			},
			import = 'lazyvim.plugins',
		},
		{ import = 'lazyvim.plugins.extras.ai.copilot' },
		{ import = 'lazyvim.plugins.extras.ai.copilot-chat' },
		{ import = 'lazyvim.plugins.extras.coding.luasnip' },
		{ import = 'lazyvim.plugins.extras.dap.core' },
		{ import = 'lazyvim.plugins.extras.editor.harpoon2' },
		{ import = 'lazyvim.plugins.extras.editor.overseer' },
		{ import = 'lazyvim.plugins.extras.formatting.prettier' },
		{ import = 'lazyvim.plugins.extras.lang.docker' },
		{ import = 'lazyvim.plugins.extras.lang.git' },
		{ import = 'lazyvim.plugins.extras.lang.json' },
		{ import = 'lazyvim.plugins.extras.lang.markdown' },
		{ import = 'lazyvim.plugins.extras.lang.nix' },
		{ import = 'lazyvim.plugins.extras.lang.sql' },
		{ import = 'lazyvim.plugins.extras.lang.tailwind' },
		{ import = 'lazyvim.plugins.extras.lang.typescript' },
		{ import = 'lazyvim.plugins.extras.lang.yaml' },
		{ import = 'lazyvim.plugins.extras.linting.eslint' },
		{ import = 'lazyvim.plugins.extras.lsp.neoconf' },
		{ import = 'lazyvim.plugins.extras.test.core' },
		{ import = 'lazyvim.plugins.extras.util.rest' },

		{ import = 'plugins' },
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = true,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	install = { colorscheme = { 'tokyonight', 'habamax' } },
	checker = { enabled = false }, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				'gzip',
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				'tarPlugin',
				'tohtml',
				'tutor',
				'zipPlugin',
			},
		},
	},
})
