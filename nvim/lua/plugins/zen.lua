-- 文件路径: lua/plugins/zen.lua
-- 使用 lazy.nvim 模块化加载 zen-mode.nvim
return {
  "folke/zen-mode.nvim",
  lazy = true,            -- 懒加载
  cmd = "ZenMode",        -- 当执行 :ZenMode 时加载
  config = function()
    local zen = require("zen-mode")
    zen.setup({
      -- 窗口配置
      window = {
        width = 80,       -- 编辑窗口宽度
        height = 1,       -- 高度按比例自适应
        options = {
          number = true,   -- 显示行号
          relativenumber = false,
          cursorline = true,
        },
      },
      -- UI 元素隐藏
      plugins = {
        options = {
          ruler = false,   -- 隐藏状态栏标尺
          showcmd = false, -- 隐藏命令显示
        },
        twilight = { enabled = true }, -- 与 twilight.nvim 联动，高亮当前代码块
        gitsigns = { enabled = false }, -- 隐藏 git 标记
        tmux = { enabled = true },     -- tmux 支持
      },
      -- 进入/退出 Zen 模式时的回调
      on_open = function()
        vim.notify("进入 Zen 模式", vim.log.levels.INFO)
      end,
      on_close = function()
        vim.notify("退出 Zen 模式", vim.log.levels.INFO)
      end,
    })

  end,
}

