return {
	'williamboman/mason-lspconfig.nvim',
	version = '0.1.4',
	event = 'VimEnter',
	dependencies = {
		'mason',
		'cmp',
		'null-ls',
		'trouble',
		'neovim/nvim-lspconfig',
		'onsails/lspkind-nvim',
		'MunifTanjim/nui.nvim',
		'notify',
		'pyericz/promise-lua',
		{
			'simrat39/rust-tools.nvim',
			dependencies = {
				'neovim/nvim-lspconfig',
				'nvim-lua/plenary.nvim',
				'mfussenegger/nvim-dap',
			},
		},
	},
	config = function()
		-- lsp config
		require('nvim.plugin.lsp.common.ui').setup()
		require('nvim.plugin.lsp.common.keymaps').setup()
		require('nvim.plugin.lsp.common.server-start-notification').setup()
		require('nvim.plugin.lsp.common.disable-semantic-tokens').setup()

		-- lsp lang specific config
		require('nvim.plugin.lsp.lua').setup()
		require('nvim.plugin.lsp.emmet').setup()
		require('nvim.plugin.lsp.java').setup()
		require('nvim.plugin.lsp.rust.rust_tools').setup()
		require('nvim.plugin.lsp.tsserver').setup()
		require('nvim.plugin.lsp.python').setup()

		-- setup LSes
		require('mason').setup()
		require('mason-lspconfig').setup({
			automatic_installation = true,
			ui = {
				icons = {
					server_installed = '✓',
					server_pending = '➜',
					server_uninstalled = '✗',
				},
			},
		})

		local Lsp = require('nvim.utils.lsp')

		local servers = {
			'bashls',
			'cssls',
			'dockerls',
			'eslint',
			'graphql',
			'html',
			'jsonls',
			'jdtls',
			'lua_ls',
			'pyright',
			'rust_analyzer',
			'tsserver',
			'volar',
			'groovyls',
			'clangd',
			'emmet_ls',
		}

		Lsp.setup(servers)
	end,
}
