return {
  -- Mason 本体
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        },
        npm_registry = "https://registry.npmmirror.com/",
      })
    end
  },

  -- Mason + lspconfig 集成
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "lua_ls", "rust_analyzer", "cmake", "pyright" },
        automatic_installation = true,
      })
    end
  }
}

