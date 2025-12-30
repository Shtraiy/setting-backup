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

              -- 文件图标
              local icon = ""
              if has_devicons then
                  local ext = vim.fn.fnamemodify(name, ":e")
                  icon = devicons.get_icon(name, ext, { default = true }) .. " "
              end

              -- 高亮组
              local hl = (b.bufnr == cur)
                  and "%#MiniTablineCurrent#"
                  or "%#MiniTablineHidden#"

              -- 拼接 buffer: 前后空格 + 图标 + 名字 + 前后空格
              local buf_text = " " .. icon .. name .. " "

              s = s .. hl .. buf_text

              -- 分隔线：前后空格 + "|" + 前后空格
              if i < #bufs then
                  s = s .. "%#MiniTablineSeparator# | "
              end
          end

          return s
      end

      -- 关闭 buffer 或退出 Neovim
      local function close_buffer_or_exit()
          local bufs = vim.tbl_filter(function(buf)
              return vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted")
          end, vim.api.nvim_list_bufs())

          if #bufs <= 1 then
              vim.cmd("qa") -- 退出所有窗口
          else
              vim.cmd("bdelete!")
          end
      end
      vim.keymap.set("n", "<leader>q", close_buffer_or_exit, { desc = "Close buffer or exit Neovim" })
  end,
}


