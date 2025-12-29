local progress = require("fidget.progress")
local M = {}

M.handles = {}

local function create_handle(ctx)
  return progress.handle.create({
    title = "",
    message = " Thinking...",
    lsp_client = {
      name = string.format(
        "%s (%s)",
        ctx.provider or "LLM",
        ctx.model or "unknown"
      ),
    },
  })
end

function M.on_request_start(ctx)
  local handle = create_handle(ctx)
  M.handles[ctx.request_id] = handle
end

function M.on_request_end(ctx)
  local handle = M.handles[ctx.request_id]
  if not handle then
    return
  end

  if ctx.status == "success" then
    handle.message = "Completed"
  elseif ctx.status == "error" then
    handle.message = " Error"
  else
    handle.message = "󰜺 Cancelled"
  end

  handle:finish()
  M.handles[ctx.request_id] = nil
end

return M

