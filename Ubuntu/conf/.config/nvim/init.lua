-- global scope

vim.o.backgroun = 'light'

-- window-scoped options

vim.wo.colorcolumn = '80'

-- buffer-scoped options


-- opt

vim.opt.autowrite = true

vim.opt.cursorline = true

vim.opt.autoindent = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.showmatch = true

vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wrap = false


vim.opt.errorformat:append('%f|%l col %c|%m')

-- vim-plug

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('dense-analysis/ale')
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug('sheerun/vim-polyglot')
Plug('nbouscal/vim-stylish-haskell')

vim.call('plug#end')