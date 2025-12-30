return {
  "yetone/avante.nvim",
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
  event = "VeryLazy",
  version = false, -- 永远不要设置为 "*"
  opts = {
      instructions_file = "../ai/roles.md",
      -- 默认 provider 设置为 DeepSeek SiliconCloud
      provider = "deepseek_silicon",
      providers = {
        deepseek_silicon = {
          __inherited_from = "openai",
          endpoint      = "https://api.siliconflow.cn/v1",
          api_key_name  = "SILICONFLOW_API_KEY",
          model         = "deepseek-ai/DeepSeek-V3",
          timeout       = 30000,
          extra_request_body = {
            temperature = 0.7,
            max_tokens  = 20000,
          },
        },
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-sonnet-4-20250514",
          timeout = 30000,
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
        moonshot = {
          endpoint = "https://api.moonshot.ai/v1",
          model = "kimi-k2-0711-preview",
          timeout = 30000,
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 32768,
          },
        },
      },
      ui = {
        border = "rounded",
        winblend = 0,
        code_syntax = true,
      },
      history = {
        enable = true,
        max_items = 50,
      },
      chat = {
        toggle_window = true,
        auto_send_prompt = true,
      },
      -- 添加默认 prompt
      default_prompt = "请帮我分析这段代码的性能瓶颈，并优化。",
  },
  config = function(_, opts)
    local status, avante = pcall(require, "avante")
    if not status then return end

    avante.setup(opts)

    -- 设置 toggle 快捷键 <leader>a
    vim.keymap.set("n", "<leader>cc", function()
      avante.toggle()
    end, { noremap = true, silent = true })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-mini/mini.pick",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "stevearc/dressing.nvim",
    "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
          use_absolute_path = true,
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = { file_types = { "markdown", "Avante" } },
      ft = { "markdown", "Avante" },
    },
  },
}

