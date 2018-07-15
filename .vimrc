" vimrc for Ralf Allar
"
" set nocompatible to vi (so vim improvements are not turned off)
" could be useless, since this option is set when vim finds a .vimrc file
" automatically
set nocompatible

" Help
set wildmenu          " tab complete in the command line

" Visual
"
colorscheme blue 
set background=dark   " Use colors which match a dark background
set title             " show title in window
set showcmd           " Show incomplete commands at the bottom.

" Status line
set laststatus=2      " show statusline even with only one buffer
set statusline =%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

"set cursorline       " show a line at cursor position

set backspace=indent,eol,start " Allow backspacing over indention, line breaks and insertion start.

" Enable filetype plugins
filetype plugin on
filetype indent on    " enable indenting for files

" search options
set incsearch         " find the next match when typing
set ignorecase        " ignore case when searching
set smartcase         " except when typing a capital letter
set hlsearch          " highlight searches

" Make delete key in Normal mode remove the persistently highlighted matches
nmap <silent>  <BS>  :nohlsearch<CR>

" show current position
" set ruler

" enable syntax highlighting
syntax enable

" enable mouse
set mouse=a

set number            " show line numbers
set relativenumber    " show relative line numbers

set encoding=utf8

set ffs=unix,dos,mac

" no swapfile, etc. //  sometimes I turned it off when it annoyes me and then
" I turn it on again when I want to have that semaphore
"
" set noswapfile
set directory=$HOME/.vim/swp//   " copy all swp files to the same directoryset nobackup
set nowb

" Tabs
" Tabstop is about how wide a tab is defined, while softtabstop is about how
" far the cursor moves while typing tab
set softtabstop=2     " Indent by 2 spaces when hitting tab
set tabstop=4
set shiftwidth=2      " this is how far text is intended with << and >>

set expandtab         " on pressing tab, insert spaces
set smarttab          " when on, a <tab> in front of a line inserts blanks according to 'shiftwidth'

set autoindent        " new lines inherit the indention from previous lines 
set si "Smart indent
set wrap "Wrap lines

" Abbreviations
ab vgr Viele Grüße,<CR>Ralf Allar
