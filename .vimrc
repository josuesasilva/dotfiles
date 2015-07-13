" NeoBundle settings
"
if has('vim_starting')
 set nocompatible

 " Required:
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/vimfiles/bundle/'))

" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'mattn/flappyvird-vim'
NeoBundle 'itchyny/calendar.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'git://github.com/jsx/jsx.vim.git'
NeoBundle 'fatih/vim-go'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-vividchalk'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"
" end NeoBundle settings

" basic settings
"
syntax on
set backupdir=/tmp
set noswapfile
set nowrap ts=2 sw=2 ai et
set encoding=utf-8
set fileformat=unix
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

if has("gui_running")
  colorscheme vividchalk
  set background=dark
  set nu
  set guifont=Monaco:h12
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
else
  set background=dark
  set laststatus=2
endif
"
" end basic settings

" keymaps
"
map <leader>ev :e $HOME\_vimrc<cr>
map <leader>cal :Calendar<cr>
map <leader>cb :bd<cr>
map <leader>nb :bnext<cr>
map <leader>hb :hide<cr>
map <leader>vs :vsplit<cr>
map <leader>hs :split<cr>
map <leader>t :NERDTreeToggle<cr>

noremap <F3> :Autoformat<CR><CR>

map <F1> <Esc>
imap <F1> <Esc>
cmap W w

map <leader>ev :e ~/.vimrc<cr>

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType c nmap <leader>c :!g++ % -o %:r<cr>
au FileType c nmap <leader>r :!./%:r<cr>
"
" end keymaps
