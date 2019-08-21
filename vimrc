set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"git interface
Plugin 'airblade/vim-gitgutter'

"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'plasticboy/vim-markdown'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'

"html
"isnowfy only compatible with python not python3
Plugin 'MatchTag'
Plugin 'godlygeek/tabular'
" Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
" Plugin 'vimwiki/vimwiki'
Plugin 'Rykka/riv.vim'
Plugin 'Rykka/InstantRst'

"python sytax checker
Plugin 'nvie/vim-flake8'
"Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'fisadev/vim-isort'
Plugin 'scrooloose/syntastic'
Plugin 'Glench/Vim-Jinja2-Syntax'
"auto-completion stuff
Plugin 'Valloric/YouCompleteMe'
"Plugin 'klen/rope-vim'
Plugin 'ShowTrailingWhitespace'
" Plugin 'python-mode/python-mode'
" Plugin 'pylint.vim'

Plugin 'tmhedberg/SimpylFold'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"vim themes
Plugin 'chriskempson/base16-vim'

"code read
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'

"js hightlight
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/yajs'

"comment
Plugin 'tpope/vim-commentary'
"Plugin 'Raimondi/delimitMate'
call vundle#end()

filetype plugin indent on    " enables filetype detection

" option settings ---------------- {{{
set guifont=Monaco:h11
if has('python3')
      silent! python3 1
endif

" molokai背景色
let g:rehash256 = 1
" let g:molokai_original = 1
let base16colorspace=256
"custom keys
let mapleader=","
let maplocalleader=","

set iskeyword -=.
set helplang=en
"I don't like swap files
set noswapfile

"turn on numbering
set background=dark
set number
set relativenumber
"set mouse=a
set autoindent
set hlsearch incsearch
set shiftwidth=4
set tabstop=4
set expandtab
set ruler
colorscheme molokai

"设置显示结尾符号
"set list
"设置不折行
"set nowrap

"突出显示行和列
set cursorline
set cursorcolumn
set backupcopy=yes

set showtabline=1
set nofoldenable

"搜索是忽略大小写,禁止从头开始搜索
set ignorecase smartcase
"set nowrapscan
" }}}

" map section -------------------- {{{
noremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
noremap <leader>k  :YcmCompleter GetDoc<CR>


let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
noremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"给选中的部分加引号
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>" ma<esc>`<i"<esc>`>a"<esc>
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>' ma<esc>`<i'<esc>`>a'<esc>
noremap <F5> :Tlist<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
noremap <C-y> "+y
noremap <C-x> "+p
inoremap <C-d> <esc>gUiwea
nnoremap <C-d> %
nnoremap tb t(
nnoremap tB t{
nnoremap ti t[
nnoremap fb f(
nnoremap fB f{
nnoremap fi f[
inoremap jk <esc>
"inoremap <esc> <nop>
nnoremap <C-w> :cclose<cr>

onoremap q i"
onoremap b i[
onoremap p i{
" }}}


" global variable settings -------------------------- {{{
"autocomplete(YouCompleteMe)
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = 'python3'
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
"至少三个字符触发
let g:ycm_min_num_of_chars_for_completion = 3
"关掉preview
set completeopt-=preview

let g:SimpylFold_docstring_preview=1

let g:pydiction_location = '/Users/fanxu/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 20

"终端vim启动时自动打开nerdtree
let g:nerdtree_tabs_open_on_console_startup=0

"按python3标准检测
let g:pymode_python = 'python3'
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']
let g:pymode_rope = 0

let g:ag_working_path_mode="r"

"打开tabline功能
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 0

"这个是安装字体后 必须设置此项"
"需要安装字体https://github.com/powerline/fonts
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" mxw/vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']
" }}}

" nvie / vim-flake8
let g:flake8_show_in_file=1

"python with virtualenv support
" py << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUA_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   sys.path.insert(0, project_base_dir)
"   activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
set tags=./tags,tags;$HOME
command! SystemTags :set tags+=~/.vim/sys_tags
command! KernelTags :set tags+=~/.vim/kernel_tags
"omnicomplete
set autochdir

" python file settings ---------------------------------{{{
augroup filetype_python
autocmd!
autocmd FileType python set omnifunc=pythoncomplete#Complete
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
au BufRead,BufNewFile *.py,*.pyw, set textwidth=79

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
set foldlevel=99
"use space to open folds
nnoremap <space> za
"----------Stop python PEP 8 stuff--------------
augroup END
" }}}

"js file settings -------------------{{{
augroup javascript
    autocmd!
    autocmd FileType javascript setlocal textwidth=120
    autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
augroup END
" }}}

" html file settings ----------------------- {{{
augroup html
    autocmd!
    autocmd FileType html setlocal shiftwidth=4 tabstop=4 textwidth=0 nowrap
    autocmd FileType jinjia setlocal shiftwidth=4 tabstop=4 textwidth=0 nowrap
augroup END
" }}}

" makedown file settings ------------------ {{{
augroup markdown
    autocmd!
    "au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
