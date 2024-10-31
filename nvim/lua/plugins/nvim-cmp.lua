return {
    "hrsh7th/nvim-cmp",
	dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip"
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
            window = {
              documentation = cmp.config.window.bordered(),
              completion = cmp.config.window.bordered(),
            },
            formatting = {
                -- Set order from left to right
                -- kind: single letter indicating the type of completion
                -- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
                -- menu: extra text for the popup menu, displayed after "word" or "abbr"
                fields = { 'abbr', 'menu' },

                -- customize the appearance of the completion menu
                format = function(entry, vim_item)
                    vim_item.menu = ({
                        nvim_lsp = '[Lsp]',
                        luasnip = '[Luasnip]',
                        buffer = '[Variable]',
                        path = '[Path]',
                    })[entry.source.name]
                    return vim_item
                end,
            },
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
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('lspconfig')['clangd'].setup {
            capabilities = capabilities
        }
        require('lspconfig')['pyright'].setup {
            capabilities = capabilities
        }
        require('lspconfig')['lua_ls'].setup {
            capabilities = capabilities
        }
        require('lspconfig')['harper_ls'].setup {
            capabilities = capabilities
        }
    end
}
