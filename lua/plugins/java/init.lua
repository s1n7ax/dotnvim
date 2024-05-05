local f = require('utils.file').is_pkg_dir

return {
	'williamboman/mason-lspconfig.nvim',
	dependencies = {
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
			'nvim-java/nvim-java',
			dir = f('~/Workspace/nvim-java'),
			opts = {
				jdk = {
					auto_install = false,
				},
			},
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
				'neovim/nvim-lspconfig',
				'mfussenegger/nvim-dap',
			},
		},
	},
	opts = {
		handlers = {
			['jdtls'] = function()
				require('lspconfig').jdtls.setup({})
			end,
		},
	},
}
