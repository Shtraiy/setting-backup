return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
      require("mini.tabline").setup({
          show_icons = true,
          set_vim_settings = true,
      })

      -- 接管 tabline
      vim.o.tabline = "%!v:lua.TablineRender()"

      local has_devicons, devicons = pcall(require, "nvim-web-devicons")

      function _G.TablineRender()
          local s = ""
          local bufs = vim.fn.getbufinfo({ buflisted = 1 })
          local cur = vim.api.nvim_get_current_buf()

          for i, b in ipairs(bufs) do
              local name = vim.fn.fnamemodify(b.name, ":t")
              if name == "" then name = "[No Name]" end

              -- 文件图标 + 空格
              local icon = ""
              if has_devicons then
                  local ext = vim.fn.fnamemodify(name, ":e")
                  icon = devicons.get_icon(name, ext, { default = true }) .. " "
              end

              -- 高亮组
              local hl = (b.bufnr == cur)
                  and "%#MiniTablineCurrent#"
                  or "%#MiniTablineHidden#"

              -- 拼接 buffer
              s = s .. hl .. icon .. name .. " "

              -- 分隔线 + 前后空格
              if i < #bufs then
                  s = s .. "%#MiniTablineSeparator# | "
              end
          end

          return s
      end

      -- 自动获取 rose-moon 主题颜色
      local hl_normal = vim.api.nvim_get_hl_by_name("Normal", true)
      local hl_visual = vim.api.nvim_get_hl_by_name("Visual", true)
      local hl_comment = vim.api.nvim_get_hl_by_name("Comment", true)
      local hl_identifier = vim.api.nvim_get_hl_by_name("Identifier", true)

      local function to_hex(rgb)
          return rgb and string.format("#%06x", rgb) or "#ffffff"
      end

      -- 当前 buffer 高亮：使用 Visual 或自定义鲜艳色
      vim.api.nvim_set_hl(0, "MiniTablineCurrent", {
          bg = "NONE",
          fg = "#f38ba8", -- rose-moon 的粉色 / 鲜艳色
          bold = true,
      })

      -- 未选中 buffer 更暗
      vim.api.nvim_set_hl(0, "MiniTablineHidden", {
          bg = "NONE",
          fg = to_hex(hl_comment.foreground), -- 暗色
      })

      -- 分隔线颜色
      vim.api.nvim_set_hl(0, "MiniTablineSeparator", {
          fg = to_hex(hl_identifier.foreground),
          bg = "NONE",
      })

      -- Tabline 背景透明
      vim.api.nvim_set_hl(0, "TabLine",     { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
  end,
}

