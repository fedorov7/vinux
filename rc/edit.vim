Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' "repeat enhance
Plug 'junegunn/vim-easy-align',{'on': [ '<Plug>(EasyAlign)', '<Plug>(LiveEasyAlign)' ]}
if !te#env#IsNvim()
    Plug 'osyo-manga/vim-over',{'on': 'OverCommandLine'}
endif
if !has('patch-8.1.1270')
Plug 'haya14busa/incsearch.vim'
" Incsearch -----------------------{{{
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)zz
map N  <Plug>(incsearch-nohl-N)zz
map *   <Plug>(incsearch-nohl)<Plug>(asterisk-*)
map g*  <Plug>(incsearch-nohl)<Plug>(asterisk-g*)
map #   <Plug>(incsearch-nohl)<Plug>(asterisk-#)
map g#  <Plug>(incsearch-nohl)<Plug>(asterisk-g#)
" }}}
endif
Plug 'haya14busa/vim-asterisk'
Plug 'mbbill/undotree',  { 'on': 'UndotreeToggle'   }
Plug 'tweekmonster/spellrotate.vim', {'on': ['<Plug>(SpellRotateForward)']}
nmap <silent> <leader>zn :set spell<cr><Plug>(SpellRotateForward)
nmap <silent> <leader>zp :set spell<cr><Plug>(SpellRotateBackward)
xmap <silent> <leader>zn <Plug>(SpellRotateForwardV)
xmap <silent> <leader>zp <Plug>(SpellRotateBackwardV)
nmap  <silent><leader>tz :call te#utils#OptionToggle('spell', [1,0])<cr>

" Align ---------------------------{{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
xmap  <silent><leader>al <Plug>(LiveEasyAlign)
" Live easy align
nmap  <silent><leader>al <Plug>(LiveEasyAlign)
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
" }}}
" Nerdcommander -------------------{{{
let g:NERDMenuMode=0
let g:NERD_c_alt_style=1
"toggle comment
nmap  <silent><Leader>cc <plug>NERDCommenterComment
"}}}
"replace
if !te#env#IsNvim()
    nnoremap  <silent><c-h> :OverCommandLine<cr>:%s/<C-R>=expand("<cword>")<cr>/
    vnoremap  <silent><c-h> :OverCommandLine<cr>:<c-u>%s/<C-R>=getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]<cr>/
    nnoremap ss :OverCommandLine<cr>%s//<left>
    xnoremap ss :OverCommandLine<cr>s//<left>
    "vnoremap : :OverCommandLine<cr>s//<left>
else
    nnoremap <c-h> :%s/<C-R>=expand("<cword>")<cr>/
    vnoremap <c-h> :<c-u>%s/<C-R>=getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]<cr>/
    nnoremap ss :%s//<left>
    xnoremap ss :s//<left>
    "vnoremap : :s//<left>
endif
" undo tree window toggle
nnoremap  <silent><leader>tu :UndotreeToggle<cr>
"repeat some command
silent! call repeat#set("\<plug>NERDCommenterComment", v:count)
silent! call repeat#set("\<plug>NERDCommenterAppend", v:count)
silent! call repeat#set("\<plug>NERDCommenterUncomment", v:count)
silent! call repeat#set("\<Plug>(SpellRotateForward)", v:count)
silent! call repeat#set("\<Plug>(SpellRotateBackward)", v:count)
" vim: set fdm=marker foldlevel=0 foldmarker& filetype=vim: 

