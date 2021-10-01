local Shortcut = R 'nvim.newutil.keymap'
local l = R'nvim.utils.keybind'.get_lua_cmd_string
local c = R'nvim.utils.keybind'.get_cmd_string

Shortcut:mode('n'):options():noremap():next():keymaps(
    {
        ----------------------------------------------------------------------
        --                              CONFIG                              --
        ----------------------------------------------------------------------
        -- reload nvim configuration file
        { ',r', l 'R"nvim.utils.common.module".reload_package("nvim")' },

        ----------------------------------------------------------------------
        --                           CURSOR MOVE                            --
        ----------------------------------------------------------------------
        -- move cursor to left window
        { '<leader>h', '<c-w>h' },

        -- move cursor to right window
        { '<leader>i', '<c-w>l' },

        -- move cursor to bottom window
        { '<leader>n', '<c-w>j' },

        -- move cursor to top window
        { '<leader>e', '<c-w>k' },

        -- move cursor to last window
        { '<leader>w', '<c-w>p' },

        -- move to last cursor position in the jump list
        { [['']], '``' },

        -- to go to the start of the line
        { '0', '^' },

        -- centering the cursor after action
        { '{', '{zz' },
        { '}', '}zz' },
        { 'k', 'nzz' },
        { 'K', 'Nzz' },

        -- jump to next matching char in the same line
        { '<leader>;', ';' },

        ----------------------------------------------------------------------
        --                        BUFFER READ WRITE                         --
        ----------------------------------------------------------------------
        -- save the current buffer
        { '<leader>l', c 'w' },

        -- close the window
        { '<leader>q', c 'q' },

        ----------------------------------------------------------------------
        --                      BUFFER & WINDOW SWITCH                      --
        ----------------------------------------------------------------------
        -- open the file under the cursor in a split or selected window
        {
            'gf',
            function()
                R'nvim.utils.nvim.file'.open_file_under_cursor()
            end,
        },

        -- open the file under the cursor in the same window
        { 'gF', 'gf' },

        ----------------------------------------------------------------------
        --                          CUT COPY PASTE                          --
        ----------------------------------------------------------------------
        -- copy until the end of the line
        { 'Y', 'y$' },

        -- copy current line and paste next line
        { '<leader>y', 'yyp' },

        ----------------------------------------------------------------------
        --                             EDITING                              --
        ----------------------------------------------------------------------
        -- indent left
        { '<', '<<' },

        -- indent right
        { '>', '>>' },

        -- go to insert mode
        { ';', 'i' },

        -- find next occurrenc of the line search
        { 'j', ';' },

        ----------------------------------------------------------------------
        --                              OTHER                               --
        ----------------------------------------------------------------------
        -- to go enable spell checker
        { '<F6>', c 'setlocal spell! spelllang=en_us' },
    })