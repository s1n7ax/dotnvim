local lsp_util = require('nvim.utils.lsp')

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = lsp_util.get_client(ev)

		if client.server_capabilities.inlayHintProvider then
			vim.lsp.buf.inlay_hint(0, true)
			vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = 'red' })
		end
	end,
})
