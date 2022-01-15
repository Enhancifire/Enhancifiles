call plug#begin()
Plug '~/github/josa42/theme-theonedark/dist/vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

execute 'source ' . expand('<sfile>:p:h') . '/init.vim'

