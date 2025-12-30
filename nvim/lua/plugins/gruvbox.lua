return{
    "ellisonleao/gruvbox.nvim", 
    priority = 1000 , 
    config = true,
    config = function()
        require("gruvbox").setup({
            terminal_colors = true,
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = false,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },
            strikethrough = true,

            invert_selection = false,
            invert_signs = false,

            invert_tabline = false,        -- ❗必须关掉
            invert_intend_guides = false,

            inverse = true,
            contrast = "",
            palette_overrides = {},
            overrides = {},

            dim_inactive = false,

            transparent_mode = true,      -- ✅ 保留
        })

    end


}
