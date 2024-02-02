local ls_to_exec_map = {
	jsonls = 'vscode-json-language-server',
	lua_ls = 'lua-language-server',
	marksman = 'marksman',
	nil_ls = 'nil',
	rust_analyzer = 'rust-analyzer',
	docker_compose_language_service = 'docker-compose-langserver',
	dockerls = 'docker-langserver',
	eslint = 'vscode-eslint-language-server',
	pyright = nil,
	ruff_lsp = 'ruff-lsp',
	tailwindcss = 'tailwindcss-language-server',
	taplo = 'taplo',
	tsserver = 'tsserver',
	yamlls = 'yaml-language-server',
	hadolint = 'hadolint',
}

return {
	{
		'neovim/nvim-lspconfig',
		opts = function(_, opts)
			for server, _ in pairs(opts.servers) do
				local exec = ls_to_exec_map[server]

				if exec and vim.fn.executable(exec) then
					opts.servers[server].mason = false
				end
			end

			return opts
		end,
	},
}
