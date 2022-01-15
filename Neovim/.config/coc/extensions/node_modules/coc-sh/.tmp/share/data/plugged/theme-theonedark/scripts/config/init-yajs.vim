call plug#begin()
Plug '~/github/josa42/theme-theonedark/dist/vim'
Plug 'othree/yajs.vim'
call plug#end()

execute 'source ' . expand('<sfile>:p:h') . '/init.vim'
