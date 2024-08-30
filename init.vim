set exrc
set nohidden

" Python providers
let g:python3_host_prog = '$HOME/.pyenv/versions/neovim/bin/python'

" Set up Ctrl-P Fuzzy File Finder
let g:ctrlp_map = '<leader>t'
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_extensions = ['tag']
let g:ctrlp_switch_buffer = 'h'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](target|out|nashorn_code_cache|node_modules|coverage)$'
"let g:ctrlp_user_command = 'find ~/e/prisma-server -type f | grep -vE -e node_modules -e .git -e .cache'

" vim-salve settings
let g:salve_auto_start_repl = 0

" vim-sexp custom mappings
let g:sexp_insert_after_wrap = 0
"let g:sexp_mappings = {
"    \ 'sexp_round_head_wrap_element': 'W',
"    \ 'sexp_splice_list': 'S',
"    \ 'sexp_swap_list_backward': 'Ó',
"    \ 'sexp_swap_list_forward': 'Ô',
"    \ 'sexp_swap_element_backward': '',
"    \ 'sexp_swap_element_forward': 'Ò',
"    \ 'sexp_emit_head_element': '∆',
"    \ 'sexp_emit_tail_element': '˚',
"    \ 'sexp_capture_prev_element': '˙',
"    \ 'sexp_capture_next_element': '¬'
"    \ }
"let g:sexp_mappings = {
"    \ 'sexp_round_head_wrap_element': 'W',
"    \ 'sexp_splice_list': 'S',
"    \ 'sexp_swap_list_backward': '<m-s-h>',
"    \ 'sexp_swap_list_forward': '<m-s-l>',
"    \ 'sexp_swap_element_backward': '<m-s-j>',
"    \ 'sexp_swap_element_forward': '<m-s-k>',
"    \ 'sexp_emit_head_element': '<m-j>',
"    \ 'sexp_emit_tail_element': '<m-k>',
"    \ 'sexp_capture_prev_element': '<m-h>',
"    \ 'sexp_capture_next_element': '<m-l>'
"    \ }

" Clojure indentation
let g:clojure_fuzzy_indent_patterns = ['^with','^def','^let','action$','^backend']

" vim-go settings
"let g:go_auto_sameids = 1
"let g:go_fmt_command = "goimports"
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_types = 1

" nvim-ipy settings
let g:nvim_ipy_perform_mappings = 0

call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Colorschemes ans Status Line
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'arcticicestudio/nord-vim'

" General Editing and Navigation
"Plug 'cloudhead/neovim-fuzzy'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Linting Engine
"Plug 'w0rp/ale'

" Completion Engine
"Plug 'roxma/nvim-completion-manager'

" Git and Github
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Clojure Specific
"Plug 'clojure-vim/async-clj-omni', {'for': 'clojure'}
Plug 'guns/vim-sexp', {'for': 'clojure'}
Plug 'guns/vim-clojure-static', {'for': 'clojure'}
"Plug 'Olical/conjure'
"Plug 'SevereOverfl0w/clojure-check', {'for': 'clojure', 'do': './install'}
Plug 'tpope/vim-salve', {'for': 'clojure'}
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
"Plug 'clojure-vim/acid.nvim', {'for': 'clojure', 'do': ':UpdateRemotePlugins'}
"Plug 'snoe/clj-refactor.nvim', {'for': 'clojure', 'do': ':UpdateRemotePlugins'}

" JVM languages
Plug 'tpope/vim-classpath'

" Go
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Python
"Plug 'bfredl/nvim-ipy', {'for': 'python', 'do': ':UpdateRemotePlugins'}

" GraphQL
Plug 'jparise/vim-graphql', {'for': 'graphql'}

" Terraform
Plug 'hashivim/vim-terraform'

" Mason
Plug 'williamboman/mason.nvim'

" LSP Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Git commit file completion
"Plug 'nvim-lua/plenary.nvim'
"Plug 'petertriho/cmp-git'

