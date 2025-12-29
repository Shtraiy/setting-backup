-- lua/plugins/fidget.lua
return {
  "j-hui/fidget.nvim",
  opts = {
    notification = {
      override_vim_notify = false, -- 🔑 必须关
    },
    progress = {
      display = {
        render_limit = 16,
      },
    },
  },
}

