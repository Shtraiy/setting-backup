vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- ---------- 插入模式 ---------- ---

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- 跳转到行尾
keymap.set("v", "-", "$") 

-- 增加缩进并保持选区
keymap.set('v', '>', '>gv', { noremap = true, silent = true })
-- 减少缩进并保持选区
keymap.set('v', '<', '<gv', { noremap = true, silent = true })

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "K", "5k", { noremap = true, silent = true })
keymap.set("n", "J", "5j", { noremap = true, silent = true })
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口
keymap.set("n", "<C-v>", "<Nop>", { noremap = true, silent = true })
keymap.set('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true })
keymap.set('n', '<leader>s', ':lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
keymap.set('n', '=', '<nop>', { noremap = true, silent = true })

-- 将 `n` 绑定为跳转到上一个匹配项
keymap.set('n', 'n', 'N', { noremap = true, silent = true })

-- 将 `N` 绑定为跳转到下一个匹配项
keymap.set('n', 'N', 'n', { noremap = true, silent = true })

-- Lsp Definition
keymap.set("n", "<leader>d", '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })

-- 取消高亮
keymap.set("n", "<leader>ch", ":nohl<CR>", { noremap = true, silent = true })

-- 切换buffer
keymap.set("n", "<A-l>", ":bnext<CR>", { noremap = true, silent = true })
keymap.set("n", "<A-h>", ":bprevious<CR>", { noremap = true, silent = true })
keymap.set("n", "<A-b>", ":bdelete!<CR>", { noremap = true, silent = true })   


-- ---------- 替换模式 ---------- ---
keymap.set('n', 'R', '<Nop>', { noremap = true, silent = true })

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Zen 
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "Toggle Zen Mode", noremap = true, silent = true })



-- Avante
-- 对选中代码进行补全
keymap.set("v", "<leader>aa", ":AvanteComplete<CR>", opts)

keymap.set("n", "<leader>cl", function() avante.clear() end, { noremap = true, silent = true })

-- 对选中代码进行编辑/重构
keymap.set("v", "<leader>ae", ":AvanteEdit<CR>", opts)

-- 切换侧边栏
keymap.set("n", "<leader>as", ":AvanteToggleSidebar<CR>", opts)

-- Lspsaga
-- Hover 文档
keymap.set("n", "H", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- 重命名
keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Code Action
keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- 查看定义（不跳转，预览）
keymap.set("n", "<leader>gg", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- 查看引用
keymap.set("n", "<leader>gr", "<cmd>Lspsaga finder<CR>", { silent = true })

-- 诊断信息
keymap.set("n", "<leader>ge", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- 上下诊断跳转
keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

