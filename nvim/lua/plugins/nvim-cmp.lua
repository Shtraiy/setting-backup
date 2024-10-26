return {
    "hrsh7th/nvim-cmp",
	dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip", -- snippets引擎，不装这个自动补全会出问题
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "hrsh7th/cmp-path", -- 文件路径
    },
    config = function()   
            local cmp_status_ok, cmp = pcall(require, "cmp")
            if not cmp_status_ok then
            return
            end

            local snip_status_ok, luasnip = pcall(require, "luasnip")
            if not snip_status_ok then
            return
            end

            require("luasnip.loaders.from_vscode").lazy_load()

            -- 下面会用到这个函数
            local check_backspace = function()
            local col = vim.fn.col "." - 1
            return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
            end


            cmp.setup({
            snippet = {
                expand = function(args)
                require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.abort(),  -- 取消补全，esc也可以退出
                ['<CR>'] = cmp.mapping.confirm({ select = true }),

                ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expandable() then
                    luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif check_backspace() then
                    fallback()
                else
                    fallback()
                end
                end, {
                "i",
                "s",
                }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
                end, {
                "i",
                "s",
                }),
            }),

            -- 这里重要
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
            }, {
                { name = 'buffer' },
            })
            })
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
    end 
}
