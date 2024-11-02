vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "-", "$") -- 跳转到行尾

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口
keymap.set("n", "-", "$") -- 跳转到行尾

-- ---------- 终端模式 ---------- ---

keymap.set("t", "<Esc>", "<A-\\><A-n>", {noremap = true, silent = true})

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<A-l>", ":bnext<CR>")
keymap.set("n", "<A-h>", ":bprevious<CR>")
keymap.set("n", "<A-b>", ":bdelete!<CR>")   

-- ---------- 替换模式 ---------- ---
keymap.set('n', 'R', '<Nop>', { noremap = true, silent = true })
keymap.set('n', 'r', '<Nop>', { noremap = true, silent = true })


-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")

-- noice


