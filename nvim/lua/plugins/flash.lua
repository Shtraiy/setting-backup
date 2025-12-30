return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
      -- 不配置 search / treesitter / remote，即不启用这些插件
      -- 保留 char 模式
      modes = {
          char = {
              enabled = true,
          },
      },
      jump = { autojump = false }, -- 禁止自动跳转提示
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
  config = function(_, opts)
      require("flash").setup(opts)

      -- 安全取消 f 和 t 的映射
local modes = { "n", "x", "o" }
local keys = { "f", "t" }

for _, mode in ipairs(modes) do
  for _, key in ipairs(keys) do
    if vim.fn.mapcheck(key, mode) ~= "" then
      vim.keymap.del(mode, key)
    end
  end
end


      -- 手动映射 s / S
      vim.keymap.set({"n", "x", "o"}, "s", function()
          require("flash").jump()
      end, { desc = "Flash s jump" })

      vim.keymap.set({"n", "x", "o"}, "S", function()
          require("flash").treesitter()
      end, { desc = "Flash S jump" })
  end
}

