return{
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require("lspconfig").lua_ls.setup {
      capabilities = capabilities,
      }
  end

}