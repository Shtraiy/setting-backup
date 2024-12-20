-- 背景配置
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
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

-- Noice配置
vim.cmd([[highlight NoiceCmdlinePopupBorder guifg=#ebdbb2 ]])
