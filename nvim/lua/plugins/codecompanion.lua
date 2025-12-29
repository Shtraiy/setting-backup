return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim",
  },

  init = function()
    require("ai.fidget-codecompanion"):init()
  end,

  config = function()
    local http = require("codecompanion.adapters.http")

    require("codecompanion").setup({
      adapters = {
        http = {
          -- DeepSeek R1（聊天）
          siliconflow_r1 = function()
            return http.extend("openai_compatible", {
              name = "siliconflow_r1",
              url = "https://api.siliconflow.cn/v1/chat/completions",
              env = {
                api_key = function()
                  return os.getenv("DEEPSEEK_API_KEY_S")
                end,
              },
              schema = {
                model = {
                  default = "deepseek-ai/DeepSeek-R1",
                },
                stream = { default = false },
                max_tokens = { default = 512 },
              },
            })
          end,

          -- DeepSeek V3（inline / 写代码）
          siliconflow_v3 = function()
            return http.extend("openai_compatible", {
              name = "siliconflow_v3",
              url = "https://api.siliconflow.cn/v1/chat/completions",
              env = {
                api_key = function()
                  return os.getenv("DEEPSEEK_API_KEY_S")
                end,
              },
              schema = {
                model = {
                  default = "deepseek-ai/DeepSeek-V3",
                },
                stream = { default = false },
                max_tokens = { default = 512 },
              },
            })
          end,
        },
      },

      opts = {
        language = "Chinese",
      },

      strategies = {
        chat = {
          adapter = "siliconflow_r1",
        },
        inline = {
          adapter = "siliconflow_v3",
        },
      },

      prompt_library = {
        ["DeepSeek Explain"] = require("ai.prompts.deepseek-explain"),
      },
    })
  end,
}

