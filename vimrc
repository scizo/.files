" Ensure vim settings
set nocompatible

" Map leader to comma
let mapleader = ';'

" Set up Ctrl-P Fuzzy File Finder
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_extensions = ['tag']

" Add all directories in bundle to runtimepath
call pathogen#infect()

if &t_Co > 2 || has("gui_running") " If there is color support
  syntax on                        " Use syntax highlighting
  set guifont=Menlo\ Regular:h14   " Set my font when using gui
end

" Set the color scheme
set t_Co=256
color molokai

" Setting for tabs and indentation
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

" Setting for whitespace visualization
set list
set listchars=trail:·

" Always ensure there is a status bar
set laststatus=2

" Quickly show matching brackets on insert
set showmatch

" Show matches as search is typed
set incsearch

" Highlight search fields
set hlsearch

" Searches are case-sensitive only if they contain upper-case
set ignorecase
set smartcase

" Return to remove highlighted search fields
nnoremap <CR> :nohlsearch<cr>

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

if has("gui_running") " If this is a gui
  set go-=T           " Do not show the toolbar
end

" When on a fugitive tree or blob '..' navigates up to the parent tree or commit
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Deletes fugitive buffers when no longer active
autocmd BufReadPost fugitive://* set bufhidden=delete

" Set the status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
