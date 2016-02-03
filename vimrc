" Ensure vim settings
set nocompatible

" Map leader to comma
" I thought this would be nice, but forgot that ';' repeats f and t commands
" let mapleader = ';'

" profile start profile.log
" profile func *
" profile file *

" Set up Ctrl-P Fuzzy File Finder
let g:ctrlp_map = '<leader>t'
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_extensions = ['tag']
let g:ctrlp_switch_buffer = 'v'

" Use paredit shortmaps
let g:paredit_leader = '<leader>'
let g:paredit_shortmaps = 1

" vim-fsharp settings
let g:fsharpbinding_debug = 1
let g:fsharp_completion_helptext = 1

" Syntastic options
let g:syntastic_cpp_compiler_options = '-std=gnu++11 -Wall'
let g:syntastic_filetype_map = {'pmml': 'xml'}
let g:syntastic_mode_map = {'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html']}

" Airline config
let g:airline_powerline_fonts = 1
let g:airline_detect_paste = 1
let g:airline#extensions#bufferline#enabled = 1

" vim-leiningen settings
let g:leiningen_no_auto_repl=1

" vim-gnupg settings
let g:GPGExecutable = 'gpg2'
let g:GPGDefaultRecipients = ['Scott Nielsen <scottnielsen5@gmail.com>']

" Add all directories in bundle to runtimepath
call pathogen#infect()


if &t_Co > 2 || has("gui_running") " If there is color support
  syntax on                        " Use syntax highlighting
  set guifont=Osaka\ Regular:h14   " Set my font when using gui
end

" Need to look more into how to use hidden
" set hidden

" Set the color scheme
set t_Co=256
set background=dark
color solarized

" Setting for tabs and indentation
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

" I hate wrapping lines
set nowrap

" Setting for whitespace visualization
set list
set listchars=trail:·,tab:\ \ 

" Always ensure there is a status bar
set laststatus=2

" Quickly show matching brackets on insert
set showmatch

" Show line numbers
set number

" Show matches as search is typed
set incsearch

" Highlight search fields
set hlsearch

" Searches are case-sensitive only if they contain upper-case
set ignorecase
set smartcase

" Use ctrl-p to toggle paste mode in normal and insert modes
"nnoremap <c-p> :set invpaste paste?<cr>
"set pastetoggle=<c-p>

" Leader a to remove highlighted search fields
nnoremap <leader>a :nohlsearch<cr>

" Leader b to redraw because I override <C-l> for window changing
nnoremap <leader>b :redraw!<cr>

" Leader s to quickly turn on spell check
nnoremap <leader>s :setlocal spell spelllang=en_us<cr>

" Large history
set history=1000

" Tab completion lists possible completions
set wildmode=longest,list

" Begin scrolling before hitting edges
set scrolloff=7

" Store temporary files in one place
set backupdir=~/.tmp
set directory=~/.tmp

" Allow backspaceing over everything
set backspace=indent,eol,start

if has("vms")
  set nobackup  " use versions instead
else
  set backup
end

" Show cursor position
set ruler

" Show incomplete commands
set showcmd

if has("autocmd")           " If there is auto command support
  filetype plugin indent on " Enable filetype detection for plugins and indentation
else
  set autoindent            " Otherwise use autoindent
end

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

" Open new windows to the right or bottom
set splitright
set splitbelow

" Page up and page down easier
nmap <M-Space> <PageUp>
nmap <Space> <PageDown>

if has("gui_running") " If this is a gui
  set go-=T           " Do not show the toolbar
end

" Custom autocmds
augroup myVimrc
  " Clear all autocmds in the group
  autocmd!

  " Set preferred alternate tabing for some filetypes
  autocmd FileType python set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  autocmd FileType pyrex set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  autocmd FileType html set shiftwidth=4 tabstop=4 softtabstop=4 expandtab

  autocmd FileType clojure map <leader>r :Eval (r/refresh)<cr>
  autocmd FileType clojure map <leader>e :Eval (dev/reset)<cr>

  " Don't show trailing whitespace in a conque term buffer
  autocmd FileType conque_term setlocal nolist

  " When on a fugitive tree or blob '..' navigates up to the parent tree or commit
  autocmd User fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif

  " Deletes fugitive buffers when no longer active
  autocmd BufReadPost fugitive://* set bufhidden=delete

  " Set build.boot to be clojure files
  autocmd BufRead,BufNewFile build.boot set filetype=clojure
augroup END

" Set the status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Tab autocompletion when the previous character is not whitespace
" Inspired by SuperTab no configuration
"function! WillComplete()
"  let l:line = getline(".")
"  let l:col  = col(".")
"  let l:prev_char = strpart(l:line, l:col-2, 1)
"  if l:prev_char =~ '^\s*$'
"    return 0
"  else
"    return 1
"  endif
"endfunction
"
"function! TabComplete()
"  if WillComplete()
"    return "\<c-x>\<c-o>"
"  else
"    return "\<tab>"
"  endif
"endfunction
"imap <tab> <c-r>=TabComplete()<cr>

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
