return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    opts = {
        options = {
            theme = "catppuccin",
            section_separators = { left = '', right = '' },
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = {
                { 'mode', separator = { left = '█' }, right_padding = 2 },
            },
            lualine_b = { 'filename', 'branch', 'diff' },
            lualine_c = { 'fileformat' },
            -- lualine_x = { 'diagnostics', { 'datetime', style = '%H:%M' } },
            lualine_x = { 'diagnostics' },
            lualine_y = { 'filetype', 'progress' },
            lualine_z = {
                { 'location', separator = { right = '█' }, left_padding = 2 },
            },
        },
        inactive_sections = {
            lualine_a = { 'filename' },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' },
        },
        tabline = {},
        extensions = {},
    },
}
