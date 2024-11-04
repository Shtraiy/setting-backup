return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",
        "ray-x/cmp-treesitter",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip"
    },
    config = function()
        -- kind_icons
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
        -- 设置 pumheight 的值
        vim.o.pumheight = 10,  -- 设置弹出菜单的最大高度为 5
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.scroll_docs(-4),
                ['<C-j>'] = cmp.mapping.scroll_docs(4),
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
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = {
                        menu = 60, -- leading text (labelDetails)
                        abbr = 10, -- actual suggestion item
                    },
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
                            spell = "[spell]",
                        })[entry.source.name]
                        return vim_item
                    end,
                }),
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp', priority = 999 },
                { name = 'path', priority = 99 },
                { name = 'luasnip', priority = 1000 },
                { name = 'treesitter', priority = 100 },
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

            -- LSP配置
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')
            local servers = { 'pyright', 'lua_ls', 'rust_analyzer', 'ast_grep'}  -- 添加你需要的 LSP
            for _, server in ipairs(servers) do
                lspconfig[server].setup {
                    capabilities = capabilities
                }
            end
            
            -- harper-ls设置
            lspconfig['harper_ls'].setup{
                capabilities = capabilities,
                settings = {
                    ["harper-ls"] = {
                        userDictPath = "~/dict.txt",
                        fileDictPath = "~/.harper/", linters = {
                            spell_check = false,
                            spelled_numbers = false,
                            an_a = true,
                            sentence_capitalization = false,
                            unclosed_quotes = true,
                            wrong_quotes = false,
                            long_sentences = false,
                            repeated_words = true,
                            spaces = true,
                            matcher = true,
                            correct_number_suffix = true,
                            number_suffix_capitalization = true,
                            multiple_sequential_pronouns = true,
                            linking_verbs = false,
                            avoid_curses = true,
                            terminating_conjunctions = true
                        }
                    }
                },
            }
        end
}
