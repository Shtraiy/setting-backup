return{
        "akinsho/bufferline.nvim",
        config = function()
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end

        require("bufferline").setup{
        

        }
        end,
}
