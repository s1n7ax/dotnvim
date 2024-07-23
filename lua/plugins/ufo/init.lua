return {
	'kevinhwang91/nvim-ufo',
	dependencies = 'kevinhwang91/promise-async',
	event = 'LspAttach',
	opts = function(_, opts)
		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities.textDocument.foldingRange = {
		-- 	dynamicRegistration = false,
		-- 	lineFoldingOnly = true,
		-- }
		--
		-- local language_servers = require('lspconfig').util.available_servers()
		-- for _, ls in ipairs(language_servers) do
		-- 	require('lspconfig')[ls].setup({
		-- 		capabilities = capabilities,
		-- 	})
		-- end

		return vim.tbl_deep_extend('force', opts, {
			provider_selector = function(--[[bufnr, filetype, buftype]])
				return { 'treesitter', 'indent' }
			end,
		})
	end,
}
