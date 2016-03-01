" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off
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
"Search for anythin from vim
Plugin 'kien/ctrlp.vim'
"Git Integration
Plugin 'tpope/vim-fugitive'

"Ultisnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"for using YCM and ultisnips together
Plugin 'ervandew/supertab'

"surrondings
Plugin 'tpope/vim-surround'

"autoclose brackets
Plugin 'Raimondi/delimitMate'
"Notes
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

"Latex Folding
Plugin 'matze/vim-tex-fold'

"Nerdtree
Plugin 'scrooloose/nerdtree'

call vundle#end()

" indentation
filetype plugin indent on 
set ts=4 sts=4 sw=4 expandtab

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching


" Don't use Ex mode, use Q for formatting
map Q gq

"Leader key
:let mapleader = ' '


"call Flake8 if writing a python file
autocmd BufWritePost *.py call Flake8()

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

"Make it possible to undo CTRL-W
inoremap <C-w> <C-g>u<C-w>
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"default window size
set lines=35 columns=150
" Defining split window view behavior enabled by :vs and :sv
set splitbelow
set splitright
" Jumping between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Inserting blank lines while staying in normal mode
nnoremap <leader>o o<Esc>k
nnoremap <leader>O O<Esc>j

" Toggling listing of tabs/spaces
nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
" fast line copying to system clipboard
nnoremap <leader>y "*yy
" fast pasting from system clipboard
nnoremap <leader>p "*p
" show all marks, e. g. for use in tex files
nnoremap <leader>m :marks<CR>
" reload vimrc
nnoremap <leader>so :source ~/.vimrc<CR>
" Toggling colorcolumn
function! ColumnToggle()
  if(&colorcolumn != 0)
    set colorcolumn=0
  else
    set colorcolumn=80
  endif
endfunc
nnoremap <leader>f :call ColumnToggle()<CR>
" Method collapsing
set foldmethod=indent
set foldlevel=99
nnoremap <leader> za
"show docstring of collapsed method
let g:SimplyFold_docstring_preview=1

" File explorer hotkey
"map <leader>e :Explore<CR>
map <leader>e :NerdTreeToggle

" UltiSnip hotkey
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
 
" Note hotkeys and options
nnoremap <leader>nn :Note
nnoremap <leader>ns :SearchNotes
:let g:notes_directories = ['~/owncloud/notes']
" :let g:notes_suffix = '.txt'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Toggling absolute/relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set relativenumber!
  else
    set relativenumber
    set number!
  endif
endfunc

nnoremap <leader>r :call NumberToggle()<cr>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"Disable certain latex warnings
"let g:syntastic_tex_chktex_args = "--nowarn3 --nowarn40"
"Disable syntax check for latex
let g:syntastic_tex_checkers = ['']

" Show absolute line numbers on startup
set number

"UTF8 encoding
set encoding=utf-8

"spellchecking
nnoremap <leader>sd :setlocal spell! spelllang=de_de<CR>
nnoremap <leader>se :setlocal spell! spelllang=en_us<CR>

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" LaTeX macros for compiling and viewing

command TexView execute "silent !zathura %:r.pdf > /dev/null 2>&1 & " | redraw!
augroup latex_macros " {
    autocmd!
    autocmd FileType tex :nnoremap <leader>c :w<CR>:!latexmk -pdf -synctex=1 -shell-escape %<CR>
    autocmd FileType tex :nnoremap <leader>v :TexView<CR>
augroup END " }

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
