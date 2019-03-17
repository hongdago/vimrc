"设置终端颜色位数
set t_Co=256
"去掉vi的一致性
set nocompatible
"显示行号
set number

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

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 'Chiel92/vim-autoformat'

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

"vim-airline 配置
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	  let g:airline_symbols = {}
endif


"ale配置

"Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Enable completion where available.
let g:ale_completion_enabled = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1


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


"为方便复制，用<F6>开启/关闭行号显示:  
nnoremap <F6> :set nonumber!<CR>:set foldcolumn=0<CR>  

"autoformat 配置
noremap <F7> :Autoformat<CR>

"格式化选中的JSON串
vmap <F4> :!python3 -m json.tool \| python3 -c "import sys; sys.stdout.write(sys.stdin.read().encode().decode('unicode_escape'))" <CR>

if exists('$TMUX')
  set term=screen-256color
endif

"latex-suite配置
let g:tex_flavor='latex'
let g:Tex_FormatDependency_pdf = ''

let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'okular'
let g:Tex_DefaultTargetFormat = 'pdf'

set grepprg=grep\ -nH\ $*
au Filetype tex set sw=2
au Filetype tex set iskeyword+=:
au Filetype tex set winaltkeys=no
