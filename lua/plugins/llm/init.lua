return {
	'huggingface/llm.nvim',
	event = 'VeryLazy',
	lazy = false,
	keys = {
		{
			'<c-j>',
			function()
				require('llm.completion').complete()
			end,
			mode = 'i',
			desc = 'complete',
		},
	},
	opts = {
		lsp = {
			bin_path = '/etc/profiles/per-user/s1n7ax/bin/llm-ls',
			cmd_env = { LLM_LOG_LEVEL = 'DEBUG' },
		},

		backend = 'ollama',
		model = 'deepseek-coder:6.7b-base',
		url = 'http://192.168.1.112:11434', -- llm-ls uses "/api/generate"
		-- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
		fim = {
			enabled = true,
			prefix = '<｜fim▁begin｜>',
			suffix = '<｜fim▁hole｜>',
			middle = '<｜fim▁end｜>',
		},
		request_body = {
			-- Modelfile options for the model you use
			options = {
				temperature = 0.2,
				top_p = 0.95,
			},
		},
	},
}
