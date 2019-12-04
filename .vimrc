set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader =" "

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'Valloric/YouCompleteMe'
"
" This provides the semantic check without the autocomplete anoying stuff
Plugin 'vim-syntastic/syntastic'

Plugin 'PotatoesMaster/i3-vim-syntax'


let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_python_checkers = ['python']


Plugin 'tpope/vim-fugitive'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Plugin 'dylanaraps/wal.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
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

" set compilation script to run
map <leader>c :!compiler <c-r>%<CR>

" autowrite
map <leader>s :w <cr>

" Toogle paste mode
set pastetoggle=F7

" dictionary search
map <leader>d :!sdcv <C-r><C-w><Enter>

set tabstop=4 shiftwidth=4 expandtab
set autoindent

" correcting the encoding
set encoding=utf-8 

" making pretty
syntax enable
set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256
"let &t_SI = "\<Esc>[6 q"
"let &t_SR = "\<Esc>[4 q"
"let &t_EI = "\<Esc>[2 q"

set relativenumber 
set number 
set ruler
set numberwidth=5
set nocompatible

 set cursorline
hi CursorLine ctermbg=darkgrey cterm=none

"show the incomplete commands
set showcmd

" Lets folder shit
set foldmethod=syntax

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow
	set splitright

" Shortcutting split navigation, saving a keypress:
	" map <C-h> <C-w>h
	" map <C-j> <C-w>j
	" map <C-k> <C-w>k
	" map <C-l> <C-w>l

" Making groff a fileType
    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man so ~/.vim/andrelo/groff.vim

" my things
autocmd FileType tex so ~/.vim/andrelo/latex.vim
autocmd FileType markdown so ~/.vim/andrelo/markdown.vim
autocmd FileType html so ~/.vim/andrelo/html.vim
autocmd FileType mail so ~/.vim/andrelo/mail.vim
autocmd FileType c so ~/.vim/andrelo/c.vim

" Navigating with guides
	inoremap <C-j> <Esc><Esc>/<++><cr>"_c4l
	vnoremap <C-j> <Esc><Esc>/<++><cr>"_c4l
	map <C-j> <Esc><Esc>/<++><cr>"_c4l
	inoremap çg <++>

" hi CursorLine cterm=NONE ctermbg=4
hi SpellBad cterm=underline ctermbg=NONE

" fuzzy file search
" Search in subfolders and provides tab completion to file-realated tasks
set path+=**

" Displays all matching files when we use tab to complete
set wildmenu

" highlight search results
set hlsearch

" The number of screen lines to keep above and below the cursor.
set scrolloff=1
set title

" airline tweaks
let g:airline_powerline_fonts = 1
set laststatus=2
" let g:airline_theme='powerlineish'
" the separator used on the left side
" let g:airline_left_sep=''
" the separator used on the right side
" let g:airline_right_sep=''

" youcompleteme tweaks
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" let g:ycm_autoclose_preview_window_after_insertion = 1


