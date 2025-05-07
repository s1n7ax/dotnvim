local pkg_bin_map = {}

local function binary_available(pkg)
	local binary_name = pkg_bin_map[pkg] and pkg_bin_map[pkg] or pkg
	return vim.fn.executable(binary_name) ~= 1
end

return {
	'mason-org/mason.nvim',
	optional = true,
	opts = function(_, opts)
		opts.ensure_installed = vim.tbl_filter(function(pkg)
			return binary_available(pkg)
		end, opts.ensure_installed)

		return opts
	end,
}
