require("config.options")
require("config.keymaps")
require("config.lazy")
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
vim.cmd([[highlight IncSearch guifg=#f9f5d7 ]])
vim.cmd([[highlight Search guifg=#f9f5d7 ]])

vim.cmd([[highlight IlluminatedWordText gui=underline ]])
vim.cmd([[highlight IlluminatedWordRead gui=underline ]])
vim.cmd([[highlight IlluminatedWordWrite gui=underline ]])
