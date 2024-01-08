return {
	'williamboman/mason.nvim',
	opts = function(_, opts)
		opts.ensure_installed = vim.tbl_filter(function(value)
			vim.print(value ~= 'stylua' and value ~= 'shfmt')
			return value ~= 'stylua' and value ~= 'shfmt'
		end, opts.ensure_installed)

		return opts
	end,
}
