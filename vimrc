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
"Color scheme
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline-themes'
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
"Airline
Plugin 'vim-airline/vim-airline'
Plugin 'edkolev/tmuxline.vim'


call vundle#end()

"BASIC SETUP
" indentation
filetype plugin indent on
set ts=4 sts=4 sw=4 expandtab
" save swapfiles in their own directory
set swapfile
set dir=~/vimswap//
set backupdir=~/vimbackup//
" versions/backup file
if has("vms")
  set nobackup		
else
  set backup
endif
" keep 50 lines of command line history
set history=50
" show the cursor position all the time
set ruler
" display incomplete commands
set showcmd	
" do incremental searching
set incsearch		
" Don't use Ex mode, use Q for formatting
map Q gq
" wildmenu and path expansion for easy file navigation
set path+=**
set wildmenu
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
"ignore compilation files from latex in autocomplete and pdf files
set wildignore +=*run.xml,*.aux,**.bcf,*.blg,*.fdb_latexmk,*.fls,*.sta,*.synctex.gz,*.pdf
" Show absolute line numbers on startup
set number
"allow working with hidden buffers
set hidden
"UTF8 encoding
set encoding=utf-8
" show the matching part of the pair for [] {} and ()
set showmatch
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

"LEADER
"Leader key
:let mapleader = ' '
"toggle fold
nnoremap <leader> za
" Inserting blank lines while staying in normal mode
nnoremap <leader>o o<Esc>k
nnoremap <leader>O O<Esc>j
" Toggling listing of tabs/spaces
nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
" fast line copying to system clipboard
nnoremap <leader>y "*yy
" fast pasting from system clipboard
nnoremap <leader>p "+p
" fast pasting from system clipboard on newline
nnoremap <leader>P o<Esc>"+p
" show all marks, e. g. for use in tex files
nnoremap <leader>m :marks<CR>
" open quickfix window
nnoremap <leader>" :cope<CR>
" close quickfix window
nnoremap <leader>' :ccl<CR>
" reload vimrc
nnoremap <leader>so :source ~/.vimrc<CR>
" save  session
nnoremap <leader>sm :mksession! Session.vim<CR>
" restore previous session
nnoremap <leader>ss :source Session.vim<CR>
" File explorer hotkey
map <leader>t :NERDTreeToggle<CR>
"Fast buffer switching
map <leader>n :bn<CR>
map <leader>N :bp<CR>
"copying results from clipboard quickly
nnoremap <Leader>g "*pkdd :w<CR> :bw<CR>
"spellchecking
nnoremap <leader>sd :setlocal spell! spelllang=de_de<CR>
nnoremap <leader>se :setlocal spell! spelllang=en_us<CR>
"relative number toggling
nnoremap <leader>r :call NumberToggle()<cr>
" Colorscheme Toggling
nnoremap <leader>C :call ColorToggle()<cr>

" Method collapsing
set foldmethod=indent
set foldlevel=99
"show docstring of collapsed method
let g:SimplyFold_docstring_preview=1

" PLUGINS
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
"python syntax
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = "--ignore=E402,E226"
let g:pep8_ignore="E402,E226"
"Bash syntax check
let g:syntastic_sh_checkers = ['shellcheck']

"PYTHON
" enable all Python syntax highlighting features
let python_highlight_all = 1
" fix indent
autocmd FileType python :nnoremap <leader>i Jr
" insert spaces after comma
autocmd FileType python :nnoremap <leader>k :%s/,\(\S\)/, \1/g<CR>

"LATEX
" change default Tex filetype
let g:tex_flavor = "latex"
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

"COLORSCHEME (solarized as default)
set background=light
colorscheme solarized
let g:airline_theme='solarized'
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight notesListNumber ctermfg=2
highlight notesListBullet ctermfg=6
highlight notesSingleQuoted ctermfg=6

"FUNCTIONS
" Toggling between light and dark
function! ColorToggle()
  if g:airline_theme == "molokai"
    set background=light
    colorscheme solarized
    let g:airline_theme='solarized'
    :AirlineRefresh
    highlight Normal ctermbg=NONE
    highlight nonText ctermbg=NONE
  else
    set background=dark
    colorscheme molokai
    let g:airline_theme='molokai'
    :AirlineRefresh
    highlight Normal ctermbg=NONE
    highlight nonText ctermbg=NONE
  endif
endfunc
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
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" POWERLINE
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
set laststatus=2
set noshowmode
let g:tmuxline_preset = {
      \'a'    : '[#S]',
      \'win'  : ['#I', '#F', '#W'],
      \'cwin'  : ['#I', '#W'],
      \'z'    : ['%a', '%d.%m.%y'],
      \'options' : {'status-justify' : 'left'}}
