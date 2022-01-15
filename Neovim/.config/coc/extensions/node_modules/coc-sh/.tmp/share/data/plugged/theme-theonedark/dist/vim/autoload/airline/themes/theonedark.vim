" MIT License. Copyright (c) 2013-2019 Bailey Ling et al.
" vim: et ts=2 sts=2 sw=2 tw=80

scriptencoding utf-8

" Airline themes are generated based on the following concepts:
"   * The section of the status line, valid Airline statusline sections are:
"       * airline_a (left most section)
"       * airline_b (section just to the right of airline_a)
"       * airline_c (section just to the right of airline_b)
"       * airline_x (first section of the right most sections)
"       * airline_y (section just to the right of airline_x)
"       * airline_z (right most section)
"   * The mode of the buffer, as reported by the :mode() function.  Airline
"     converts the values reported by mode() to the following:
"       * normal
"       * insert
"       * replace
"       * visual
"       * inactive
"       The last one is actually no real mode as returned by mode(), but used by
"       airline to style inactive statuslines (e.g. windows, where the cursor
"       currently does not reside in).
"   * In addition to each section and mode specified above, airline themes
"     can also specify overrides.  Overrides can be provided for the following
"     scenarios:
"       * 'modified'
"       * 'paste'
"
" Airline themes are specified as a global viml dictionary using the above
" sections, modes and overrides as keys to the dictionary.  The name of the
" dictionary is significant and should be specified as:
"   * g:airline#themes#<theme_name>#palette
" where <theme_name> is substituted for the name of the theme.vim file where the
" theme definition resides.  Airline themes should reside somewhere on the
" 'runtimepath' where it will be loaded at vim startup, for example:
"   * autoload/airline/themes/theme_name.vim
"
" For this, the dark.vim, theme, this is defined as
" let g:airline#themes#theonedark#palette = copy(g:airline#themes#dark#palette)

" Keys in the dictionary are composed of the mode, and if specified the
" override.  For example:
"   * g:airline#themes#dark#palette.normal
"       * the colors for a statusline while in normal mode
"   * g:airline#themes#dark#palette.normal_modified
"       * the colors for a statusline while in normal mode when the buffer has
"         been modified
"   * g:airline#themes#dark#palette.visual
"       * the colors for a statusline while in visual mode
"
" Values for each dictionary key is an array of color values that should be
" familiar for colorscheme designers:
"   * [guifg, guibg, ctermfg, ctermbg, opts]
" See "help attr-list" for valid values for the "opt" value.
"
" Each theme must provide an array of such values for each airline section of
" the statusline (airline_a through airline_z).  A convenience function,
" airline#themes#generate_color_map() exists to mirror airline_a/b/c to
" airline_x/y/z, respectively.

let g:airline#themes#theonedark#palette = {
   \   'normal': {
   \     'airline_a': [ '#282c34', '#61afef', 236, 75 ],
   \     'airline_b': [ '#61afef', '#21252B', 75, 235 ],
   \     'airline_c': [ '#abb2bf', '#21252B', 249, 235 ],
   \     'airline_x': [ '#abb2bf', '#21252B', 249, 235 ],
   \     'airline_y': [ '#61afef', '#21252B', 75, 235 ],
   \     'airline_z': [ '#282c34', '#61afef', 236, 75 ]
   \   },
   \   'insert': {
   \     'airline_a': [ '#282c34', '#98c379', 236, 108 ],
   \     'airline_b': [ '#98c379', '#21252B', 108, 235 ],
   \     'airline_c': [ '#abb2bf', '#21252B', 249, 235 ],
   \     'airline_x': [ '#abb2bf', '#21252B', 249, 235 ],
   \     'airline_y': [ '#98c379', '#21252B', 108, 235 ],
   \     'airline_z': [ '#282c34', '#98c379', 236, 108 ]
   \   },
   \   'replace': {
   \     'airline_a': [ '#282c34', '#e06c75', 236, 168 ],
   \     'airline_b': [ '#e06c75', '#21252B', 168, 235 ],
   \     'airline_c': [ '#abb2bf', '#21252B', 249, 235 ],
   \     'airline_x': [ '#abb2bf', '#21252B', 249, 235 ],
   \     'airline_y': [ '#e06c75', '#21252B', 168, 235 ],
   \     'airline_z': [ '#282c34', '#e06c75', 236, 168 ]
   \   },
   \   'visual': {
   \     'airline_a': [ '#282c34', '#e5c07b', 236, 180 ],
   \     'airline_b': [ '#e5c07b', '#21252B', 180, 235 ],
   \     'airline_c': [ '#abb2bf', '#21252B', 249, 235 ],
   \     'airline_x': [ '#abb2bf', '#21252B', 249, 235 ],
   \     'airline_y': [ '#e5c07b', '#21252B', 180, 235 ],
   \     'airline_z': [ '#282c34', '#e5c07b', 236, 180 ]
   \   },
   \   'inactive': {
   \     'airline_a': [ '#abb2bf', '#21252B', 249, 235 ],
   \     'airline_b': [ '#abb2bf', '#21252B', 249, 235 ],
   \     'airline_c': [ '#abb2bf', '#21252B', 249, 235 ],
   \     'airline_x': [ '#abb2bf', '#21252B', 249, 235 ],
   \     'airline_y': [ '#abb2bf', '#21252B', 249, 235 ],
   \     'airline_z': [ '#abb2bf', '#21252B', 249, 235 ]
   \   },
   \   'tabline': {
   \     'airline_tab': [ '#4B5263', '#21252B', 240, 235 ],
   \     'airline_tabsel': [ '#abb2bf', '#282c34', 249, 236 ],
   \   }
   \ }

" ! => https://github.com/vim-airline/vim-airline/blob/1fb184305bbd0da45fb87f8a690ac29599ce1a15/autoload/airline/extensions/tabline.vim
"
