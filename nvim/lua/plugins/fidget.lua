return{
  "j-hui/fidget.nvim",
  opts = {
      text = {
          spinner = "dots",    -- 动画样式
          done = "✓",          -- 完成标记
      },
      window = {
          blend = 100,         -- 完全透明
          border = "none",     -- 无边框
          relative = "editor",
          zindex = 40,
      },
  },
  config = function()
      require("fidget").setup({
      })
  end,
}
