set t_Co=256
"去掉vi的一致性
set nocompatible
"显示行号
set number
"设置字体
"set guifont=Monaco:h13
"开启语法高亮
syntax on
"打开filetype
filetype plugin indent on
"忽略大小写
set ignorecase   
"高亮显示匹配项
set hlsearch
"括号配对情况  
set showmatch  

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,GBK

"显示当前的行号列号：  
"set ruler  
"在状态栏显示正在输入的命令  
"set showcmd  

"高亮标记当前行和当前列
set cursorcolumn
set cursorline

set autoindent
set smartindent

"Vundle配置
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'yongqiangren/vimdoccn'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Chiel92/vim-autoformat'
Plugin 'mattn/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'suan/vim-instant-markdown'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"airline setting
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

"YouCompleteMe配置
let g:ycm_python_binary_path = "/usr/bin/python3"
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1

"netrw配置
"let g:netrw_browse_split=4
"let g:netrw_preview   = 1
"let g:netrw_liststyle = 3
"let g:netrw_winsize   = 70
"let g:netrw_altv = 1

"nerdtree 配置
map <C-n> :NERDTreeToggle<CR>
"vim不指定具体文件打开是，自动使用nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"vim指定打开是目录时，自动使用nerdtreee
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"当vim中没有其他文件，值剩下nerdtree的时候，自动关闭窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"syntastic配置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "!level":  "errors" }
let g:syntastic_python_checkers = ['pylint']

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


"为python的特殊配置
let python_highlight_all=1

" 设置Tab键的宽度        [等同的空格个数]  
au Filetype python set tabstop=4
" 按退格键时可以一次删掉 4 个空格  
au Filetype python set softtabstop=4
au Filetype python set smarttab
au Filetype python set shiftwidth=4  
" 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]  
au Filetype python set expandtab                
"au Filetype python set textwidth=79
au Filetype python set foldmethod=indent
au Filetype python set foldlevel=99

"根据模板创建python新文件
au BufNewFile *.py :call PYskeleton()
"新建python文件模板
function! PYskeleton()
    call setline(1,"#!/usr/bin/env python")
    call setline(2,"#-*- coding: utf-8 -*-")
    call setline(3,'"""')
    call setline(4,printf("FileName:%s",expand("%:t")))
    call setline(5,"DESC:")
    call setline(6,'"""')
    call setline(7,'')
    call setline(8,'')
    call setline(9,'if __name__ == "__main__":')
    call setline(10,'    pass')
    call cursor(5,5)
endfunction

"按键设置
"<F4> 格式花JSON
command! JsonFormat :execute '%!python -m json.tool'
  \ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)).encode(\"utf-8\"), sys.stdin.read()))"'
  \ | :set ft=javascript
  \ | :1
nmap <F4> :JsonFormat<CR> 

"自动执行<F5>
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!clear"
		exec "!time python %"
	elseif &filetype == 'html'
		exec "!firefox % &"
	"elseif &filetype == 'mkd'
	"	exec "!~/.vim/markdown.pl % > %.html &"
	"	exec "!firefox %.html &"
	endif
endfunc


"为方便复制，用<F6>开启/关闭行号显示:  
nnoremap <F6> :set nonumber!<CR>:set foldcolumn=0<CR>  
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

"自动格式化
nnoremap <F7> :Autoformat<CR>
