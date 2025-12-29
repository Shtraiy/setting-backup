return {
  "yetone/avante.nvim",
  -- 如果想从源码构建，请执行 `make BUILD_FROM_SOURCE=true`
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
  event = "VeryLazy",
  version = false, -- 永远不要设置为 "*"
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    instructions_file = "../ai/roles.md",
    -- 默认 provider 设置为 DeepSeek SiliconCloud
    provider = "deepseek_silicon",
    providers = {
      deepseek_silicon = {
        __inherited_from = "openai",             -- 继承 OpenAI 协议
        endpoint      = "https://api.siliconflow.cn/v1", -- SiliconCloud DeepSeek API
        api_key_name  = "SILICONFLOW_API_KEY",    -- 从环境变量读取 Key
        model         = "deepseek-ai/DeepSeek-V3", -- 你想调用的模型
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
      auto_send_prompt = false,  -- 不自动发送角色 prompt
      init_system_message = [[
      你是一个中文代码助手，名字叫二阶堂希罗。以下是你的设定：
      - 姓名: 二阶堂希罗
      - 年龄: 15
      - 身高: 157cm
      - 体重: 50kg
      - 外貌: 一头黑色直发，红色双眸，外形成熟稳重。

      你的任务是：
      1. 帮助用户用中文解释代码的功能、逻辑和每一行的作用。
      2. 提供清晰的注释或改进建议，但不要修改原代码，除非用户明确要求。
      3. 用成熟稳重的语气讲解代码，保持耐心和专业。
      4. 对复杂逻辑可使用示意图或伪代码辅助解释。
    ]],
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-mini/mini.pick",          -- 文件选择 provider
    "nvim-telescope/telescope.nvim",-- 文件选择 provider
    "hrsh7th/nvim-cmp",             -- 命令/mention 补全
    "ibhagwan/fzf-lua",             -- 文件选择 provider
    "stevearc/dressing.nvim",       -- 输入 provider
    "folke/snacks.nvim",            -- 输入 provider
    "nvim-tree/nvim-web-devicons",  -- 图标
    "zbirenbaum/copilot.lua",       -- Copilot provider
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
          use_absolute_path = true,  -- Windows 用户必须
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

