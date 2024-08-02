return {
	'kevinhwang91/nvim-ufo',
	keys = function()
		return {
			{
				'zR',
				require('ufo').openAllFolds,
				desc = 'Open all folds',
			},
			{
				'zM',
				require('ufo').closeAllFolds,
				desc = 'Close all folds',
			},
			{
				'zr',
				require('ufo').openFoldsExceptKinds,
				desc = 'Open next fold level',
			},
			{
				'zm',
				require('ufo').closeFoldsWith,
				desc = 'Close next fold level',
			},
			{
				'I',
				function()
					local winid = require('ufo').peekFoldedLinesUnderCursor()
					if not winid then
						vim.fn.CocActionAsync('definitionHover')
						vim.lsp.buf.hover()
					end
				end,
			},
		}
	end,
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
