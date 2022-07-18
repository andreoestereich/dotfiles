" run compiler in current file
map <leader>c :w <cr> :!compiler <c-r>%<CR>

" autowrite
map <leader>s :w <cr>

" Toogle paste mode
nmap <leader>p :set invpaste<CR>

" dictionary search
nmap <leader>d :!sdcv <C-r><C-w><Enter>

" tags
map <leader>t :TagbarToggle<CR>

" files
map <leader>f <CMD>NnnExplorer<CR>

imap <C-k> <CMD>lua vim.lsp.buf.signature_help()<cr>
nnoremap <C-f> <cmd>lua vim.diagnostic.setqflist()<CR>

  "  Mappings.
  "  See `:help vim.lsp.*` for documentation on any of the below functions
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nmap     K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
nmap     <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <leader>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <leader>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <leader>D <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
