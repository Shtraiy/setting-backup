return{
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        label = {
            uppercase = false,
            after = false,
            before = true,
            style = "overlay",
            rainbow = {
                enabled = true,
                -- number between 1 and 9
                shade = 6,
            },
        }
    },
    keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
}
