set number
set shiftwidth =4
set tabstop=4
set encoding=utf-8
set hlsearch
set autoindent
set clipboard=unnamed
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline 
set backspace=2
set cursorline "突出显示当前行
set showmatch " 显示括号匹配

filetype plugin indent on
syntax on
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
" 主题
Plug 'morhetz/gruvbox'
" 代码补全插件
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
" 语法检查
Plug 'dense-analysis/ale'
" 状态栏美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 快速注释插件，支持各种语言
Plug 'tpope/vim-commentary'
" 快速 替换/添加/删除 单词两边
Plug 'tpope/vim-surround'
" 括号等都成对输入
Plug 'jiangmiao/auto-pairs'
" 模糊匹配查找插件
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" tagbar插件可以把源代码文件生成一个大纲
Plug 'majutsushi/tagbar'
" 开屏页美化插件
Plug 'mhinz/vim-startify'
" 目录树
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'ryanoasis/vim-devicons'
Plug 'kristijanhusak/defx-icons'
" code auto-format
Plug 'sbdchd/neoformat'
"Code jump
Plug 'davidhalter/jedi-vim'
" Code checker
Plug 'neomake/neomake'
" 代码折叠
Plug 'tmhedberg/SimpylFold'
" 标记你复制区域
Plug 'machakann/vim-highlightedyank'
" 多光标编辑插件
Plug 'terryma/vim-multiple-cursors'
call plug#end()

" 定义Leader
let mapleader = "\<space>"
" 主题配置
colorscheme gruvbox
set background=light
" 代码补全插件
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
" vim-go 配置相关 gd 跳转到代码定义 < C-i > < C-o > 后退/前进，保存代码就会自动格式化
" vim-go
let g:go_fmt_command = 'goimports'
let g:go_autodetect_gopath = 1
" let g:go_bin_path = '$GOBIN'

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

" 语法检查
" ale-setting {{{
let g:ale_set_highlights = 1
let g:ale_set_quickfix = 1
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
let g:ale_lint_on_enter = 1
let g:go_fmt_experimental = 1

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
" nmap <Leader>l :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
let g:ale_linters = {
    \ 'go': ['golint', 'go vet', 'go fmt'],
    \ 'python': ['flake8', 'pylint'],
    \ 'rust': ['cargo'],
    \ }
" 模糊匹配查找
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }
" 用 leader+ag 搜索当前 cursor 下单词 see: https://github.com/junegunn/fzf.vim/issues/50
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
" tagbar
nnoremap <leader>t :TagbarToggle<cr>
" 目录树
call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

autocmd FileType defx call s:defx_mappings()

function! s:defx_mappings() abort
  nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()                    " 打开或者关闭文件夹，文件
  nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')     " 显示隐藏文件
  nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction

" 打开目录树
nmap <silent> <Leader>nt :Defx <cr>

" 共享clip
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
" copy (write) highlighted text to .vimbuffer
vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
" paste from buffer
map <C-v> :r ~/.vimbuffer<CR>

" 代码自动格式化
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" 代码跳转
" <leader>d: go to definition
" K: check documentation of class or method
" <leader>n: show the usage of a name in current file
" <leader>r: rename a name
"
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" Code checker
let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)
" 代码折叠
" zo： Open fold in current cursor position
" zO： Open fold and sub-fold in current cursor position recursively
" zc： Close the fold in current cursor position
" zC： Close the fold and sub-fold in current cursor position recursively
set foldmethod=indent
set foldlevel=99
""设置快捷键为空格
noremap <space> za
"显示折叠代码的文档字符串
let g:SimpylFold_docstring_preview=1

" 标记你复制区域
hi HighlightedyankRegion cterm=reverse gui=reverse
" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000

" 多光标编辑插件
" < ctrl-n > < ctrl-x > press c
