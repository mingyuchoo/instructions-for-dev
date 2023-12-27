-- global scope
vim.o.backgroun = 'light'

-- global variables
vim.g.mapleader = ' '

-- window-scoped options
vim.wo.colorcolumn = '80'

-- buffer-scoped options

-- opt
vim.opt.autowrite     = true
vim.opt.cursorline    = true
vim.opt.autoindent    = true
vim.opt.expandtab     = true
vim.opt.number        = true
vim.opt.showmatch     = true
vim.opt.termguicolors = true

vim.opt.tabstop     = 2
vim.opt.shiftwidth  = 2
vim.opt.softtabstop = 2

vim.opt.writebackup = false
vim.opt.swapfile    = false
vim.opt.backup      = false
vim.opt.wrap        = false

vim.opt.errorformat:append('%f|%l col %c|%m')


-- vim-plug
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

  Plug('dense-analysis/ale')
  Plug('neoclide/coc.nvim', {branch = 'release'})
  Plug('sheerun/vim-polyglot')
  Plug('nbouscal/vim-stylish-haskell')
  Plug('tpope/vim-surround')
  Plug('nvim-tree/nvim-web-devicons')
  Plug('nvim-tree/nvim-tree.lua')
  --Plug('github/copilot.vim')

vim.call('plug#end')


-- ALE
vim.g.ale_fix_on_save     = 1
vim.g.ale_linter_explicit = 1
vim.g.ale_fixers = { javscript = 'eslint'
                   , css       = 'prettier'
                   }

-- CoC
vim.g.coc_global_extensions = { 'coc-css'
                              , 'coc-html'
                              , 'coc-json'
                              , 'coc-eslint'
                              , 'coc-prettier'
                              , 'coc-tsserver'
                              }


-- nvim-tree
require('nvim-tree').setup()
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Leader>f', ':NvimTreeFindFile<CR>')



-- keymap for Terminal
vim.keymap.set('n', '<Leader>th', ':sp<Bar>term<CR><C-w>H<CR>')
vim.keymap.set('n', '<Leader>tj', ':sp<Bar>term<CR><C-w>J<CR>')
vim.keymap.set('n', '<Leader>tk', ':sp<Bar>term<CR><C-w>K<CR>')
vim.keymap.set('n', '<Leader>tl', ':sp<Bar>term<CR><C-w>L<CR>')
