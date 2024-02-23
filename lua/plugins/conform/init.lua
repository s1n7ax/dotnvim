return {
	'stevearc/conform.nvim',
	enable = false,
	opts = {
		formatters_by_ft = {
			fish = {},
			lua = { 'stylua' },
			python = { 'isort', 'black' },
			javascript = { { 'prettierd' } },
			json = { 'prettierd' },
			yaml = { 'prettierd' },
			markdown = { 'mdformat', 'cbfmt', 'markdownlint-cli2' },
			nix = { 'nixfmt' },
		},
	},
}