" Typescript

call plug#end()

" nvim-completion-engine
" hide the completion window and create a new line on enter
"inoremap <expr> <cr> (pumvisible() ? "\<c-y>\<cr>" : "\<cr>")

" Set the color scheme
set termguicolors
"set background=dark
"let g:solarized_italics = 0
"let g:solarized_extra_hi_groups = 1
"colorscheme solarized8_flat
"let g:gruvbox_italic = 1
"let g:gruvbox_contrast_dark = 'medium'
"let g:gruvbox_contrast_light = 'hard'
"colorscheme gruvbox
colorscheme nord

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
set listchars=trail:·,tab:··

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
set scrolloff=4

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

function! GgrepCursor()
  let expr="'\\<" . expand("<cword>") . "\\>'"
  call fugitive#GrepCommand(3, -1, 0, 0, "", expr)
  copen
endfunction

function! Reconcile()
  let command="(do (in-ns 'dev) (-> payments (p/starting-at \"" . expand("<cword>") . "\") (p/satisfy-invoices invoices) (->> (m/split-payments! ds))) (def payments (l/get-payments-by-email ds email)) (def invoices (l/build-invoices payments)) (m/update-invoice-statuses! ds invoices))"
  call fireplace#eval(command)
  Eval (do (in-ns 'dev) (def payments (l/get-payments-by-email ds email)) (def invoices (l/build-invoices payments)) (d/display-info identity-info) (println) (d/display-invoices invoices) (prn :incorrect-deleted-invoices (p/incorrect-deleted-invoices invoices)) (prn :incorrect-open-invoices (p/incorrect-open-invoices invoices)) (println) (d/display-payments payments))
endfunction

function! ReconcileOne()
  let command="(do (in-ns 'dev) (-> payments (p/specific-payments #{\"" . expand("<cword>") . "\"}) (p/satisfy-invoices invoices) (->> (m/split-payments! ds))) (def payments (l/get-payments-by-email ds email)) (def invoices (l/build-invoices payments)) (m/update-invoice-statuses! ds invoices))"
  call fireplace#eval(command)
  Eval (do (in-ns 'dev) (def payments (l/get-payments-by-email ds email)) (def invoices (l/build-invoices payments)) (d/display-info identity-info) (println) (d/display-invoices invoices) (prn :incorrect-deleted-invoices (p/incorrect-deleted-invoices invoices)) (prn :incorrect-open-invoices (p/incorrect-open-invoices invoices)) (println) (d/display-payments payments))
endfunction

function! LoadEmail()
  let command="(do (in-ns 'dev) (def email \"" . expand("<cWORD>") . "\") (def identity-info (l/get-info-by-email ds email)))"
  call fireplace#eval(command)
  Eval (do (in-ns 'dev) (def payments (l/get-payments-by-email ds email)) (def invoices (l/build-invoices payments)) (d/display-info identity-info) (println) (d/display-invoices invoices) (prn :incorrect-deleted-invoices (p/incorrect-deleted-invoices invoices)) (prn :incorrect-open-invoices (p/incorrect-open-invoices invoices)) (println) (d/display-payments payments))
endfunction

function! LoadPayerInputs()
  let command="(do (in-ns 'multiple-payers) (def email \"" . expand("<cWORD>") . "\") (def options {:company nil}) (def registrations (:registrations (query :registration-info {:email email}))) (def registration (select-registration registrations options)) (def inputs (build-payment-inputs registration options)))"
  call fireplace#eval(command)
  Eval [registration inputs]
endfunction

map <leader>f :call Reconcile()<cr>
map <leader>g :call ReconcileOne()<cr>
map <leader>d :call LoadEmail()<cr>
map <leader>c :call LoadPayerInputs()<cr>
map <BS> :call GgrepCursor()<cr>
map <leader>c :cclose<cr>

nnoremap <leader>t :FuzzyOpen<cr>

" Custom autocmds
augroup myVimrc
  " Clear all autocmds in the group
  autocmd!

  " Set preferred alternate tabing for some filetypes
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  autocmd FileType pyrex setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
  autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
  autocmd FileType make setlocal shiftwidth=8 tabstop=8 softtabstop=8 noexpandtab
  autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
  autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
  autocmd FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
  autocmd FileType sql setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
  autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab

  "autocmd FileType clojure map <leader>r :Eval (r/refresh)<cr>
  "autocmd FileType clojure map <leader>e :Eval (dev/reset)<cr>

  "autocmd FileType python nmap cpp <Plug>(IPy-RunCell)
  "autocmd FileType python vmap cpp <Plug>(IPy-Run)
  "autocmd FileType python map <leader>c <Plug>(IPy-Terminate)

  " When on a fugitive tree or blob '..' navigates up to the parent tree or commit
  autocmd User FugitiveTree,FugitiveBlob nnoremap <buffer> .. :edit %:h<CR>

  " Deletes fugitive buffers when no longer active
  autocmd BufReadPost fugitive://* set bufhidden=delete

  " Set build.boot to be clojure files
  autocmd BufRead,BufNewFile *.boot set filetype=clojure
augroup END

" Set the status line
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [['mode','paste'],['fugitive'],['filename']],
  \   'right': [['lineinfo'], ['percent'], ['fileencoding', 'filetype']]
  \ },
  \ 'component_function': {
  \   'fugitive': 'LLFugitive',
  \   'readonly': 'LLReadonly',
  \   'modified': 'LLModified',
  \   'filename': 'LLFilename',
  \   'mode': 'LLMode'
  \ }
  \ }

command! FormatJSON %!python -m json.tool

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
    return "!"
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
       \ ('' != expand('%:f') ? expand('%:f') : '[No Name]') .
       \ ('' != LLModified() ? ' ' . LLModified() : '')
endfunction

set secure

lua <<EOF
  -- Set up mason
  require("mason").setup()

  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      -- Accept currently selected item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      -- { name = 'buffer' },
    }),
  })

  --cmp.setup.filetype('gitcommit', {
  --  sources = cmp.config.sources({
  --    { name = 'git' },
  --  }, {
  --    { name = 'buffer' },
  --  })
  --})

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  --cmp.setup.cmdline({ '/', '?' }, {
  --  mapping = cmp.mapping.preset.cmdline(),
  --  sources = {
  --    { name = 'buffer' }
  --  }
  --})

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  --cmp.setup.cmdline(':', {
  --  mapping = cmp.mapping.preset.cmdline(),
  --  sources = cmp.config.sources({
  --    { name = 'path' }
  --  }, {
  --    { name = 'cmdline' }
  --  })
  --})

  -- Set up lspconfig.
  local on_attach = function(client, bufnr)
    -- format on save
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("Format", { clear = true }),
        buffer = bufnr,
        callback = function() vim.lsp.buf.formatting_seq_sync() end,
      })
    end
  end

  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities,
    --on_attach = on_attach,
  }

  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-;>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })

  require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all" (the first five listed parsers should always be installed)
    ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "clojure"},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have 'tree-sitter' CLI installed locally
    auto_install = false,

    -- List of parsers to ignore installing (or "all")
    ignore_install = {"clojure"},

    ---- If you need to change the installation directory of the parsers (see --> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want
      -- to disable highlighting for the `tex` filetype, you need to include `latex` in this list
      -- as this is the name of the parser)
      -- list of language that will be disabled
      disable = {"clojure"},
      -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for
      -- large files
      -- disable = function(lang, buf)
      --   local max_filesize = 100 * 1024 -- 100 KB
      --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      --   if ok and stats and stats.size > max_filesize then
      --     return true
      --   end
      -- end,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    }
  }
EOF
