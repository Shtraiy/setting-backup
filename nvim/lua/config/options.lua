local opt = vim.opt

-- 编码方式 utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

--行号
opt.relativenumber = false
opt.number = true

--缩进
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

--防止包裹
opt.wrap = false

--光标行
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

--启动鼠标
opt.mouse:append("a")

--系统剪切板
opt.clipboard:append("unnamedplus")

--默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

--搜索
opt.ignorecase = true
opt.smartcase = true

-- 自动加载外部修改
vim.o.autoread = true
vim.bo.autoread = true

--外观
opt.termguicolors = true
opt.signcolumn = "yes"
opt.laststatus = 3
opt.cmdheight = 2

--禁止创建备份文件
opt.backup = false
opt.writebackup = false
--




