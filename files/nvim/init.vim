set nocompatible
set autoindent
set ignorecase
set tabstop=4
set number
set mouse=a
set clipboard=unnamedplus

" Quit
noremap <C-q> <c-o>:q<CR>
noremap <C-d> <c-o>:qa<CR>

" Save
nnoremap <silent> <C-s> :write<CR>i
inoremap <silent> <C-s> <c-o>:write<CR>

" Comment
inoremap <C-/>    <Esc> gc

" Clipboard
inoremap <C-c> <C-o> yy<CR>
inoremap <C-x> <C-o> dd<CR>
inoremap <C-v> <C-o> p<CR>

" Move Line
nnoremap <silent> <C-Up> :m-2<CR>
nnoremap <silent> <C-Down> :m+1<CR>

" Undo / Redo
inoremap <c-y> <ESC>:redo<CR>
nnoremap <c-z> :u<CR>
inoremap <c-z> <c-o>:u<CR>

" Navigation
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Indent
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-sensible'
Plugin 'preservim/nerdtree' |
            \ Plugin 'Xuyuanp/nerdtree-git-plugin' |
			\ Plugin 'ryanoasis/vim-devicons'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'navarasu/onedark.nvim'
call vundle#end()


" Theme
let g:onedark_config = { 
\	'transparent': v:true
\ }
colorscheme onedark


" Nerdtree
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
