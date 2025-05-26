local f = require('utils.file').is_pkg_dir

return {
	'nvim-java/nvim-java',
	enabled = true,
	dir = f('~/Workspace/java/nvim-java'),
	config = false,
	dependencies = {
		{
			'nvim-java/lua-async',
			dir = f('~/Workspace/java/lua-async'),
		},
		{
			'nvim-java/nvim-java-core',
			dir = f('~/Workspace/java/nvim-java-core'),
		},
		{
			'nvim-java/nvim-java-test',
			dir = f('~/Workspace/java/nvim-java-test'),
		},
		{
			'nvim-java/nvim-java-dap',
			dir = f('~/Workspace/java/nvim-java-dap'),
		},
		{
			'nvim-java/nvim-java-refactor',
			dir = f('~/Workspace/java/nvim-java-refactor'),
		},
		{
			'williamboman/mason.nvim',
			opts = {
				registries = {
					'github:nvim-java/mason-registry',
					'github:mason-org/mason-registry',
				},
			},
		},
		{
			'neovim/nvim-lspconfig',
			opts = {
				servers = {
					jdtls = {
						handlers = {
							['$/progress'] = function() end,
						},
						capabilities = vim.lsp.protocol.make_client_capabilities(),
					},
				},
				setup = {
					jdtls = function()
						require('java').setup({
							jdk = {
								auto_install = false,
							},
							notifications = {
								dap = false,
							},
						})

						require('lspconfig').jdtls.setup({})

						-- return true will skip mason-lspconfig from setting up jdtls
						return true
					end,
				},
			},
		},
	},
}
