local cmp = R 'cmp'
local types = R 'cmp.types'

local WIDE_HEIGHT = 50

cmp.setup(
    {
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            -- ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm(
                {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),
        },

        sources = {
            {
                name = 'nvim_lsp',
                priority = 100,
            },
            {
                name = 'nvim_lua',
                priority = 100,
            },
            {
                name = 'snippy',
                priority = 90,
                max_item_count = 3,
                keyword_length = 2,
            },
            {
                name = 'buffer',
                priority = 80,
            },
            {
                name = 'path',
                priority = 80,
            },
            {
                name = 'spell',
                priority = 50,
            },
            {
                name = 'calc',
                priority = 50,
            },
            {
                name = 'emoji',
                priority = 10,
            },
        },

        snippet = {
            expand = function(args)
                R'snippy'.expand_snippet(args.body)
            end,
        },

        completion = {
            keyword_length = 2,
            completeopt = 'menu,menuone,preview,noinsert',
        },

        preselect = true,

        documentation = {
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
            maxwidth = math.floor(
                (WIDE_HEIGHT * 2) * (V.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
            maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / V.o.lines)),
        },
    })