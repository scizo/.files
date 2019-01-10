" Python providers
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/Users/scott.nielsen/.miniconda3/bin/python'

" Set up Ctrl-P Fuzzy File Finder
let g:ctrlp_map = '<leader>t'
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_extensions = ['tag']
let g:ctrlp_switch_buffer = 'h'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](target|out|nashorn_code_cache)$'

" vim-salve settings
let g:salve_auto_start_repl = 0

" vim-sexp custom mappings
let g:sexp_insert_after_wrap = 0
let g:sexp_mappings = {
    \ 'sexp_round_head_wrap_element': 'W',
    \ 'sexp_splice_list': 'S',
    \ 'sexp_swap_list_backward': 'Ó',
    \ 'sexp_swap_list_forward': 'Ô',
    \ 'sexp_swap_element_backward': '',
    \ 'sexp_swap_element_forward': 'Ò',
    \ 'sexp_emit_head_element': '∆',
    \ 'sexp_emit_tail_element': '˚',
    \ 'sexp_capture_prev_element': '˙',
    \ 'sexp_capture_next_element': '¬'
    \ }

" vim-go settings
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" nvim-ipy settings
let g:nvim_ipy_perform_mappings = 0

call plug#begin('~/.config/nvim/plugged')

" Colorschemes ans Status Line
Plug 'iCyMind/NeoSolarized'
Plug 'itchyny/lightline.vim'

" General Editing and Navigation
"Plug 'cloudhead/neovim-fuzzy'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Linting Engine
Plug 'w0rp/ale'

" Completion Engine
"Plug 'roxma/nvim-completion-manager'

" Git and Github
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Clojure Specific
"Plug 'clojure-vim/async-clj-omni', {'for': 'clojure'}
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'guns/vim-clojure-static', {'for': 'clojure'}
"Plug 'SevereOverfl0w/clojure-check', {'for': 'clojure', 'do': './install'}
Plug 'tpope/vim-salve', {'for': 'clojure'}
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
"Plug 'clojure-vim/acid.nvim', {'for': 'clojure', 'do': ':UpdateRemotePlugins'}
Plug 'snoe/clj-refactor.nvim', {'for': 'clojure', 'do': ':UpdateRemotePlugins'}

" JVM languages
Plug 'tpope/vim-classpath'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Python
Plug 'bfredl/nvim-ipy', {'for': 'python', 'do': ':UpdateRemotePlugins'}

" Terraform
Plug 'hashivim/vim-terraform'

call plug#end()

" nvim-completion-engine
" hide the completion window and create a new line on enter
inoremap <expr> <cr> (pumvisible() ? "\<c-y>\<cr>" : "\<cr>")

" Set the color scheme
set termguicolors
set background=dark
colorscheme NeoSolarized

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

" Remove pipes from vertical splits
set fillchars+=vert:\ 

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

" Leader a to remove highlighted search fields
nnoremap <leader>a :nohlsearch<cr>

" Leader b to redraw because I override <C-l> for window changing
nnoremap <leader>b :redraw!<cr>

" Leader s to quickly turn on spell check
nnoremap <leader>s :setlocal spell spelllang=en_us<cr>

" Tab completion lists possible completions
set wildmode=longest,list

" Begin scrolling before hitting edges
set scrolloff=7

" Allow backspaceing over everything
set backspace=indent,eol,start

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

nnoremap <leader>t :FuzzyOpen<cr>

" Custom autocmds
augroup myVimrc
  " Clear all autocmds in the group
  autocmd!

  " Set preferred alternate tabing for some filetypes
  autocmd FileType python set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  autocmd FileType pyrex set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  autocmd FileType yaml set shiftwidth=2 tabstop=2 softtabstop=2 expandtab

  autocmd FileType clojure map <leader>r :Eval (r/refresh)<cr>
  autocmd FileType clojure map <leader>e :Eval (dev/reset)<cr>

  autocmd FileType python nmap cpp <Plug>(IPy-RunCell)
  autocmd FileType python vmap cpp <Plug>(IPy-Run)
  autocmd FileType python map <leader>c <Plug>(IPy-Terminate)

  " When on a fugitive tree or blob '..' navigates up to the parent tree or commit
  autocmd User fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif

  " Deletes fugitive buffers when no longer active
  autocmd BufReadPost fugitive://* set bufhidden=delete

  " Set build.boot to be clojure files
  autocmd BufRead,BufNewFile *.boot set filetype=clojure
augroup END

" Set the status line
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive'],[ 'filename' ] ]
  \ },
  \ 'component_function': {
  \   'fugitive': 'LLFugitive',
  \   'readonly': 'LLReadonly',
  \   'modified': 'LLModified',
  \   'filename': 'LLFilename',
  \   'mode': 'LLMode'
  \ }
  \ }

function! LLMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
  \ fname == 'ControlP' ? 'CtrlP' :
  \ lightline#mode() == 'NORMAL' ? 'N' :
  \ lightline#mode() == 'INSERT' ? 'I' :
  \ lightline#mode() == 'VISUAL' ? 'V' :
  \ lightline#mode() == 'V-LINE' ? 'V' :
  \ lightline#mode() == 'V-BLOCK' ? 'V' :
  \ lightline#mode() == 'REPLACE' ? 'R' : lightline#mode()
endfunction

function! LLModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LLReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "!"
  else
    return ""
  endif
endfunction

function! LLFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LLFilename()
  return ('' != LLReadonly() ? LLReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LLModified() ? ' ' . LLModified() : '')
endfunction
