local lsp_util = require('nvim.utils.lsp')

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = lsp_util.get_client(ev)

		if client.name ~= 'lua_ls' then
			return
		end

		client.config = vim.tbl_deep_extend('force', client.config, {
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim', 'describe', 'it' },
					},
					format = {
						enable = false,
					},
					completion = {
						autoRequire = true,
						callSnippet = 'Replace',
						displayContext = 1,
					},
					hint = {
						enable = true,
						arrayIndex = 'Enable',
						setType = true,
					},
					semantic = {
						enable = false,
					},
					workspace = {
						checkThirdParty = false,
						maxPreload = 10000,
						preloadFileSize = 10000,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})
	end,
})
