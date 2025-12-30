return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    ui = {
      border = "rounded",
      code_action = "󰌵 ",
    },

    lightbulb = {
      enable = false, -- 你有 noice / diagnostics，不需要灯泡
    },

    symbol_in_winbar = {
      enable = false, -- 如果你不用 breadcrumb，关掉更干净
    },

    outline = {
      layout = "float",
    },

    rename = {
      in_select = false,
      auto_save = false,
    },
  },
  finder = {
      layout = "float",     -- 关键
      max_height = 0.8,
      max_width = 0.8,
      keys = {
          quit = { "q", "<Esc>" },
      },
  },
  
}

