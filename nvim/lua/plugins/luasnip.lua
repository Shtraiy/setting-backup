return {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "v2.*",
    build = "make install_jsregexp",

    config = function()
        local ls = require("luasnip")

        -- 扩展 snippet 或跳转
        vim.keymap.set({"i", "s"}, "<C-K>", function()
            if ls.expandable() then
                ls.expand()
            elseif ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true })

        -- 跳转到下一个占位符
        vim.keymap.set({"i", "s"}, "<C-L>", function()
            if ls.jumpable(1) then
                ls.jump(1)
            end
        end, { silent = true })

        -- 跳转到上一个占位符
        vim.keymap.set({"i", "s"}, "<C-J>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })

        -- ChoiceNode 切换
        vim.keymap.set({"i", "s"}, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })

        -- 加载 VSCode snippet
        require("luasnip.loaders.from_vscode").lazy_load()
    end
}


