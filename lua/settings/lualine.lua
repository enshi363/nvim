require('lualine').setup {
    options = {
        icons_enabled = true,
        --theme = 'github_dark',
        theme = 'onedark',
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        globalstatus = true,
        component_separators = '',
    section_separators = '',
        -- always_divide_middle = true,
    },
    sections = {
        lualine_a = { {'mode' } },
        -- lualine_a = { {'mode', separator = { left = '' } } },
        -- lualine_a = { {'mode', separator = { left = '',right='' } } },
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        -- lualine_z = { {'location' ,separator = { right = '' }}}
        -- lualine_z = { {'location' ,separator = { right = '' }}}
        lualine_z = { {'location' }}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                -- buffers_color = {
                --     active = 'lualine_b_normal',     -- Color for active buffer.
                --     inactive = 'lualine_b_inactive', -- Color for inactive buffer.
                -- },
            }

        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    extensions = {}
}
