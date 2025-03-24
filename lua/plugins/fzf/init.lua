return {
	'ibhagwan/fzf-lua',
	optional = false,
	enabled = false,
	-- keys = {
	-- 	{
	-- 		',,',
	-- 		function()
	-- 			require('fzf-lua').files()
	-- 		end,
	-- 		desc = 'Find Files',
	-- 	},
	-- 	{
	-- 		'<leader>n',
	-- 		function()
	-- 			require('fzf-lua').buffers()
	-- 		end,
	-- 		desc = 'Find Buffers',
	-- 	},
	-- 	{
	-- 		'<leader>/',
	-- 		function()
	-- 			require('fzf-lua').live_grep({
	-- 				rg_opts = '--fixed-strings --line-number --column',
	-- 			})
	-- 		end,
	-- 		desc = 'Find Text',
	-- 	},
	-- 	{
	-- 		',.',
	-- 		function()
	-- 			require('fzf-lua').lsp_live_workspace_symbols()
	-- 		end,
	-- 		desc = 'Find Workspace Symbol',
	-- 	},
	-- },
	opts = {
		files = { formatter = 'path.filename_first' },

		previewers = {
			builtin = {
				-- disable treesitter for files bigger than 100KB
				syntax_limit_b = 1024 * 100, -- 100KB
			},
		},

		oldfiles = {
			cwd_only = true,
			stat_file = true,
			include_current_session = true,
		},

		winopts = {
			preview = {
				delay = 10,
				layout = 'vertical',
			},
		},

		grep = {
			-- actions = {
			-- 	['ctrl-g'] = { require('fzf-lua.actions').toggle_ignore },
			-- 	['ctrl-x'] = {
			-- 		fn = function(_, opts)
			-- 			require('fzf-lua.actions').toggle_flag(
			-- 				_,
			-- 				vim.tbl_extend('force', opts, {
			-- 					toggle_flag = '--fixed-strings',
			-- 				})
			-- 			)
			-- 		end,
			-- 		desc = 'toggle-fixed-strings',
			-- 		header = function(o)
			-- 			local flag = '--fixed-strings'
			-- 			if
			-- 				o.cmd
			-- 				and o.cmd:match(require('fzf-lua.utils').lua_regex_escape(flag))
			-- 			then
			-- 				return 'Respect regex chars'
			-- 			else
			-- 				return 'Disable regex chars'
			-- 			end
			-- 		end,
			-- 	},
			-- },
		},

		keymap = {
			fzf = {
				['ctrl-e'] = 'up',
				['ctrl-n'] = 'down',
			},
		},
	},
}
