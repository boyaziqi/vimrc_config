set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 

"html
"  isnowfy only compatible with python not python3
Plugin 'MatchTag'
Plugin 'matchit.zip'
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
"Plugin 'lepture/vim-jinja'
Plugin 'Glench/Vim-Jinja2-Syntax'

"auto-completion stuff
"Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/rope-vim'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'ervandew/supertab'
"code folding
"Plugin 'tmhedberg/SimpylFold'

"Colors!!!
"Plugin 'altercation/solarized'
"Plugin 'jnurmine/Zenburn'

call vundle#end()

filetype plugin indent on    " enables filetype detection
"let g:SimpylFold_docstring_preview = 1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
let g:pydiction_location = '/Users/fanxu/.vim/bundle/Pydiction/complete-dict'
let g:ycm_python_binary_path = 'python'
let g:hl_matchit_enable_on_vim_startup = 1

"custom keys
let mapleader=","
let maplocalleader=","
noremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
noremap <leader>k  :YcmCompleter GetDoc<CR>

"call togglebg#map("<F5>")
"colorscheme desert
"colorscheme murphy
"colorscheme molokai
set guifont=Monaco:h14

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
noremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>" ma<esc>`<i"<esc>`>a"<esc>
noremap <F5> :Tlist<CR>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
"nnoremap <C-j> <C-w><C-w>
"nnoremap <C-k> <C-w><C-k>
"在本行能选择，修改，删除括号里的内容
onoremap ih( :<c-u>normal! f(vi(<cr>
onoremap ih[ :<c-u>normal! f[vi[<cr>
onoremap ih{ :<c-u>normal! f{vi{<cr>
onoremap ih" :<c-u>normal! f"vi"<cr>
onoremap ih' :<c-u>normal! f'vi'<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap il" :<c-u>normal! F"vi"<cr>
onoremap il' :<c-u>normal! F'vi'<cr>

"I don't like swap files
set noswapfile

"turn on numbering
set background=dark
set number
set relativenumber
"set mouse=a
set autoindent
set hlsearch
colorscheme molokai

"设置显示结尾符号
"set list
"设置不折行
"set nowrap

"突出显示行和列
set cursorline
set cursorcolumn

set showtabline=1

"python with virtualenv support
py << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
set tags=./tags,tags;$HOME
command! SystemTags :set tags+=~/.vim/sys_tags
command! KernelTags :set tags+=~/.vim/kernel_tags
"omnicomplete
set autochdir

augroup filetype_python
autocmd!
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
"au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
"autocmd FileType python set foldmethod=indent
"use space to open folds
"nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------
augroup END

"js stuff"
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>

"html stuff"
autocmd BufNewFile,BufRead *.html setlocal nowrap
