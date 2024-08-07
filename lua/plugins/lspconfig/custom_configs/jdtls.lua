local function get_config()
	return {
		keys = {
			{
				'<leader>co',
				function()
					vim.lsp.buf.code_action({
						---@diagnostic disable-next-line: missing-fields
						context = { only = { 'source.organizeImports' } },
						apply = true,
					})
				end,
				desc = 'Organize Imports',
			},
		},
	}
end

return get_config
