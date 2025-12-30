-- 背景配置
-- vim.cmd([[colorscheme tokyonight]])
vim.cmd("colorscheme rose-pine")
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

-- 高亮组配置

-- Flash配置
vim.cmd([[highlight IncSearch guifg=#f9f5d7 ]])
vim.cmd([[highlight Search guifg=#f9f5d7 ]])


-- Illuminate配置
vim.cmd([[highlight IlluminatedWordWrite gui=none guibg=#504945 ]])
vim.cmd([[highlight IlluminatedWordText gui=none ]])
vim.cmd([[highlight IlluminatedWordRead gui=none guibg=#504945 ]])

-- Treesitter配置
-- asm配置 
vim.cmd([[highlight Function guifg=#30db97 ]])
vim.cmd([[highlight link @variable.builtin GruvboxAqua]])


-- 针对 Fidget 标题的高亮，设置背景透明（假设你的终端/Neovim 支持透明背景）
vim.api.nvim_set_hl(0, "FidgetTitle", { bg = "none" })  
-- 针对 Fidget 任务内容的高亮，设置背景透明
vim.api.nvim_set_hl(0, "FidgetTask", { bg = "none" })


vim.cmd("highlight! link AlphaHeader Statement")
vim.cmd("highlight! link AlphaButtons Identifier")
vim.cmd("highlight! link AlphaFooter Comment")


-- =========================
-- Tabline / Buffer 透明
-- =========================

local none = "none"

-- tabline 本体
vim.api.nvim_set_hl(0, "TabLine",      { bg = none })
vim.api.nvim_set_hl(0, "TabLineFill",  { bg = none })
vim.api.nvim_set_hl(0, "TabLineSel",   { bg = none, bold = true })

-- mini.tabline 使用的高亮
vim.api.nvim_set_hl(0, "MiniTablineCurrent",  { bg = none, bold = true })
vim.api.nvim_set_hl(0, "MiniTablineVisible",  { bg = none })
vim.api.nvim_set_hl(0, "MiniTablineHidden",   { bg = none })


-- 修饰 / 分隔
vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { bg = none })
vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", { bg = none })
vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden",  { bg = none })

-- 分割线颜色 = 普通文字颜色
local normal_fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg

vim.api.nvim_set_hl(0, "MiniTablineSeparator", {
  fg = normal_fg,
  bg = none,
})

