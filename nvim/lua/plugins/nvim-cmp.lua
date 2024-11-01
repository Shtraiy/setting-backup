return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-calc",
        "f3fora/cmp-spell",
        "onsails/lspkind.nvim",
        "ray-x/cmp-treesitter",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "zbirenbaum/copilot-cmp",
        "zbirenbaum/copilot.lua"
    },
    config = function()
        -- icon
        local kind_icons = {
            Class = "∴",
            Color = "🖌",
            Constant = "𝜋",
            Constructor = '⌬',
            Enum = "",
            EnumMember = "",
            Event = "",
            Field = "",
            File = "",
            Folder = "",
            Function = "ƒ",
            Interface = "",
            Keyword = "󰌆",
            Method = "𝘮",
            Module = "",
            Operator = "≠",
            Property = "∷",
            Reference = "⊷",
            Snippet = "{}",
            Struct = "",
            Text = "𝓣",
            TypeParameter = "×",
            Unit = "()",
            Variable = "𝓧",
            Copilot = "",
        }
        local types = require("cmp.types")
        local str = require("cmp.utils.str")
        local lspkind = require("lspkind")

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
            sorting = {
                priority_weight = 2,
                comparators = {
                    require("copilot_cmp.comparators").prioritize,

                    -- Below is the default comparitor list and order for nvim-cmp
                    cmp.config.compare.offset,
                    -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
            window = {
                documentation = cmp.config.window.bordered(),
                completion = cmp.config.window.bordered(),
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = {
                        menu = 50, -- leading text (labelDetails)
                        abbr = 10, -- actual suggestion item
                    },
                    vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"}),
                    ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                    before = function(entry, vim_item)
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[NLUA]",
                            treesitter = "[Tree]",
                            path = "[Path]",
                            buffer = "[Buffer]",
                            zsh = "[zsh]",
                            luasnip = "[LuaSnip]",
                            copilot = "[Copilot]",
                            spell = "[spell]",
                        })[entry.source.name]
                        return vim_item
                    end,
                    }),
                },
                sources = cmp.config.sources({
                    { name = 'copilot', },
                    { name = 'nvim_lsp', },
                    { name = 'path', },
                    { name = 'luasnip', },
                }, {
                    { name = 'buffer' },
                })            })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                 { name = "cmdline" },
            }),
        })

        local sign = function(opts)
            vim.fn.sign_define(opts.name, {
                texthl = opts.name,
                text = opts.text,
                numhl = "",
            })
        end

        sign({ name = "DiagnosticSignError", text = "✘" })
        sign({ name = "DiagnosticSignWarn", text = "▲" })
        sign({ name = "DiagnosticSignHint", text = "⚑" })
        sign({ name = "DiagnosticSignInfo", text = "" })

        
        vim.diagnostic.config({
            virtual_text = true,
            --virtual_text = false,
            severity_sort = true,
            signs = true,
            update_in_insert = false,
            underline = false,
            float = {
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')
            local servers = { 'clangd', 'pyright', 'lua_ls', 'rust-analyzer'}  -- 添加你需要的 LSP
            for _, server in ipairs(servers) do
                lspconfig[server].setup {
                    capabilities = capabilities
                }
            end
        end
}
