" Inspiration from https://github.com/fisadev/fisa-vim-config/blob/master/.vimrc
"
" Getting Started
"
" 1. Install https://github.com/junegunn/vim-plug
" 2. :source %
" 3. :PlugInstall
" 
"  Note: if you have youcompleteme, follow instructions to compile it
"  i.e on bundle/ycm run ./install.py
"
call plug#begin('~/.vim/plugged')
" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Class/module browser
Plug 'majutsushi/tagbar'
" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Git integration
Plug 'tpope/vim-fugitive'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Terminal Vim with 256 colors colorscheme
Plug 'fisadev/fisa-vim-colorscheme'
" Surround
Plug 'tpope/vim-surround'
" Autoclose
Plug 'Townk/vim-autoclose'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Plug 'klen/python-mode'
"if has('gui_running')
  " Better autocompletion
Plug 'valloric/youcompleteme'
"endif
" Snippets manager (SnipMate), dependencies, and snippets repo
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'
" Python and other languages code checker
Plug 'scrooloose/syntastic'
" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
" Ack code search (requires ack installed in the system)
Plug 'mileszs/ack.vim'
" Search results counter
Plug 'IndexedSearch'
" XML/HTML tags navigation
Plug 'matchit.zip'
" Gvim colorschemes
Plug 'Wombat'
Plug 'tomasr/molokai'
" Yank history navigation
Plug 'YankRing.vim'
" Zoom window
Plug 'troydm/zoomwintab.vim'
" Buffer Explorer
Plug 'jeetsukumaran/vim-buffergator'

" Insert plugis above end!!
call plug#end()
" ==========================================================
" Basic Settings
" ==========================================================
let mapleader = ","

set guifont=Monaco:h11
set nocompatible               " be iMproved
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin on            " allow plugins by file type (required for plugins!)
filetype indent on            " enable loading indent file for filetype  
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set noerrorbells              " don't bell or blink
set vb t_vb=                  " don't bell or blink
set completeopt=menuone,longest,preview " don't select first item, follow typing in autocomplete
set pumheight=6               " Keep a small completion window
""" Moving Around/Editing
"set cursorline             " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
""" Spaces and indents
set tabstop=2               " <tab> inserts 4 spaces 
set shiftwidth=2            " but an indent level is 2 spaces wide.
set softtabstop=2           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
""" Reading/Writing
"set noautowrite             " Never write a file unless I request it.
"set noautowriteall          " NEVER.
"set noautoread              " Don't automatically re-read changed files.
"set modeline                " Allow vim options to be embedded in files;
"set modelines=5             " they must be within the first or last 5 lines.
"set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.
"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}
" displays tabs with :set list & displays when a line runs off-screen
"set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set listchars=tab:>-,trail:-,precedes:<,extends:>
set list                   " caractere $ en fin de ligne
""" Searching and Patterns
set grepprg=ack              " replace the default grep program with ack
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
""" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
    let &t_Co = 256
    colorscheme fisa
else
    colorscheme delek
endif

" colors for gvim
if has('gui_running')
    colorscheme molokai "wombat
endif

" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" ==========================================================
" Plugins settings
"        <D-something>        Command in Apple and macVim
"        <F>                  Shift & F
"        <Esc>                Escape key
"        <C-G>                CTRL-G
"        <Up>                 cursor up key
"        <C-LeftMouse>        Control- left mouse click
"        <S-F11>              Shifted function key 11
"        <M-a>                Meta- a  Meta is the Alt/Option
"        <M-A>                Meta- A  Meta is the Alt/Option
"        <t_kd>               "kd" termcap entry (cursor down key)
" ==========================================================
"
" ========= Tagbar ==========
" run: ctags -o ~/dev-tags and make sure ~/.ctags exists
set tags=~/dev-tags
" toggle tagbar display
map <Leader>rt :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" ========= NERDTree ==========
" toggle nerdtree display
map <Leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>
" open nerdtree with the current file selected
map <Leader>nl :NERDTreeFind<CR>
" don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" Autoclose nerdtree
let NERDTreeQuitOnOpen = 0
" Show dot files
let NERDTreeShowHidden=1

" ========= ACK ==========
" Command-Shift-F on OSX
if has("gui_macvim")
  map <D-F> :Ack<space>
endif

" ========= CTRLP ==========
" don't change working directory
" let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = ''
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
\ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
\ }

if has("gui_macvim")
 " prevent macvim from opening new tab, and use command shift t
 " is overriden in gvimrc
  " command shift o opens tags browser
  map <D-O> :CtrlPTag<cr>
  map <D-t> :CtrlP<CR>
  imap <D-t> <ESC>:CtrlP<CR>
endif

" ========= Syntastic ==========
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
" when set to 1 error window will automatically be opened, set 2 to close
let g:syntastic_auto_loc_list=1
" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>

" ========= Python Mode ==========
" don't use linter, we use syntastic for that
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" disable colorcolumn display at max_line_length
let g:pymode_options_colorcolumn = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 0
" open definitions on same window, and custom mappings for definitions and
" occurrences
let g:pymode_rope_goto_definition_bind = ',l'
let g:pymode_rope_goto_definition_cmd = 'e'
" enable python documenation in buffer
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
" allow to run python code
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'
" insert pdb breakpoint text
let g:pymode_breakpoint_bind = '<leader>d'

nmap <leader>D :tab split<CR>:PymodePython rope.goto()<CR>
nmap <leader>o :RopeFindOccurrences<CR>

" ========= Autoclose ==========
" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" ========= Signify ==========
" this first setting decides in which order try to guess your current vcs
let g:signify_vcs_list = ['git']
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" ========= Airline ==========
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" ========= ZOOMWIN ==========
map <leader>z :ZoomWinTabToggle<CR>

" ========= Buffergator ==========
" Determines how a new Buffergator window will be opened, L, R, T, B
let g:buffergator_viewport_split_policy = "B"
" Sets the default sort regime for buffer listing, default bufnum
let g:buffergator_sort_regime = "mru"
