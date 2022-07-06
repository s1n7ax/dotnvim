local ls = require('luasnip')
local su = require('nvim.utils.lua.string')
local SnippetManager = require('nvim.plugins.luasnip.snippet_manager')

local s = ls.s
local rep = require('luasnip.extras').rep
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node

local tl = su.box_trim_lines

local sm = SnippetManager('lua')

local indentation = su.get_space_str(vim.opt.softtabstop:get())

-- creates a new module
sm:add_snippet(s(
    'mod',
    fmt('{}', {
        c(1, {
            fmt(
                tl([[
                local {} = {{}}
                
                {}

                return {}
            ]]),
                {
                    i(1, 'M'),
                    i(2),
                    rep(1),
                }
            ),

            fmt(
                tl([[
                local {} = {{}}

                function {}:new(o)
                    {}o = o or {{}}
                    {}setmetatable(o, self)
                    {}self.__index = self
                    {}return o
                end

                {}

                return {}
            ]]),
                {
                    i(1, 'M'),
                    rep(1),
                    t(indentation),
                    t(indentation),
                    t(indentation),
                    t(indentation),
                    i(2),
                    rep(1),
                }
            ),
        }),
    })
))
