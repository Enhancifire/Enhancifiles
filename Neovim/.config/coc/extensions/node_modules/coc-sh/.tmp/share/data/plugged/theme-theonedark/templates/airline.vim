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
   \     'airline_a': {{.StatusbarNormalPrimary.Flater}},
   \     'airline_b': {{.StatusbarNormalSecondary.Flater}},
   \     'airline_c': {{.Statusbar.Flater}},
   \     'airline_x': {{.Statusbar.Flater}},
   \     'airline_y': {{.StatusbarNormalSecondary.Flater}},
   \     'airline_z': {{.StatusbarNormalPrimary.Flater}}
   \   },
   \   'insert': {
   \     'airline_a': {{.StatusbarInsertPrimary.Flater}},
   \     'airline_b': {{.StatusbarInsertSecondary.Flater}},
   \     'airline_c': {{.Statusbar.Flater}},
   \     'airline_x': {{.Statusbar.Flater}},
   \     'airline_y': {{.StatusbarInsertSecondary.Flater}},
   \     'airline_z': {{.StatusbarInsertPrimary.Flater}}
   \   },
   \   'replace': {
   \     'airline_a': {{.StatusbarReplacePrimary.Flater}},
   \     'airline_b': {{.StatusbarReplaceSecondary.Flater}},
   \     'airline_c': {{.Statusbar.Flater}},
   \     'airline_x': {{.Statusbar.Flater}},
   \     'airline_y': {{.StatusbarReplaceSecondary.Flater}},
   \     'airline_z': {{.StatusbarReplacePrimary.Flater}}
   \   },
   \   'visual': {
   \     'airline_a': {{.StatusbarVisualPrimary.Flater}},
   \     'airline_b': {{.StatusbarVisualSecondary.Flater}},
   \     'airline_c': {{.Statusbar.Flater}},
   \     'airline_x': {{.Statusbar.Flater}},
   \     'airline_y': {{.StatusbarVisualSecondary.Flater}},
   \     'airline_z': {{.StatusbarVisualPrimary.Flater}}
   \   },
   \   'inactive': {
   \     'airline_a': {{.StatusbarInactive.Flater}},
   \     'airline_b': {{.StatusbarInactive.Flater}},
   \     'airline_c': {{.Statusbar.Flater}},
   \     'airline_x': {{.Statusbar.Flater}},
   \     'airline_y': {{.StatusbarInactive.Flater}},
   \     'airline_z': {{.StatusbarInactive.Flater}}
   \   },
   \   'tabline': {
   \     'airline_tab': {{.Tabbar.Flater}},
   \     'airline_tabsel': {{.TabActive.Flater}},
   \   }
   \ }

" ! => https://github.com/vim-airline/vim-airline/blob/1fb184305bbd0da45fb87f8a690ac29599ce1a15/autoload/airline/extensions/tabline.vim
"
