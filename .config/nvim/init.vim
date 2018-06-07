" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-syntastic/syntastic'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
  Plug 'flazz/vim-colorschemes'
  Plug 'valloric/youcompleteme'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdcommenter'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'majutsushi/tagbar'
  Plug 'ryanoasis/vim-devicons'
  Plug 'dylanaraps/wal.vim'
call plug#end()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:ycm_show_diagnostics_ui = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set background=dark
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:chromatica#libclang_path='/usr/local/opt/llvm/lib'
let g:chromatica#enable_at_startup=1
let g:chromatica#responsive_mode=1
autocmd VimEnter * wincmd p
let NVIM_TUI_ENABLE_TRUE_COLOR=1

colorscheme wal
" aides visuelles
map <f8> :TagbarToggle<CR>
set number
set ruler
set showcmd

" recherche incrémentale
set hlsearch
set incsearch
if has('nvim')
  set inccommand=nosplit
endif

" auto-indentation à 2 espaces
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" options honteuses (pour les faibles)
"set clipboard=unnamedplus
"set mouse=a

" un peu de cohérence dans un monde de brutes
nmap Y y$
nmap U <C-r>

filetype plugin on
let g:ycm_confirm_extra_conf=0
