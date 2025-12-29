return {
  "madox2/vim-ai",
  config = function()
    -- 这是一个 Vimscript 插件，不能使用 require("vim-ai")
    -- 我们通过设置全局变量 vim.g.vim_ai_chat 来定义它的行为

    local prompt_sent = false

    function SendVimAIMessage(msg)
        local initial = msg
        if not prompt_sent then
            initial = roles.niikado_hiro .. "\n" .. msg
            prompt_sent = true
        end
        vim.g.vim_ai_chat.options.initial_prompt = initial
        vim.cmd("AI")  -- 调用 Chat 命令
    end

    
    local roles = require("ai.vim_ai_roles")
    vim.g.vim_ai_chat = {
      options = {
        -- 这里填入你的中转站地址，必须包含 /v1/chat/completions
        endpoint_url = "https://gcli.ggchan.dev/v1/chat/completions",
        
        -- 指定 Gemini 模型
        model = "gemini-3-flash-preview",
        
        -- 其他参数
        max_tokens = 2000,
        temperature = 0.7,
        auto_insert_user_prompt = 0,  -- 关闭 >>> user
        auto_send_prompt = 0,         -- 关键：关闭每次自动发送 prompt
      },
      -- 这里定义界面显示的样式，保持默认或按需修改
      ui = {
        code_syntax_enabled = 1,
        populate_options = 0,
        open_chat_command = "preset_below",
      },
      prompt = roles.niikado_hiro,
    }

    -- 如果你也想配置 Edit 模式 (选中代码进行修改)
    vim.g.vim_ai_edit = {
      options = {
        endpoint_url = "https://gcli.ggchan.dev/v1/chat/completions",
        model = "gemini-3-flash-preview",
        max_tokens = 2000,
        temperature = 0.7,
      },
      prompt = roles.niikado_hiro,
    }
  end,
}

