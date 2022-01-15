call plug#begin()
Plug '~/github/josa42/theme-theonedark/dist/vim'
call plug#end()

execute 'source ' . expand('<sfile>:p:h') . '/init.vim'
