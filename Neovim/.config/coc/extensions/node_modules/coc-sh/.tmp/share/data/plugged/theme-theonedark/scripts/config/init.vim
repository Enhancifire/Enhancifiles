colorscheme theonedark

set nobackup
set noswapfile

set number

set tabstop=2

let &l:statusline='    %f'
hi! link StatusLine todComment

let g:go_highlight_array_whitespace_error = v:true
let g:go_highlight_build_constraints = v:true
let g:go_highlight_chan_whitespace_error = v:true
let g:go_highlight_debug = v:true
let g:go_highlight_extra_types = v:true
let g:go_highlight_fields = v:true
let g:go_highlight_format_strings = v:true
let g:go_highlight_function_calls = v:true
let g:go_highlight_function_parameters = v:true
let g:go_highlight_functions = v:true
let g:go_highlight_generate_tags = v:true
let g:go_highlight_operators = v:true
let g:go_highlight_space_tab_error = v:true
let g:go_highlight_string_spellcheck = v:true
let g:go_highlight_trailing_whitespace_error = v:true
let g:go_highlight_types = v:true
let g:go_highlight_variable_assignments = v:true
let g:go_highlight_variable_declarations = v:true

let g:yaml_schema = 'pyyaml'

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


