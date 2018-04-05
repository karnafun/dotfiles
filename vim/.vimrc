"*******************************************************************************"
"*******************************************************************************"
"**                                                                           **"
"**                     The Important bits                                    **"
"**                                                                           **"
"**                                                                           **"
"*******************************************************************************"
"*******************************************************************************"
let g:ale_emit_conflict_warnings = 0 
set number
set number relativenumber
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

" RISKY - This one checks and fixes JS files on save !!!!
"autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
"*******************************************************************************"
"*******************************************************************************"
"**                                                                           **"
"**                      Ulti Snips                                           **"
"**                                                                           **"
"**                                                                           **"
"*******************************************************************************"
"*******************************************************************************"
set runtimepath+=~/.ultisnips/

let g:UltiSnipsSnippetsDir="~/.ultisnips/UltiSnips"
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let NERDTreeShowHidden=1
let g:jsx_ext_required = 1



"*******************************************************************************"
"*******************************************************************************"
"**                                                                           **"
"**                      Error Checks: Syntastics, Ale and more               **"
"**                                                                           **"
"**                                                                           **"
"*******************************************************************************"
"*******************************************************************************"
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_debug = 33 

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = [ 'eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


"  https://github.com/pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_plugin_ngdoc = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END


" Ale
 let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file    

"*******************************************************************************"
"*******************************************************************************"
"**                                                                           **"
"**                      Vim Tmux Navigator                                   **"
"**                                                                           **"
"**                                                                           **"
"*******************************************************************************"
"*******************************************************************************"

" vim-tmux-navigator
" let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>


"*******************************************************************************"
"*******************************************************************************"
"**                                                                           **"
"**                      Status Line                                          **"
"**                                                                           **"
"**                                                                           **"
"*******************************************************************************"
"*******************************************************************************"

" Status line shit :
"function! GitBranch()
"  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction
"
"function! StatuslineGit()
"  let l:branchname = GitBranch()
"  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
"endfunction
function! ObsessionStatus2()
  let session = filereadable(v:this_session)
  if exists('g:this_obsession') && session
    return 'tracking'
  elseif session
    return 'paused'
  else
    return ''
  endif
endfunction


"set statusline=
set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
set statusline+=%{ObsessionStatus2()}
