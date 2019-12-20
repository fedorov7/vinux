" Package info {{{
Plug 'dense-analysis/ale'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fedorov7/ksslint'
Plug 'fedorov7/vim-uefi'
Plug 'fidian/hexmode'
Plug 'luochen1990/rainbow'
Plug 'lilydjwg/colorizer'
Plug 'pboettch/vim-cmake-syntax'
Plug 'elzr/vim-json'
Plug 'kergoth/vim-bitbake'
Plug 'pearofducks/ansible-vim'
Plug 'tenfyzhong/CompleteParameter.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sensible'
Plug 'liuchengxu/vim-which-key'
Plug 'jiangmiao/auto-pairs'
Plug 'vivien/vim-linux-coding-style'
" }}}

nmap ,tc <Plug>Colorizer

let g:rainbow_active = 1

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

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>

" System clipboard support
vnoremap <C-c> "+y<CR>
nnoremap <C-p> "+p<CR>

let g:linuxsty_patterns = [ '/usr/src/', '/linux' ]
nnoremap <silent> <leader>la :LinuxCodingStyle<cr>
