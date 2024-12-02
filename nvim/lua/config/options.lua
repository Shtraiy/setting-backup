local opt = vim.opt


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

--启动鼠标
opt.mouse:append("a")

--系统剪切板
opt.clipboard:append("unnamed")


--默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

--搜索
opt.ignorecase = true
opt.smartcase = true

--外观
opt.termguicolors = true
opt.signcolumn = "yes"
opt.laststatus = 3

--




