return {
	'stevearc/conform.nvim',
	opts = function(_, opts)
		opts.formatters_by_ft['nix'] = { 'nixfmt' }

		for _, ft in ipairs({
			'javascript',
			'typescript',
			'javascriptreact',
			'typescriptreact',
		}) do
			opts.formatters_by_ft[ft] = { 'prettierd' }
		end
	end,
}
