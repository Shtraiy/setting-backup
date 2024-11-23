return{
    'akinsho/toggleterm.nvim', version = "*",
    config = function()
        local Terminal = require('toggleterm.terminal').Terminal
        require("toggleterm").setup{
            open_mapping = [[<A-\>]],
            direction = 'vertical',
            size = math.floor(vim.o.columns / 3),
            close_on_exit = false,
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
            },
            -- 打开新终端后自动进入插入模式
            start_in_insert = true,
            -- 快捷键设置
            vim.api.nvim_set_keymap("t", "<C-c>", "<C-\\><C-n>", {noremap = true, silent = true}),
            vim.api.nvim_set_keymap("t", "<A-l>", "<Cmd> wincmd l<CR>", {noremap = true, silent = true}),
            vim.api.nvim_set_keymap("t", "<A-F>", "<Cmd> wincmd h<CR>", {noremap = true, silent = true}),
            vim.api.nvim_set_keymap("t", "<A-j>", "<Cmd> wincmd j<CR>", {noremap = true, silent = true}),
            vim.api.nvim_set_keymap("t", "<A-k>", "<Cmd> wincmd k<CR>", {noremap = true, silent = true}),
            vim.api.nvim_set_keymap('n', '<Leader>v1', ':ToggleTerm direction=vertical<CR>', { noremap = true, silent = true }),
            vim.api.nvim_set_keymap('n', '<Leader>v2', ':ToggleTerm direction=vertical<CR>', { noremap = true, silent = true }),
            vim.api.nvim_set_keymap('n', '<Leader>v3', ':ToggleTerm direction=vertical<CR>', { noremap = true, silent = true }),

        }

        -- zsh终端窗口配置
        local zshterm = Terminal:new({
            cmd = 'zsh',
            direction = 'float',
            close_on_exit = false,
        })
        function zsh_toggle()
            zshterm:toggle()
        end
        -- 绑定快捷键生成zsh窗口
        vim.api.nvim_set_keymap("n", "<leader>z", "<Cmd>lua zsh_toggle()<CR>", {noremap = true, silent = true})

        -- htop终端窗口配置
        local htopterm = Terminal:new({
            cmd = 'htop',
            direction = 'float'
        })
        function htop_toggle()
            htopterm:toggle()
        end
        -- 绑定快捷键生成htop窗口
        vim.api.nvim_set_keymap("n", "<leader>ht", "<Cmd>lua htop_toggle()<CR>", {noremap = true, silent = true})

        function vertical_term()
            -- 打开第一个垂直终端
            local term1 = Terminal:new({
                direction = "vertical",
                size = math.floor(vim.o.columns / 3), -- 设置宽度
                name = "First Term"
            })
            term1:toggle()

            -- 打开第二个垂直终端
            local term2 = Terminal:new({
                direction = "vertical",
                size = math.floor(vim.o.columns / 3), -- 设置宽度
                name = "Second Term"
            })
            term2:toggle()
        end
        vim.api.nvim_set_keymap('n', '<Leader>v', ':lua vertical_term()<CR>', { noremap = true, silent = true })



        -- -- float1终端窗口配置
        -- local f1term = Terminal:new({
        --     cmd = 'zsh',
        --     direction = 'float',
        --     close_on_exit = false,
        --     float_opts = {
        --         border = 'curved',
        --         height = math.floor(vim.o.lines * 0.49),
        --         width = math.floor(vim.o.columns / 3),
        --         close_on_esc = true,
        --         shading_factor = 0.9,
        --         relative = 'editor',
        --         row = 0,
        --         col = vim.o.columns - math.floor(vim.o.columns / 3),
        --     },
        -- })
        -- function f1_toggle()
        --     if not f1term:is_open() then
        --         f1term:open()
        --     end
        -- end
        --
        -- -- float2终端窗口配置
        -- local f2term = Terminal:new({
        --     cmd = 'zsh',
        --     direction = 'float',
        --     close_on_exit = false,
        --     float_opts = {
        --         border = 'curved',
        --         height = math.floor(vim.o.lines * 0.49),
        --         width = math.floor(vim.o.columns / 3),
        --         close_on_esc = true,
        --         shading_factor = 0.9,
        --         relative = 'editor',
        --         row = math.floor(vim.o.lines * 0.49),
        --         col = vim.o.columns - math.floor(vim.o.columns / 3),
        --     },
        -- })
        -- function f2_toggle()
        --     if not f2term:is_open() then
        --         f2term:open()
        --     end
        -- end
        -- vim.api.nvim_set_keymap("n", "<leader>t1", "<Cmd>lua f1_toggle()<CR>", {noremap = true, silent = true})
        -- vim.api.nvim_set_keymap("n", "<leader>t2", "<Cmd>lua f2_toggle()<CR>", {noremap = true, silent = true})

    end
}

