let s:fg = [ '#FF0000', 255 ]
let s:bg = [ '#000000', 0 ]

let g:lightline#colorscheme#theonedark#palette = lightline#colorscheme#flatten({
  \   'normal': {
  \     'left':     [ {{.StatusbarNormalPrimary.Flat}}, {{.Statusbar.Flat}} ],
  \     'middle':   [ {{.StatusbarNormalSecondary.Flat}} ],
  \     'right':    [ {{.StatusbarNormal.Flat}}, {{.Statusbar.Flat}} ],
  \     'error':    [ {{.StatusbarError.Flat}} ],
  \     'warning':  [ {{.StatusbarWarning.Flat}} ],
  \    },
  \   'insert': {
  \     'left':     [ {{.StatusbarInsertPrimary.Flat}}, {{.Statusbar.Flat}} ],
  \     'middle':   [ {{.StatusbarInsertSecondary.Flat}} ],
  \     'right':    [ {{.StatusbarInsert.Flat}}, {{.Statusbar.Flat}} ],
  \   },
  \   'replace': {
  \     'left':     [ {{.StatusbarReplacePrimary.Flat}}, {{.Statusbar.Flat}} ],
  \     'middle':   [ {{.StatusbarReplaceSecondary.Flat}} ],
  \     'right':    [ {{.StatusbarReplace.Flat}}, {{.Statusbar.Flat}} ],
  \   },
  \   'visual': {
  \     'left':     [ {{.StatusbarVisualPrimary.Flat}}, {{.Statusbar.Flat}} ],
  \     'middle':   [ {{.StatusbarVisualSecondary.Flat}} ],
  \     'right':    [ {{.StatusbarVisual.Flat}}, {{.Statusbar.Flat}} ],
  \   },
  \   'inactive': {
  \     'left':     [ {{.StatusbarInactive.Flat}}, {{.StatusbarInactive.Flat}} ],
  \     'middle':   [ {{.StatusbarInactive.Flat}} ],
  \     'right':    [ {{.StatusbarInactive.Flat}}, {{.StatusbarInactive.Flat}} ],
  \   },
  \   'tabline': {
  \     'left':      [ {{.Tabbar.Flat}} ],
  \     'right':     [ {{.Tabbar.Flat}} ],
  \     'middle':    [ {{.Tabbar.Flat}} ],
  \     'tabsel':    [ {{.TabActive.Flat}} ],
  \     'bufsel':    [ {{.TabActive.Flat}} ],
  \     'tabsep':    [ [ s:fg, s:bg ] ],
  \   }
  \ })
