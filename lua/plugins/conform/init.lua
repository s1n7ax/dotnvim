return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			fish = {},
			lua = { 'stylua' },
			python = { 'isort', 'black' },
			javascript = { { 'prettierd' } },
			markdown = { 'mdformat', 'cbfmt', 'markdownlint-cli2' },
			nix = { 'nixfmt' },
		},
	},
}
