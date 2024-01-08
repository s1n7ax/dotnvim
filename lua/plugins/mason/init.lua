return {
	'williamboman/mason.nvim',
	opts = function(_, opts)
		opts.ensure_installed = vim.tbl_filter(function(value)
			return value == 'stylua' or value == 'shfmt'
		end, opts.ensure_installed)

		return opts
	end,
}
