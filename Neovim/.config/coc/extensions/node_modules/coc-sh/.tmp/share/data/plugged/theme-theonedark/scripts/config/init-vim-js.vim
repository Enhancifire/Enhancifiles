call plug#begin()
Plug '~/github/josa42/theme-theonedark/dist/vim'
Plug 'yuezk/vim-js'                     " javaScript (without jsx)
Plug 'maxmellon/vim-jsx-pretty'         " jsx / javascriptreact
call plug#end()

execute 'source ' . expand('<sfile>:p:h') . '/init.vim'
