" Groff functionality
function! NewGrDoc()
    normal O.TL
    normal o<++>
    normal o.AU
    normal o<++>
    normal o.pp
    normal o<++>
    normal gg
endfunction

" This is the configs for groff files
set filetype=groff
setlocal spell
set tw=60

map <leader>p :!mupdf %:r.pdf & <cr><cr>

