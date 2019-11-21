" Package info {{{
Plug 'dense-analysis/ale'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fedorov7/ksslint'
Plug 'fedorov7/vim-uefi'
Plug 'fidian/hexmode'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lilydjwg/colorizer'
Plug 'pboettch/vim-cmake-syntax'
Plug 'pearofducks/ansible-vim'
Plug 'tenfyzhong/CompleteParameter.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sensible'
" }}}

nmap ,tc <Plug>Colorizer

let g:rbpt_colorpairs = [
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkred',     'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['brown',       'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

augroup rainbow_parentheses
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
augroup END

nmap <F2> :map<CR>
nmap <F4> <Plug>(ale_lint)
nmap <F5> <Plug>(ale_fix)
nmap <F7> <Plug>(ale_detail)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_python_pylint_options = '--include-naming-hint=y --const-naming-style=any --attr-naming-style=any --variable-naming-style=any --disable=missing-docstring'
let g:ale_python_auto_pipenv = 1

let g:ale_linters = {
\   'c': ['clangtidy'],
\   'cpp': ['clangtidy'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'markdown' : ['prettier'],
\   'sh': ['shfmt'],
\   'cmake' : ['cmakeformat'],
\   'c': ['iwyu'],
\   'cpp': ['iwyu'],
\   'python' : ['autopep8', 'isort', 'yapf', 'black'],
\}

