vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- 跳转到行尾
keymap.set("v", "-", "$") 
keymap.set('v', '<Space>', ':norm I <CR>gv', { noremap = true, silent = true })

-- 增加缩进并保持选区
keymap.set('v', '>', '>gv', { noremap = true, silent = true })
-- 减少缩进并保持选区
keymap.set('v', '<', '<gv', { noremap = true, silent = true })

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口
keymap.set("n", "-", "$") -- 跳转到行尾
keymap.set("n", "J", "j")
keymap.set("n", "K", "k")

-- Lsp Definition
keymap.set("n", "<leader>d", '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })

-- ---------- 终端模式 ---------- ---

keymap.set("t", "<Esc>", "<A-\\><A-n>", {noremap = true, silent = true})

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>", { noremap = true, silent = true })

-- 切换buffer
keymap.set("n", "<A-l>", ":bnext<CR>", { noremap = true, silent = true })
keymap.set("n", "<A-h>", ":bprevious<CR>", { noremap = true, silent = true })
keymap.set("n", "<A-b>", ":bdelete!<CR>", { noremap = true, silent = true })   

-- ---------- 替换模式 ---------- ---
keymap.set('n', 'R', '<Nop>', { noremap = true, silent = true })

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- noice


