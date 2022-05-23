set nocompatible              " be iMproved, required
let mapleader =" "

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'kovetskiy/sxhkd-vim'
Plug 'ap/vim-css-color'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/luukvbaal/nnn.nvim'
Plug 'https://github.com/neovim/nvim-lspconfig'

call plug#end()

lua << EOF
require("nnn").setup()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright',  'tsserver', 'sumneko_lua', 'bashls', 'ccls', 'texlab'}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
  }

end

EOF

so ~/.config/nvim/keymaps.vim

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
set foldmethod=indent

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
autocmd FileType tex so ~/.config/vim/latex.vim
autocmd FileType plaintex so ~/.config/vim/latex.vim
autocmd FileType markdown so ~/.config/vim/markdown.vim
autocmd FileType html so ~/.config/vim/html.vim
autocmd FileType mail so ~/.config/vim/mail.vim
autocmd FileType c so ~/.config/vim/c.vim
autocmd FileType python so ~/.config/vim/python.vim

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

" copy and cut to clipboard
set clipboard+=unnamedplus

" Displays all matching files when we use tab to complete
set wildmenu

" highlight search results
set hlsearch

" The number of screen lines to keep above and below the cursor.
set scrolloff=5

" airline tweaks
let g:airline_powerline_fonts = 1
set laststatus=2
" let g:airline_theme='powerlineish'
" the separator used on the left side
" let g:airline_left_sep=''
" the separator used on the right side
" let g:airline_right_sep=''

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e
