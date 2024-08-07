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
	'neovim/nvim-lspconfig',
	opts = function(_, opts)
		local keys = require('lazyvim.plugins.lsp.keymaps').get()
		keys[#keys + 1] = { 'K', false }
		keys[#keys + 1] = { 'I', vim.lsp.buf.hover, desc = 'Hover' }

		-- I'm using nix so some executables installed through mason is not working
		-- Following will disable the mason installation for some packages
		if not vim.g.use_mason_for_ls then
			for server, _ in pairs(ls_to_exec_map) do
				if opts.servers[server] then
					opts.servers[server].mason = false
				end
			end
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

		for _, server_name in ipairs(opts.servers) do
			if opts.servers[server_name] then
				local ok, get_config = pcall(
					require,
					('plugins.lspconfig.custom_configs.%s'):format(server_name)
				)

				if ok then
					opts.servers[server_name] = vim.tbl_deep_extend(
						'force',
						opts.servers[server_name],
						get_config()
					)
				end
			end
		end

		return opts
	end,
}
