return{
    'numToStr/Comment.nvim',
    opts = {
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = {
            line = '<leader>gcc',  -- 行注释切换
            block = '<leader>gbc', -- 塊注释切换
        },
        opleader = {
            line = '<leader>gc',   -- 行注释操作符
            block = '<leader>gb',  -- 塊注释操作符
        },
        extra = {
            above = '<leader>gcO', -- 上方添加注释
            below = '<leader>gco', -- 下方添加注释
            eol = '<leader>gcA',   -- 行尾添加注释
        },
        mappings = {
            basic = true,
            extra = true,
        },
        pre_hook = nil,
        post_hook = nil,
    },
    config = function ()
        require('Comment').setup()
    end
}

