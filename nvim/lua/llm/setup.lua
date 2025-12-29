local spinner = require("plugins.llm.fidget-spinner")

require("llm").setup({
  -- ================================
  -- Providers
  -- ================================
  providers = {
    gemini = {
      type = "openai_compatible",

      url = "https://gcli.ggchan.dev/v1/chat/completions",

      env = {
        api_key = function()
          return os.getenv("GEMINI_API_KEY")
        end,
      },

      model = "gemini-3.0-flash",

      params = {
        temperature = 0.7,
        max_tokens = 2048,
        stream = false, -- 🔥 非常重要：禁用 stream
      },
    },
  },

  -- ================================
  -- Hooks（替代 CodeCompanion User 事件）
  -- ================================
  hooks = {
    request_start = function(ctx)
      spinner.on_request_start(ctx)
    end,

    request_end = function(ctx)
      spinner.on_request_end(ctx)
    end,
  },

  -- ================================
  -- UI / Behavior
  -- ================================
  ui = {
    chat = {
      border = "rounded",
    },
  },

  -- 默认 provider
  default_provider = "gemini",
})

