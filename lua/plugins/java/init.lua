local f = require('utils.file').is_pkg_dir

return {
	'nvim-java/nvim-java',
	dir = f('~/Workspace/nvim-java'),
	config = false,
	dependencies = {
		{
			'nvim-java/lua-async-await',
			dir = f('~/Workspace/lua-async-await'),
		},
		{
			'nvim-java/nvim-java-core',
			dir = f('~/Workspace/nvim-java-core'),
		},
		{
			'nvim-java/nvim-java-test',
			dir = f('~/Workspace/nvim-java-test'),
		},
		{
			'nvim-java/nvim-java-dap',
			dir = f('~/Workspace/nvim-java-dap'),
		},
		{
			'nvim-java/nvim-java-refactor',
			dir = f('~/Workspace/nvim-java-refactor'),
		},
		'MunifTanjim/nui.nvim',
		'mfussenegger/nvim-dap',
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
					end,
				},
			},
		},
	},
}
