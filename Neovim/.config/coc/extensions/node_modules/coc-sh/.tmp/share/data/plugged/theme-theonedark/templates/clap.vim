let g:clap#themes#theonedark#palette = {
  \   'spinner'                : { {{.Dialog.ObjProps}}, {{.Comment.Foreground.ObjProps "fg"}} },
  \   'input'                  : {{.Dialog.Obj}},
  \   'display'                : {{.DialogBody.Obj}},
  \   'preview'                : {{.Dialog.Obj}},
  \   'search_text'            : {{.DialogInput.Obj}},
  \   'selected'               : {{.DialogSelected.Obj}},
  \   'current_selection'      : {{.DialogSelected.Obj}},
  \   'selected_sign'          : { {{.Green.ObjProps "fg"}}, {{.DialogSelected.ObjProps}} },
  \   'current_selection_sign' : { {{.Blue.ObjProps "fg"}}, {{.DialogSelected.ObjProps}} }
  \ }
