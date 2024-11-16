return {
	'stevearc/conform.nvim',
	event = 'LazyFile',
	opts = function(_, opts)
		opts.formatters_by_ft['nix'] = { 'nixfmt' }

		for _, ft in ipairs({
			'javascript',
			'typescript',
			'javascriptreact',
			'typescriptreact',
			'markdown',
			'yaml',
			'json',
			'html',
		}) do
			opts.formatters_by_ft[ft] = { 'prettierd' }
		end
	end,
}
