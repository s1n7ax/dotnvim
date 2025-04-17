-- I'm using NixOS so most of the binaries downloaded from Mason is not going to
-- work in my env. So, following will check if the binary is available already
-- at system level, if so, package will not be installed through Mason

-- @NOTE: following is not enabling language servers, just saying if you enable
-- one of these, then use the system package instead of mason package
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
	ruff_lsp = 'ruff',
	tailwindcss = 'tailwindcss-language-server',
	taplo = 'taplo',
	tsserver = 'typescript-language-server',
	yamlls = 'yaml-language-server',
	emmet_language_server = 'emmet-language-server',
	html = 'vscode-html-language-server',
}

return {
	'neovim/nvim-lspconfig',
	optional = false,
	opts = function(_, opts)
		local keys = require('lazyvim.plugins.lsp.keymaps').get()

		vim.list_extend(keys, {
			-- add new record with value false to disable the existing keymap for lsp
			-- keymaps
			{ 'K', false },
			{ '<a-n>', false },
			{ 'I', vim.lsp.buf.hover, desc = 'Hover' },
		})

		opts.servers.emmet_language_server = {}
		opts.servers.html = {}

		-- I'm using nix so some executables installed through mason is not working
		-- Following will disable the mason installation for some packages
		if not vim.g.use_mason_for_ls then
			for server, server_exe_name in pairs(ls_to_exec_map) do
				if opts.servers[server] and vim.fn.executable(server_exe_name) == 1 then
					opts.servers[server].mason = false
				end
			end
		end

		-- Exclude inlay_hints for following languages
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

		--@NOTE: following loads the custom configurations IF EXISTS from the
		--custom_config directory
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
