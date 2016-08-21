set nocompatible              " be iMproved, required
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



"常规设置
"显示行数，设置软回车和缩进还有语法
set number
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent

"开启语法高亮
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on

"编码设置
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

"基于缩进或语法进行代码折叠
set foldmethod=indent
set foldmethod=syntax

"启动vim时关闭折叠代码
set nofoldenable

"显示光标当前位置
set ruler
"高亮显示当前行/列
set cursorline
set cursorcolumn

"高亮显示搜索结果
set hlsearch
colorscheme koehler
set gfn=Droid\ Sans\ Mono\ 12

"设置vim历史记录
set history=200
