set number
syntax on
set autoindent
colorscheme monokai
set tabstop=4
set shiftwidth=4
set expandtab
execute pathogen#infect()
filetype plugin indent on
if $TERM == "xterm-256color"
      set t_Co=256
  endif



set runtimepath+=~/.ultisnips/

let g:UltiSnipsSnippetsDir="~/.ultisnips/UltiSnips"

let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsEditSplit="vertical"

let NERDTreeShowHidden=1
