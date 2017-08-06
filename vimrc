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

"surroundings
Plugin 'tpope/vim-surround'
"quick comment/uncomment
Plugin 'tpope/vim-commentary'
"repeat surroundings
Plugin 'tpope/vim-repeat'
"autoclose brackets
Plugin 'Raimondi/delimitMate'
"Notes
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
"Orgmode
Plugin 'jceb/vim-orgmode'
"Speeddating for orgmode files
Plugin 'tpope/vim-speeddating'
"Latex-Box
Plugin 'LaTeX-Box-Team/LaTeX-Box' 
"Folding for Latex
Plugin 'matze/vim-tex-fold'
"Nerdtree
Plugin 'scrooloose/nerdtree'
"physical scrolling
Plugin 'yuttie/comfortable-motion.vim'
"Airline
Plugin 'vim-airline/vim-airline'
Plugin 'edkolev/tmuxline.vim'


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

" save swapfiles in their own directory
set swapfile
set dir=~/vimswap//


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
" open quickfix window
nnoremap <leader>" :cope<CR>
" close quickfix window
nnoremap <leader>' :ccl<CR>
" reload vimrc
nnoremap <leader>so :source ~/.vimrc<CR>



" Method collapsing
set foldmethod=indent
set foldlevel=99
nnoremap <leader> za
"show docstring of collapsed method
let g:SimplyFold_docstring_preview=1

" File explorer hotkey
"map <leader>e :Explore<CR>
map <leader>t :NERDTreeToggle<CR>

"Fast buffer switching
map <leader>n :bn<CR>
map <leader>N :bp<CR>
" UltiSnip hotkey
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
 
" Note hotkeys and options
:let g:notes_directories = ['~/ownCloud/notes']
map <leader>k :SearchNotes<CR>
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
"Disable syntax check for latex
let g:syntastic_tex_checkers = ['']
"ignore compilation files from latex in autocomplete and pdf files
set wildignore +=*run.xml,*.aux,**.bcf,*.blg,*.fdb_latexmk,*.fls,*.sta,*.synctex.gz,*.pdf
"python syntax
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_checker_args = "--ignore=E402"
let g:pep8_ignore="E402"

" Show absolute line numbers on startup
set number

"allow working with hidden buffers
set hidden

"UTF8 encoding
set encoding=utf-8

"spellchecking
nnoremap <leader>sd :setlocal spell! spelllang=de_de<CR>
nnoremap <leader>se :setlocal spell! spelllang=en_us<CR>

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1
" fix indent
autocmd FileType python :nnoremap <leader>i Jr
" insert spaces after comma
autocmd FileType python :nnoremap <leader>k :%s/,\(\S\)/, \1/g<CR>
" change default Tex filetype
let g:tex_flavor = "latex"
" LaTeX macros for compiling and viewing
" ignore certain warnings
let g:LatexBox_quickfix = 2
let g:LatexBox_ignore_warnings
            \ = ['Fancyhdr', 'Underfull', 'Overfull', 'specifier changed to']
"Compilation options
let g:LatexBox_latexmk_options
            \ = "-pdflatex='pdflatex -synctex=1 \%O \%S'"
"make compilation asyncronous
let g:LatexBox_latexmk_async = 1
let g:LatexBox_viewer = 'zathura'
augroup latex_macros " {
    autocmd!
    " compile
    autocmd FileType tex :nnoremap <leader>c :w<CR>:Latexmk<CR>
    " open okular
    autocmd FileType tex :nnoremap <leader>v :LatexView<CR>
    " open/close Table of Contents
    "autocmd FileType tex :nnoremap <leader>t :LatexTOCToggle<CR>
    function! Synctex()
            " remove 'silent' for debugging
            execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
    endfunction
    autocmd FileType tex :nnoremap <leader>f :call Synctex()<cr>
augroup END " }

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endi

"script for copying results from clipboard quickly
nnoremap <Leader>g "*pkdd :w<CR> :bw<CR>

"colorscheme
set t_Co=256
set background=dark
colorscheme zenburn
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

"physical scrolling config
let g:comfortable_motion_friction = 200.0
let g:comfortable_motion_air_drag = 0.0

" Powerline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
set laststatus=2
set noshowmode
let g:tmuxline_preset = 'tmux'
