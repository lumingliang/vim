"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,gb2312
"set fileencodings+=big5,euc-jp,euc-kr,latin1
"let &termencoding=&encoding
set encoding=utf-8
language messages en_US
syntax on
" source ~/.vim/filetype.vim
" set Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
source ~/.vimrc.bundles

call vundle#end()
filetype plugin indent on


" 修改leader键
let g:mapleader = ','


"General seting 
set nocompatible
filetype on 
set foldmethod=marker
set linebreak
set wildmenu
"set selection=inclusive
"set selectmode=mouse,key

"set completeopt=longest,menu
set wildmenu                           " show a navigable menu for tab completion"
set wildmode=longest,list,full        "navigable can expand to a full menu for
set wildignore=*.o,*~,*.pyc,*.class

set number
set ruler
syntax on
"禁用鼠标点击，但可以利用鼠标复制代码
set mouse-=a
set mousehide               " Hide the mouse cursor while typing



" tab相关变更
set tabstop=4     " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " 每一次缩进对应的空格数
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set expandtab "   扩展tab为空格。

" 设定复制粘贴时取消自动换行
"set pastetoggle = <F8>

" 命令行（在状态行下）的高度，默认为1，这里是2
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" 取消换行。
"set nowrap

""在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" set winwidth=79
"set autochdir


" 代码折叠
"set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
"set foldmethod=indent
"set foldlevel=99
" 代码折叠自定义快捷键
"let g:FoldMethod = 0
"map <leader>zz :call ToggleFold()<cr>
"fun! ToggleFold()
"    if g:FoldMethod == 0
"        exe "normal! zM"
"        let g:FoldMethod = 1
"    else
"        exe "normal! zR"
"        let g:FoldMethod = 0
"    endif
"endfun


"set autoindent "每行缩进与上一行一致
"set smartindent "自动在enter后缩进两个空格
"set cindent
"set smartcase
set hlsearch
set incsearch
"set shiftround
set history=1000
set noswapfile
set nobackup
set number
"set linespace=3

" 相对行号      行号变成相对，可以用 nj  nk   进行跳转 5j   5k 上下跳5行
"set relativenumber number
"au FocusLost * :set norelativenumber number
"au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
"autocmd InsertEnter * :set norelativenumber number
"autocmd InsertLeave * :set relativenumber
"function! NumberToggle()
"  if(&relativenumber == 1)
"    set norelativenumber number
"  else
"    set relativenumber
"  endif
"endfunc
"nnoremap <C-n> :call NumberToggle()<cr>

"set nobackup
" 关闭交换文件
set noswapfile
"匹配文件时候忽视这些
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn
set cursorcolumn
set cursorline          " 突出显示当前行
"设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
"""好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

" No annoying sound on errors
" 去掉输入错误的提示声音
set title                " change the terminal's title
set novisualbell         " don't beep
set noerrorbells         " don't beep
"set t_vb=
"set tm=500
" Remember info about open buffers on close"

"分别指1000个标记信息，保存缓冲区列表，500冒号命令，1000输入历史命令
set viminfo='1000,%,:500,@1000

" For regular expressions turn magic on
set magic
" Configure backspace so it acts as it should act
"set backspace=eol,start,indent
"set whichwrap+=<,>,h,l





"some usful map
vmap ls <Esc>
imap kk <Esc>
nmap e 10<C-e>
nmap t 10<C-y>
nmap <up> 3<C-y>
nmap <down> 3<C-e>
nmap <leader>y "*yy
vmap <leader>y "*yy
nmap <leader>p "*p

" nmap <F5> :source ~/.vimrc<CR>
"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
noremap H ^
noremap L $
noremap r 3w
noremap f 3b

"执行其他代码
" autocmd FileType python nnoremap <buffer> <F2> :w<CR>:!python % <CR>
" autocmd FileType javascript nnoremap <buffer> <F2> :w<CR>:!python % <CR>

"设置标签
noremap <leader>n :tabnew<CR>
noremap <leader>1 :tabnext<CR>
noremap <leader>2 :tabprevious<CR>


"Map ; to : and save a million keystrokes
" ex mode commands made easy 用于快速进入命令行
nnoremap ; :


" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>
" --------tab/buffer相关

"Use arrow key to change buffer"
" TODO: 如何跳转到确定的buffer?
" :b1 :b2   :bf :bl
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
noremap <left> :bp<CR>
noremap <right> :bn<CR>
" select all
map <Leader>sa ggVG"
" 滚动Speed up scrolling of the viewport slightly
" remap U to <C-r> for easier redo
nnoremap U <C-r>


"==========================================
" Theme Settings  主题设置
"==========================================


" theme主题
set background=dark
"set background=day
"syntax enable
"set background=light
set t_Co=256
"colorscheme solarized
"colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Bright
colorscheme molokai
"colorscheme desert




"create undo file
if has('persistent_undo')
  set undolevels=1000         " How many undos
  set undoreload=10000        " number of lines to save for undo
  set undofile                " So is persistent undo ...
  set undodir=/tmp/vimundo/
endif
