" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetyp off
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Method folding plugin
Plugin 'tmhedberg/SimpylFold'
"Python auto-indent
Plugin 'vim-scripts/indentpython.vim'
"syntax checking
Plugin 'scrooloose/syntastic'
"PEP8
Plugin 'nvie/vim-flake8'
"Color scheme
Plugin 'jnurmine/Zenburn'
"File Browser
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"Search for anythin from vim
Plugin 'kien/ctrlp.vim'
"Git Integration
Plugin 'tpope/vim-fugitive'
call vundle#end()





" pathogen
execute pathogen#infect()

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

"Leader key
:let mapleader = ' '
"YCM-customization
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Defining split window view behavior enabled by :vs and :sv

set splitbelow
set splitright

" Jumping between splits

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Inserting blank lines while staying in normal mode
nmap <S-Enter> O<Esc>j

" Method collapsing
set foldmethod=indent
set foldlevel=99
nnoremap <leader> za
"show docstring of collapsed method
let g:SimplyFold_docstring_preview=1

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" show line numbers
set number

"Python style (PEP8) Indentation
au BufNewFile,BufRead *.py
             \set tabstop=4
             \set softtabstop=4
             \set expandtab
             \set shiftwidth=4
             \set textwidth=79
             \set autoindent
             \set fileformat=unix
"Flag unneccesary whitespaces
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/ 

"UTF8 encoding
set encoding=utf-8
" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

"Only do this part when compiled with support for autocommands.
if has("autocmd")


  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 79 characters.
  autocmd FileType text setlocal textwidth=79

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
endif " has("autocmd")

"disable auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"colorscheme
set t_Co=256
set background=dark
colorscheme zenburn
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Powerline
  python from powerline.vim import setup as powerline_setup
  python powerline_setup()
  python del powerline_setup
  set laststatus=2

" NerdTREE hotkey
map <leader>t :NERDTreeToggle<CR>


