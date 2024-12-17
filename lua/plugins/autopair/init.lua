return {
	'windwp/nvim-autopairs',
	event = 'VeryLazy',
	opts = {
		check_ts = true,
		fast_wrap = {
			map = '<c-e>',
			chars = { '{', '[', '(', '"', "'", '<' },
			pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
			end_key = '$',
			keys = 'tnseriao',
			check_comma = true,
			highlight = 'Search',
			highlight_grey = 'Comment',
		},
	},
	config = function(_, glob_opts)
		local npairs = require('nvim-autopairs')
		local cond = require('nvim-autopairs.conds')
		local Rule = require('nvim-autopairs.rule')

		npairs.setup(glob_opts)

		-- setting cmp for autopairs
		local ok, cmp = pcall(require, 'cmp')

		if ok then
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
		end

		npairs.add_rules({
			-- Before <|
			-- After <|>
			Rule('<', '>'):with_move(cond.none()),

			-- add margin after cursor on space
			-- Before: (|)
			-- After: ( | )
			Rule(' ', ' ')
				:with_pair(function(opts)
					local pair = opts.line:sub(opts.col - 1, opts.col)
					return vim.tbl_contains({ '()', '{}', '[]' }, pair)
				end)
				:with_move(cond.none())
				:with_cr(cond.none())
				:with_del(function(opts)
					local col = vim.api.nvim_win_get_cursor(0)[2]
					local context = opts.line:sub(col - 1, col + 2)
					return vim.tbl_contains({ '(  )', '{  }', '[  ]' }, context)
				end),
			Rule('', ' )')
				:with_pair(cond.none())
				:with_move(function(opts)
					return opts.char == ')'
				end)
				:with_cr(cond.none())
				:with_del(cond.none())
				:use_key(')'),
			Rule('', ' }')
				:with_pair(cond.none())
				:with_move(function(opts)
					return opts.char == '}'
				end)
				:with_cr(cond.none())
				:with_del(cond.none())
				:use_key('}'),
			Rule('', ' ]')
				:with_pair(cond.none())
				:with_move(function(opts)
					return opts.char == ']'
				end)
				:with_cr(cond.none())
				:with_del(cond.none())
				:use_key(']'),

			-- Add curly braces on arrow on javascript
			Rule('%(.*%)%s*%=>$', ' {}', {
				'typescript',
				'typescriptreact',
				'javascript',
				'javascriptreact',
			}):use_regex(true):set_end_pair_length(1),

			-- Auto add space on =
			Rule('=', '', { '-sh' })
				:with_pair(cond.not_inside_quote())
				:with_pair(function(opts)
					if vim.o.filetype == 'rust' then
						return false
					end

					local last_char = opts.line:sub(opts.col - 1, opts.col - 1)

					if last_char:match('[%w%=%s]') then
						return true
					end
					return false
				end)
				:replace_endpair(function(opts)
					local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
					local next_char = opts.line:sub(opts.col, opts.col)
					next_char = next_char == ' ' and '' or ' '
					if prev_2char:match('%w$') then
						return '<bs> =' .. next_char
					end
					if prev_2char:match('%=$') then
						return next_char
					end
					if prev_2char:match('=') then
						return '<bs><bs>=' .. next_char
					end
					return ''
				end)
				:set_end_pair_length(0)
				:with_move(cond.none())
				:with_del(cond.none()),
		})
	end,
}
