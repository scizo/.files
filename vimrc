set nocompatible
syntax on

" Use <Leader>t to open the fuzzy file finder
let g:ctrlp_map = '<Leader>t'

" List fuzzy finder files from top to bottom
let g:ctrlp_match_window_reversed = 0

set t_Co=256
"color molokai

" Use the ten key plus, minus, multiply and divide keys to resize windows
map <kMultiply> <C-w>>
map <kDivide> <C-w><
map <kPlus> <C-w>+
map <kMinus> <C-w>-

" Move between windows easier
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" When on a fugitive tree or blob '..' navigates up to the parent tree or
" commit
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Deletes fugitive buffers when no longer active
autocmd BufReadPost fugitive://* set bufhidden=delete

" Set the status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Return to remove highlighted search fields
nnoremap <CR> :nohlsearch<cr>
