set nocompatible              " be iMproved, required
set number

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'becaning/vimdoccn'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-powerline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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

"emmet  配置
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


filetype plugin on
runtime macros/matchit.vim


"jsbeautify 配置
map <Leader>ff :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <Leader>ff :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <Leader>ff :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <Leader>ff :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <Leader>ff :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <Leader>ff :call CSSBeautify()<cr>

"for svg
au BufNewFile,BufRead *.svg setf svg 

"for py
au BufNewFile *.py :call PYskeleton()

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
    call cursor(5,5)
endfunction

"格式花JSON
command! JsonFormat :execute '%!python -m json.tool'
  \ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)).encode(\"utf-8\"), sys.stdin.read()))"'
  \ | :set ft=javascript
  \ | :1
nmap <F4> :JsonFormat<CR> 

"powerline配置
let g:Powerline_symbols='unicode'
"let g:Powerline_symbols='fancy'
set encoding=utf-8 
set laststatus=2
set guifont="PowerlineSymbols.otf"

"配色
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
"gui字体设置
set guifont=Monospace\ 14

"其他配置
set history=1000         
"检测文件类型  
filetype on  
" 针对不同的文件类型采用不同的缩进格式    
filetype indent on                 
"允许插件    
filetype plugin on  
"启动自动补全  
filetype plugin indent on  
"兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
"set nocompatible        
set autoread          " 文件修改之后自动载入。  
" 取消备份。  
set nobackup  
set nowb  
set noswapfile  


"贴时保持格式  
"set paste 

"显示行号：  
set number  
"为方便复制，用<F6>开启/关闭行号显示:  
nnoremap <F6> :set nonumber!<CR>:set foldcolumn=0<CR>  

"括号配对情况  
set showmatch  
" How many tenths of a second to blink when matching brackets  
set mat=2  

" 代码折叠  
set foldenable  
" 折叠方法  
" manual    手工折叠  
" indent    使用缩进表示折叠  
" expr      使用表达式定义折叠  
" syntax    使用语法定义折叠  
" diff      对没有更改的文本进行折叠  
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}  
set foldmethod=syntax  
" 在左侧显示折叠的层次  
"set foldcolumn=4  

set tabstop=4                " 设置Tab键的宽度        [等同的空格个数]  
set sta
set shiftwidth=4  
set expandtab                " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]  
" 按退格键时可以一次删掉 4 个空格  
set softtabstop=4  


set ai "Auto indent  
set si "Smart indent  

"显示当前的行号列号：  
set ruler  
"在状态栏显示正在输入的命令  
set showcmd  

" Set 7 lines to the cursor - when moving vertically using j/k 上下滚动,始终在中间  
set so=7    
set cursorline              " 突出显示当前行


