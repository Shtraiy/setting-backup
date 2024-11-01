return{
    'akinsho/toggleterm.nvim', version = "*",
    config = function()
        require("toggleterm").setup{
            open_mapping = [[<A-\>]],
            direction = 'float',
            size = 20,
            -- 打开新终端后自动进入插入模式
            start_in_insert = true,
        }
    end
}

