return{
  -- AI-powered coding companion plugin
  "olimorris/codecompanion.nvim",
  dependencies = {
    -- General Lua utility functions
    "nvim-lua/plenary.nvim",
    -- Syntax parsing and highlighting
    "nvim-treesitter/nvim-treesitter",
    -- Progress notification UI
    "j-hui/fidget.nvim",
  },
  init = function()
      require("ai.fidget-codecompanion"):init()
  end,
  config = function()
      require("codecompanion").setup({
          adapters = {
              siliconflow_r1 = function()
                  return require("codecompanion.adapters").extend("deepseek", {
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
                              choices = {
                                  ["deepseek-ai/DeepSeek-R1"] = { opts = { can_reason = true } },
                                  "deepseek-ai/DeepSeek-V3",
                              },
                          },
                      },
                  })
              end,

              gemini = function()
                  return require("codecompanion.adapters").extend("openai_compatible", {
                      name = "gemini",
                      url = "https://hajimi.wynio.pw/v1/chat/completions",
                      env = {
                          api_key = function()
                              return os.getenv("GEMINI_API_KEY")
                          end,
                      },
                      schema = {
                          model = {
                              default = "gemini-2.5-flash-preview-04-17-thinking",
                              -- choices = {
                              --     ["gemini-2.5-flash-preview-05-20"] = { opts = { can_reason = true } },
                              --     "gemini-2.5-flash-preview-04-17-thinking",
                              -- },
                          },
                      },
                  })
              end,

              siliconflow_v3 = function()
                  return require("codecompanion.adapters").extend("openai_compatible", {
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
                              choices = {
                                  "deepseek-ai/DeepSeek-V3",
                                  ["deepseek-ai/DeepSeek-R1"] = { opts = { can_reason = true } },
                              },
                          },
                      },
                  })
              end,
          },
          opts = {
              language = "Chinese",
          },
          strategies = {
              chat = { adapter = "siliconflow_r1" },
              inline = { adapter = "gemini" },
          },
          prompt_library = {
              ["DeepSeek Explain"] = require("ai.prompts.deepseek-explain"),
              ["Nextjs Agant"] = require("ai.prompts.deepseek-explain"),
          },
      })
  end,
}
