" NeoBundle settings
"
if has('vim_starting')
 set nocompatible

 " Required:
 set runtimepath+=/home/josue/.vim/bundle/neobundle.vim/
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
set laststatus=2
set encoding=utf-8
set fileformat=unix
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

if has("gui_running")

else
  set background=dark
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

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType c nmap <leader>c :!g++ % -o %:r<cr>
au FileType c nmap <leader>r :!./%:r<cr>
"
" end keymaps
