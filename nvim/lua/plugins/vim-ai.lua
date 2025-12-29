-- 插件列表
return {
  {
    "madox2/vim-ai",
    lazy = false,  -- 启动时加载
    config = function()
      -- =============================
      -- 1️⃣ 设置中转站和 API Key
      -- =============================
      -- 假设你已经在 https://gcli.ggchan.dev/ 生成了 token
      local api_token = os.getenv("GCLI_TOKEN") or "YOUR_API_TOKEN_HERE"

      -- 设置 vim-ai 的自定义 endpoint 和模型
      vim.g.ai_provider = "custom"  -- 使用自定义 provider
      vim.g.ai_custom_endpoint = "https://gcli.ggchan.dev/v1/chat/completions"
      vim.g.ai_model = "gemini-3-flash-preview"
      vim.g.ai_token = api_token

      -- =============================
      -- 2️⃣ 设置临时目录（可选）
      -- =============================
      local tmpdir = "/tmp/vim-ai"
      os.execute("mkdir -p " .. tmpdir)
      vim.env.TMPDIR = tmpdir
      vim.env.TMP = tmpdir
      vim.env.TEMP = tmpdir

      -- =============================
      -- 3️⃣ 快捷键绑定
      -- =============================
      local opts = { noremap = true, silent = true }

      -- 普通生成 / 补全
      vim.api.nvim_set_keymap("n", "<leader>ai", ":AI<CR>", opts)

      -- 编辑选中内容
      vim.api.nvim_set_keymap("v", "<leader>ae", ":AIEdit<CR>", opts)

      -- 聊天
      vim.api.nvim_set_keymap("n", "<leader>ac", ":AIChat<CR>", opts)
      vim.api.nvim_set_keymap("n", "<leader>as", ":AIStopChat<CR>", opts)
      vim.api.nvim_set_keymap("n", "<leader>ar", ":AIRedo<CR>", opts)
    end
  }
}

