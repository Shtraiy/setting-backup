return{
    'akinsho/toggleterm.nvim', version = "*",
    config = function()
        local Terminal = require('toggleterm.terminal').Terminal
        require("toggleterm").setup{
            open_mapping = [[<A-\>]],
            direction = 'float',
            vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true}),
            vim.api.nvim_set_keymap("t", "<A-l>", "<Cmd> wincmd l<CR>", {noremap = true, silent = true}),
            vim.api.nvim_set_keymap("t", "<A-F>", "<Cmd> wincmd h<CR>", {noremap = true, silent = true}),
            vim.api.nvim_set_keymap("t", "<A-j>", "<Cmd> wincmd j<CR>", {noremap = true, silent = true}),
            vim.api.nvim_set_keymap("t", "<A-k>", "<Cmd> wincmd k<CR>", {noremap = true, silent = true}),
            highlights = {
                -- highlights which map to a highlight group name and a table of it's values
                -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
                Normal = {
                    guibg = "none",
                },                
                NormalFloat = {
                    link = 'none'
                },
                FloatBorder = {
                    guifg = "#ebdbb2",
                    guibg = "none",
                },
            },
            float_opts = {
                border = 'curved',
                height = math.floor(vim.o.lines * 0.7), -- 设置高度为 70% 的屏幕高度
                width = math.floor(vim.o.columns / 2),   -- 设置宽度为一半的屏幕宽度
                close_on_esc = true,
                shading_factor = 0.9,
                relative = 'editor',
            },
            -- 打开新终端后自动进入插入模式
            start_in_insert = true,
        }
    end
}

