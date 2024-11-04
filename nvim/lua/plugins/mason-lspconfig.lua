return{
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },
  
    config = function()
       require("mason-lspconfig").setup{
            ensure_installed = {'harper_ls', 'ast_grep', 'lua_ls', 'pyright', 'rust_analyzer'},
        }
    end


}
