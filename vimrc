"
" my vimrc - Ralf Allar
"


" disable vi compatibility mode (redundant when .vimrc exists, but explicit)
set nocompatible
" disable modelines for security (prevent files from injecting vim settings)
set nomodeline

" Help
" tab complete in the command line
set wildmenu

" show all matches immediately on tab
set wildmode=full


" Visual
"
" use the industry color scheme
colorscheme industry
" dark background for correct color matching
set background=dark
" show file name in the terminal window title
set title
" show partial commands in the bottom right while typing
set showcmd

" Status line
" always show the status line, even with a single buffer
set laststatus=2
" status line: full path, flags, file format, type, line/total, column
set statusline =%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

"set cursorline       " show a line at cursor position

" allow backspace over indentation, line breaks, and insert start
set backspace=indent,eol,start

" Enable filetype plugins
filetype plugin on
" enable indenting for files (language specific)
filetype indent on

" briefly jump to matching bracket when closing one is inserted
set showmatch
" duration of the bracket match highlight in tenths of a second
set matchtime=2

" search options
" highlight search matches as you type
set incsearch
" ignore case when searching
set ignorecase
" override ignorecase when search contains uppercase letters
set smartcase
" keep matches highlighted after search
set hlsearch

" clear search highlighting with Backspace
nmap <silent>  <BS>  :nohlsearch<CR>

" set ruler  " redundant with statusline

" enable syntax highlighting
syntax on

" dis/enable mouse (uncomment for mouse support)
" set mouse=a

" show absolute line number on the current line
set number
" show relative line numbers for all other lines
set relativenumber

set encoding=utf8
" wrap long lines at word boundaries, not mid-word
set linebreak
" keep cursor at least 3 lines from top/bottom edge
set scrolloff=3
" keep cursor at least 5 columns from left/right edge
set sidescrolloff=5

set ffs=unix,dos,mac

" keep swap file enabled (acts as a lock for concurrent edits)
set swapfile
set nobackup
set nowritebackup

" Tabs
" Tabstop is about how wide a tab is defined, while softtabstop is about how
" far the cursor moves while typing tab
" each tab press inserts 2 spaces
set softtabstop=2
set tabstop=2
" indent/unindent by 2 spaces with << and >>
set shiftwidth=2
" insert spaces instead of tab characters
set expandtab
" set smarttab  " redundant with expandtab

" new lines inherit indentation from the previous line
set autoindent
" disable line wrapping
set nowrap

" Performance
" skip screen redraws during macro execution for better performance
set lazyredraw
" increase command and search history beyond the default of 20
set history=1000
" reduce delay for swap write and plugin responsiveness (ms)
set updatetime=300

" Persistent undo
" save undo history to disk so it persists across sessions
set undofile
" directory for undo files (created by install.sh)
set undodir=~/.vim/undo
" maximum number of undoable changes
set undolevels=1000
" maximum lines saved for undo on buffer reload
set undoreload=10000

" System clipboard integration
" use system clipboard as the default register (if available)
if has('clipboard')
  set clipboard=unnamedplus
endif

" Visual feedback
" always show the sign column to prevent layout shifts
set signcolumn=yes

" Makros
let @p = "0ki```powershell\<Esc>jji```\<Esc>"
let @c = "0ki```console\<Esc>jji```\<Esc>"
