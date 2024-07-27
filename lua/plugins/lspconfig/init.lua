local ls_to_exec_map = {
	cssls = 'vscode-css-language-server',
	jsonls = 'vscode-json-language-server',
	lua_ls = 'lua-language-server',
	marksman = 'marksman',
	nil_ls = 'nil',
	docker_compose_language_service = 'docker-compose-langserver',
	dockerls = 'docker-langserver',
	eslint = 'vscode-eslint-language-server',
	pyright = nil,
	ruff_lsp = 'ruff-lsp',
	tailwindcss = 'tailwindcss-language-server',
	taplo = 'taplo',
	tsserver = 'typescript-language-server',
	yamlls = 'yaml-language-server',
	emmet_language_server = 'emmet-language-server',
}

return {
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			-- disable installation from mason if the executable is available in the
			-- systemt already
			for server, exec_name in pairs(ls_to_exec_map) do
				-- if the server config not found, enable the server
				if not opts.servers[server] then
					opts.servers[server] = {}
				end

				if vim.fn.executable(exec_name) then
					opts.servers[server].mason = false
				end
			end

			-- opts.servers.emmet_language_server.filetypes = { 'rust' }

			-- changes in the default config
			opts.setup.emmet_language_server = function(_, config)
				local filetypes =
					require('lspconfig').emmet_language_server.document_config.default_config.filetypes

				table.insert(filetypes, 'rust')

				config.filetypes = filetypes
			end

			opts.setup.tailwindcss = function(_, config)
				local filetypes =
					require('lspconfig').tailwindcss.document_config.default_config.filetypes

				table.insert(filetypes, 'rust')

				config.filetypes = filetypes
			end

			opts.inlay_hints = {
				enabled = true,
				exclude = {
					'java',
					'javascript',
					'typescript',
					'javascriptreact',
					'typescriptreact',
				},
			}

			opts.diagnostics.virtual_text = false

			return opts
		end,
	},
}
