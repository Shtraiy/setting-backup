return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",
        "ray-x/cmp-treesitter",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
        "tzachar/cmp-ai",
        "yetone/avante.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then return end

        local luasnip_status_ok, luasnip = pcall(require, "luasnip")
        if not luasnip_status_ok then return end

        local lspkind_status_ok, lspkind = pcall(require, "lspkind")
        if not lspkind_status_ok then return end

        require("luasnip.loaders.from_vscode").lazy_load()

        local check_backspace = function()
            return vim.fn.col('.') == 1 or vim.fn.getline('.'):sub(vim.fn.col('.') - 1, vim.fn.col('.') - 1):match("%s")
        end

        vim.o.pumheight = 10

        -- AI 配置
        local cmp_ai_ok, cmp_ai = pcall(require, "cmp_ai")
        if cmp_ai_ok then
            cmp_ai.setup({
                providers = { avante = {} },
            })
        end

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif check_backspace() then
                        fallback()
                    else
                        fallback()
                    end
                end, { "i", "s", "c" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s", "c" }),

                ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-j>"] = cmp.mapping.scroll_docs(4),
                ["<C-k>"] = cmp.mapping.scroll_docs(-4),
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    before = function(entry, vim_item)
                        vim_item.menu = ({
                            ai = "[AI]",
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[LUA]",
                            treesitter = "[Tree]",
                            path = "[Path]",
                            buffer = "[Buffer]",
                            luasnip = "[LuaSnip]",
                        })[entry.source.name]
                        return vim_item
                    end,
                }),
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = cmp.config.sources({
                { name = "ai" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" },
                { name = "treesitter" },
            }),
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })

        vim.diagnostic.config({
            virtual_text = { spacing = 2, prefix = "●" },
            severity_sort = true,
            update_in_insert = false,
            underline = true,
            float = {
                border = "rounded",
                source = "always",
            },
        })

        local capabilities =
        vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )

        local servers = {
            pyright = {},
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            },
            rust_analyzer = {},
            clangd = {},
            cmake = {},
        }

        for server, config in pairs(servers) do
            vim.lsp.config(server, vim.tbl_deep_extend("force", {
                capabilities = capabilities,
            }, config))

            vim.lsp.enable(server)
        end



    end
}




