

" install Vundle bundles
" if filereadable(expand("~/.vimrc.bundles"))
  " source ~/.vimrc.bundles
" endif
source ~/.vim/filetype.vim

"source ~/.vimrc.bundles
" ensure ftdetect et al work by including this after the Vundle stuff
"filetype plugin indent on


" 修改leader键
let mapleader = ','
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

filetype plugin indent on
filetype plugin on "支持插件

set fileencodings=ucs-bom,utf-8,cp936 "自动识别的文件编码
 " set encoding=utf-8
 " set fileencodings=utf-8
 " set termencoding=utf-8

set fileformats=unix
set encoding=prc

" tab相关变更
" set tabstop=4     " 设置Tab键的宽度        [等同的空格个数]
" set shiftwidth=4  " 每一次缩进对应的空格数
" set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
" 只有支持autocommands时会执行这部分代码。
if has("autocmd")

filetype plugin indent on
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

endif
"　　” 对于其它情况，使用4个空格宽度的TA
set tabstop=4 ""“ TAB的宽度被设置为4个空格。
"　　” 但仍然是\t. 只是vim把它解释成4个空格宽度，用别的编辑器还是\t符号
"　　“ Vim will interpret it to be having
"　　” a width of 4.
set shiftwidth=4 ""“ 缩进使用4个空格的宽度。
set softtabstop=4 "" 设置tab所占的列数，当输入tab时，设为4个空格的宽度。
set expandtab "   扩展tab为空格。

" 设定复制粘贴时取消自动换行
"set pastetoggle = <F8>

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
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
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun





set autoindent "每行缩进与上一行一致
set smartindent "自动在enter后缩进两个空格
set cindent
set background=dark
"set expandtab
"set smarttab
"set shiftwidth=2
"set softtabstop=2
"set tabstop=2
"set wildignore=*.pyc
"set ignorecase
set smartcase
set hlsearch
set incsearch
set shiftround
set history=1000
set noswapfile
set nobackup
set number
set linespace=3

" 相对行号      行号变成相对，可以用 nj  nk   进行跳转 5j   5k 上下跳5行
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

set nobackup
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
set t_vb=
set tm=500
" Remember info about open buffers on close"

"分别指1000个标记信息，保存缓冲区列表，500冒号命令，1000输入历史命令
set viminfo='1000,%,:500,@1000

" For regular expressions turn magic on
set magic
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l







"some usful map
imap kj <Esc>
nmap <leader>y "*yy
vmap <leader>y "*yy
nmap <leader>p "*p
nmap <F5> :source ~/.vimrc<CR>
"Smart way to move between windows 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"执行其他代码
autocmd FileType python nnoremap <buffer> <F2> :w<CR>:!python % <CR>
autocmd FileType javascript nnoremap <buffer> <F2> :w<CR>:!python % <CR>

"windows max and so on
"最大化
nmap <leader>sx <ESC>:simalt ~x<CR>
"还原
nmap <leader>sr <ESC>:simalt ~r<CR>
"最小化
nmap <leader>sn <ESC>:simalt ~n<CR>
" Go to home and end using capitalized directions
noremap H ^
noremap L $
" noremap <c-e> f
" noremap <C-y> g
"
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
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>
" remap U to <C-r> for easier redo
nnoremap U <C-r>
"iunmap <C->












"==========================================
" Theme Settings  主题设置
"==========================================

" Set extra options when running in GUI mode
"if has("gui_running")
"    set guifont=Monaco:h14
"    if has("gui_gtk2")   "GTK2
"        set guifont=Monaco\ 12,Monospace\ 12
"    endif
"    set guioptions-=T
"    set guioptions+=e
"    set guioptions-=r
"    set guioptions-=L
"    set guitablabel=%M\ %t
"    set showtabline=1
"    set linespace=2
"    set noimd
"    set t_Co=256
"endif

" allows cursor change in tmux mode
"if exists('$TMUX')
"    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif

" theme主题
set background=dark
"set background=day
set t_Co=256
"colorscheme solarized
colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Bright
"colorscheme desert





" 设置标记一列的背景颜色和数字一行颜色一致
"hi! link SignColumn   LineNr
"hi! link ShowMarksHLl DiffAdd
"hi! link ShowMarksHLu DiffChange
"
"" for error highlight，防止错误整行标红导致看不清
"highlight clear SpellBad
"highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
"highlight clear SpellCap
"highlight SpellCap term=underline cterm=underline
"highlight clear SpellRare
"highlight SpellRare term=underline cterm=underline
"highlight clear SpellLocal
"highlight SpellLocal term=underline cterm=underline
"
"
"
"





"create undo file
if has('persistent_undo')
  set undolevels=1000         " How many undos
  set undoreload=10000        " number of lines to save for undo
  set undofile                " So is persistent undo ...
  set undodir=/tmp/vimundo/
endif


" " Auto Session Save/Restore
" function GetProjectName()
    " " Get the current editing file list, Unix only
    " let edit_files = split(system("ps -o command= -p " . getpid()))
    " if len(edit_files) >= 2
        " let project_path = edit_files[1]
        " if project_path[0] != '/'
            " let project_path = getcwd() . project_path
        " endif
    " else
        " let project_path = getcwd()
    " endif

    " return shellescape(substitute(project_path, '[/]', '', 'g'))
" endfunction

" function SaveSession()
    " "NERDTree doesn't support session, so close before saving
    " execute ':NERDTreeClose' 
    " let project_name = GetProjectName()
    " execute 'mksession! ~/.vim/sessions/' . project_name
" endfunction

" function RestoreSession()
    " let session_path = expand('~/.vim/sessions/' . GetProjectName())
    " if filereadable(session_path)
        " execute 'so ' . session_path
        " if bufexists(1)
            " for l in range(1, bufnr('$'))
                " if bufwinnr(l) == -1
                    " exec 'sbuffer ' . l
                " endif
            " endfor
        " endif
    " endif
    " "Make sure the syntax is on
    " syntax on 
" endfunction

" nmap ssa :call SaveSession()
" smap SO :call RestoreSession()
" autocmd VimLeave * call SaveSession()
" autocmd VimEnter * call RestoreSession()

" " Persistent undo
" set undodir=~/.vim/undodir
" set undofile
" set undolevels=1000 "maximum number of changes that can be undone
" set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" 为C程序提供自动缩进
set smartindent 
"代码补全
set completeopt=preview,menu 
"自动补全
:inoremap ( ()<ESC>i 
:inoremap ) <c-r>=ClosePair(')')<CR> 
:inoremap { {<CR>}<ESC>O 
:inoremap } <c-r>=ClosePair('}')<CR> 
:inoremap [ []<ESC>i 
:inoremap ] <c-r>=ClosePair(']')<CR> 
:inoremap " ""<ESC>i 
":inoremap " <c-r>=ClosePair('"')<CR> 
:inoremap ' ''<ESC>i 
":inoremap ' <c-r>=ClosePair('\'')<CR> 
function! ClosePair(char) 
if getline('.')[col('.') - 1] == a:char 
return "\<Right>" 
else 
return a:char 
endif 
endfunction 
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu 








