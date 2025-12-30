return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "moon",       -- ⭐ Moon
      dark_variant = "moon",

      disable_background = true,       -- ⭐ 主背景透明
      disable_float_background = true, -- ⭐ 浮窗透明

      styles = {
        transparency = true,
      },

      highlight_groups = {
        -- Tabline / barbar 兜底透明
        TabLine = { bg = "none" },
        TabLineFill = { bg = "none" },
        TabLineSel = { bg = "none", bold = true },

        BufferTablineFill = { bg = "none" },

        -- Noice / popup
        NoiceCmdlinePopupBorder = { fg = "foam" },

        -- 分隔线更柔和
        VertSplit = { fg = "overlay", bg = "none" },
      },
    })

    vim.cmd("colorscheme rose-pine")
  end,
}


