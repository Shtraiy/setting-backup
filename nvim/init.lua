require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.highlight")

vim.g.python3_host_prog = "/usr/bin/python3"  -- 替换成你 which python3 的路径

vim.g.vim_ai_roles_config_file = '~/.config/nvim/lua/ai/roles.ini'

