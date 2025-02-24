" 基础设置
set nocompatible            " 禁用兼容模式
set encoding=utf-8          " 统一编码
set number                  " 显示行号
" set relativenumber          " 相对行号
set tabstop=4               " Tab宽度
set shiftwidth=4            " 自动缩进宽度
set expandtab               " Tab转空格
set smartindent             " 智能缩进
set cursorline              " 高亮当前行
set mouse=a                 " 启用鼠标支持
set clipboard=unnamedplus   " 共享系统剪贴板
syntax enable               " 语法高亮

" 搜索优化
set hlsearch                " 高亮搜索结果
set incsearch               " 实时搜索
set ignorecase              " 忽略大小写
set smartcase               " 智能大小写匹配

" 性能优化
set lazyredraw              " 延迟重绘
set ttyfast                 " 终端快速模式

call plug#begin('~/.vim/plugged')

" 界面美化
Plug 'vim-airline/vim-airline'          " 状态栏
Plug 'vim-airline/vim-airline-themes'   " 状态栏主题
Plug 'morhetz/gruvbox'                  " 配色方案

" 文件导航
Plug 'preservim/nerdtree'               " 文件树
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " 模糊搜索
Plug 'junegunn/fzf.vim'

" 代码增强
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " LSP支持
Plug 'jiangmiao/auto-pairs'             " 自动补全括号
Plug 'tpope/vim-commentary'             " 快速注释
Plug 'tpope/vim-surround'               " 快速包围符号

" Git集成
Plug 'tpope/vim-fugitive'               " Git操作
Plug 'airblade/vim-gitgutter'           " Git差异标记

Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kaicataldo/material.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'folke/tokyonight.nvim'
Plug 'sainnhe/everforest'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'olimorris/onedarkpro.nvim'  " Neovim 专用


call plug#end()

" 主题
colorscheme onedark 
set background=dark        " 深色模式
let g:airline_theme='onedark'  " 状态栏主题同步
set termguicolors          " 启用真彩色支持（需终端支持）

map <C-n> :NERDTreeToggle<CR>  " Ctrl+n 开关文件树
let NERDTreeShowHidden=1    " 显示隐藏文件
" 常用快捷键
nmap <silent> gd <Plug>(coc-definition)    " 跳转到定义
nmap <silent> gr <Plug>(coc-references)    " 查看引用
nmap <silent> [g <Plug>(coc-diagnostic-prev)  " 上一个错误
nmap <silent> ]g <Plug>(coc-diagnostic-next)  " 下一个错误
" Ctrl+p 搜索文件
nmap <C-p> :Files<CR>
" Ctrl+f 全局内容搜索
nmap <C-f> :Rg<CR>
set foldmethod=indent    " 按缩进折叠
" 绑定快捷键快速切换明暗模式
nmap <Leader>tl :set background=light<CR>
nmap <Leader>td :set background=dark<CR>
