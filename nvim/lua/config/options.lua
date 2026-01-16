local opt = vim.opt

-- 编码设置（新增/修改部分）
opt.encoding = "utf-8"          -- Vim内部处理使用的编码
opt.fileencoding = "utf-8"      -- 文件保存时的默认编码
opt.fileencodings = "utf-8,ucs-bom,gbk,gb2312,cp936,latin1"  -- 读取文件时尝试的编码列表

-- 缓冲
opt.showtabline = 2

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
opt.clipboard = "unnamedplus"

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


---自动切换cwd
opt.autochdir = true


