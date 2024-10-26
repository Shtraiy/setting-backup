return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            local keymap_list = {
                { key = { "<CR>", "o", "l", "<2-LeftMouse>" }, action = "edit" },
                { key = "h", action = "close_node" },
                { key = "p", action = "preview" },
                { key = "<C-r>", action = "refresh" },
                { key = "yn", action = "copy_name" },
                { key = "yp", action = "copy_path" },
                { key = "yy", action = "copy_absolute_path" },
                { key = "a", action = "create" },
                { key = "d", action = "remove" },
                { key = "r", action = "rename" },
                { key = "I", action = "toggle_git_ignored" },
                { key = "R", action = "collapse_all" },
                { key = "?", action = "toggle_help" },
            },
            require("nvim-tree").setup {}
        end
    }
}
