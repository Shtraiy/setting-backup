return{
    'akinsho/toggleterm.nvim', version = "*",
    config = function()
        local Terminal = require('toggleterm.terminal').Terminal
        require("toggleterm").setup{
            open_mapping = [[<A-\>]],
            direction = 'horizontal',
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            vim.api.nvim_set_keymap("t", "<Esc>", "<A-\\><A-n>", {noremap = true, silent = true}),
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
                width = 80,
                height = 20,
                close_on_esc = true,
                shading_factor = 0.9,
                relative = 'editor',
                row = 20,
                col = 50,
            },
            -- 打开新终端后自动进入插入模式
            start_in_insert = true,
        }

        -- -- 文件浏览器配置
        -- local term_float = Terminal:new({ cmd = '', hidden = true, direction = 'float' })
        -- -- 打开文件浏览器
        -- vim.keymap.set('n', '<A-F>', function() file_explorer_term:toggle() end)

    end
}

