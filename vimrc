" Vundle stuff
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'tpope/vim-commentary'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
" runtime! debian.vim

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		    " Hide buffers when they are abandoned
set mouse=a		    " Enable mouse usage (all modes)
set number	    	" Show line numbers
set ts=4		    " Set tabs to have 4 spaces
set autoindent		" Indent when moving to next line while writing code
set expandtab		" Expand tab to spaces
set shiftwidth=4	" When using the << or >> commands, shift lines by 4 spaces
set cursorline		" Show a visual line under the cursor current line
set textwidth=79    " Set maximum line width
set ruler           " Show the current row and column of cursor
let python_highlight_all = 1 " Enable all Python highlight features


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Use the system clipboard for copy/paste
set clipboard=unnamed

" Insert newline without entering insert mode (Shift-Enter)
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Enable pathogen
execute pathogen#infect()
call pathogen#infect()
"call pathogen#helptags()

" Navigate between splits with e.g. Ctrl+h instead of Ctrl+w+h
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Show name of current file in status line
set ls=2

" Enable python indentation
let g:pymode_indent = 1

" Close preview window after autocompletion
autocmd CompleteDone * pclose

" Make sure vim uses 256 if
set t_Co=256

" Colorscheme
colorschem molokai

" For thinner indent-guides lines (toggle with \ig)
let g:indent_guides_guide_size = 1

" Setup centralized backup and swap directory
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

" Turn off vim rope
let g:pymode_rope = 0

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" swap iTerm2 cursors in vim insert mode when using tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" Set leader key to Space (instead of '\')
let mapleader = "\<Space>"

" Insert pdb linebreak using leader + p
map <Leader>p :call InsertLine()<CR>
function! InsertLine()
  let trace = expand("import pdb; pdb.set_trace()")
  execute "normal o".trace
endfunction

" Change max length of line in python-mode
let g:pymode_options_max_line_length=90

" Set colorcolumn
set colorcolumn=79
