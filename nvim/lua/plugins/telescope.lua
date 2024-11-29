return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',

    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope recent files' })
        vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, { desc = 'Search in current file' })
        require("telescope").setup{
            defaults = {
                -- 设置窗口的高度和宽度
                layout_config = {
                    horizontal = {
                        mirror = false,     -- 不反转水平布局
                        preview_width = 0.6,  -- 预览窗口的宽度，取值范围 0.0 到 1.0
                    },
                    vertical = {
                        mirror = false,     -- 不反转垂直布局
                    },
                    width = 0.6,          -- 窗口的宽度，取值范围 0.0 到 1.0
                    height = 0.6,         -- 窗口的高度，取值范围 0.0 到 1.0
                },
            },
        }
    end
}
