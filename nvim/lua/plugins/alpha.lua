return {
    'goolord/alpha-nvim',
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local header = require("custom.alpha-mortis")
        -- local header = require("custom.alpha-mako")

        dashboard.section.header.val = header.val
        dashboard.section.header.opts = header.opts

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
            dashboard.button( "f", "󰈞  > Find file", ":Telescope find_files<CR>"),
            dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
            dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
            dashboard.button( "q", "󰩈  > Quit NVIM", ":qa<CR>"),
            dashboard.button( "p", "  > Plugins", ":Lazy<CR>"),
        }

        -- ============ 新增的底部信息 ============
        -- 获取插件数量（假设使用 packer.nvim）
        -- 获取lazy.nvim的插件数量
        local get_plugin_count = function()
            local lazy_stats = require("lazy").stats()
            return "⚡ Neovim loaded " .. lazy_stats.loaded .. "/" .. lazy_stats.count .. " plugins"
        end

        -- 获取当前日期
        local date = os.date("%Y-%m-%d")

        -- 设置底部信息（包含名言）
        dashboard.section.footer.val = {
            " ",  -- 空行分隔
            "Nothing is impossible to a willing heart.",  -- 名言
            get_plugin_count() .. "  |  " .. date,
        }

        -- 设置底部文字样式
        dashboard.section.footer.opts.hl = "GruvboxFg1"  -- 使用注释高亮组（通常为灰色）


        alpha.setup(dashboard.opts)

    end
    
};
