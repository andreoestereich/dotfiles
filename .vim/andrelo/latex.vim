" latex snipets

function! NextEnd()
    let curline = line(".") + 1
    let begins = 1
    while begins > 0
        if getline(curline) =~ '.*\\begin.*$'
            let begins += 1
        endif
        if getline(curline) =~ '.*\\end.*$'
            let begins -= 1
        endif

        let curline += 1
    endwhile

    return curline - 1
endfunction

function! PrevBegin()
    let curline = line(".")
    let ends = 1
    while ends > 0
        if getline(curline) =~ '.*\\begin.*$'
            let ends -= 1
        endif
        if getline(curline) =~ '.*\\end.*$'
            let ends += 1
        endif

        let curline -= 1
    endwhile

    return curline + 1
endfunction

function! SelectInEnvironment(surround)
    let start = PrevBegin()
    let end = NextEnd()

    keepjumps call cursor(start, 0)
    if !a:surround
        normal! j
    end
    normal! V
    keepjumps call cursor(end, 0)
    if !a:surround
        normal! k
    end
endfunction

" Operate on environments (that have begin and ends on separate lines)
xnoremap <silent> ie <ESC>:call SelectInEnvironment(0)<CR>
xnoremap <silent> ae <ESC>:call SelectInEnvironment(1)<CR>

nnoremap  (V) V
onoremap <silent> ie :execute "keepjumps normal (V)ie"<CR>
onoremap <silent> ae :execute "keepjumps normal (V)ae"<CR>

" Operate on math
function! SelectInMath(surround)
    let next = search('\$\|\(\\]\)\|\(\\)\)', 'ncpW')
    let [nextLine, nextCol] = searchpos('\$\|\(\\]\)\|\(\\)\)', 'ncW')
    if next == 1
        let prev = search('\$', 'ncpWb')
        let [prevLine, prevCol] = searchpos('\$', 'ncWb')
    elseif next == 2
        let prev = search('\\[', 'ncpWb')
        let [prevLine, prevCol] = searchpos('\\[', 'ncWb')
    elseif next == 3
        let prev = search('\\(', 'ncpbW')
        let [prevLine, prevCol] = searchpos('\\(', 'ncbW')
    end

    if next == 1
        let delimLen = 1
    else
        let delimLen = 2
    end

    if !a:surround 
        if len(getline(prevLine)) <= prevCol + delimLen
            let prevLine = prevLine + 1
            let prevCol = -delimLen + 1
        end

        if nextCol <= 1
            let nextLine = nextLine - 1
            let nextCol = len(getline(nextLine)) + 1
        end
    end

    if a:surround
        call cursor(prevLine, prevCol)
    else
        call cursor(prevLine, prevCol + delimLen)
    end

    if g:latex_select_math_lines && next == 2
        normal! V
    else
        normal! v
    end
    if a:surround
        call cursor(nextLine, nextCol + delimLen - 1)
    else
        call cursor(nextLine, nextCol - 1)
    end
endfunction

" Use % to jump between begin/end
function! MatchedBlock()
    if getline(line(".")) =~ '.*\\begin.*$'
        normal! j
        call cursor(NextEnd(), 0)
    elseif getline(line(".")) =~ '.*\\end.*$'
        normal! k
        call cursor(PrevBegin(), 0)
    else
        normal! %
    end
endfunction

function! VisualMatchedBlock()
    let start = line(".")
    call MatchedBlock()
    let end = line(".")

    call cursor(start, 0)
    exec "normal!" . visualmode()
    call cursor(end, 0)
endfunction

let g:latex_select_math_lines = 1
vnoremap <buffer> im <ESC>:call SelectInMath(0)<CR>
vnoremap <buffer> am <ESC>:call SelectInMath(1)<CR>
omap <buffer> im :normal vim<CR>
omap <buffer> am :normal vam<CR>

" Operate on LaTeX quotes
vmap <buffer> iq <ESC>?``<CR>llv/''<CR>h
omap <buffer> iq :normal viq<CR>
vmap <buffer> aq <ESC>?``<CR>v/''<CR>l
omap <buffer> aq :normal vaq<CR>

map <buffer> % :call MatchedBlock()<CR>
vmap <buffer> % :call VisualMatchedBlock()<CR>

" section jumping
noremap <buffer> <silent> ]] :<c-u>call TexJump2Section( v:count1, '' )<CR>
noremap <buffer> <silent> [[ :<c-u>call TexJump2Section( v:count1, 'b' )<CR>
function! TexJump2Section( cnt, dir )
  let i = 0
  let pat = '^\s*\\\(part\|chapter\|\(sub\)*section\)\>\|\%$\|\%^'
   let flags = 'W' . a:dir
   while i < a:cnt && search( pat, flags ) > 0
     let i = i+1
   endwhile
   let @/ = pat
 endfunction

" set spellcheck
setlocal spell
set omnifunc=syntaxcomplete#Complete

" autoopeen pdf
map <leader>p :!zathura %:r.pdf & <Enter><Enter>

set mps+=$:$

" open tabs as spaces
" Creating environments
inoremap çeq \begin{equation}<Enter>\label{<++>}<Enter>\end{equation}<Enter><++><Esc>2kO
inoremap çit \begin{itemize}<Enter>\item <Enter>\end{itemize}<Enter><++><Esc>2kA
inoremap çfg \begin{figure}[h]<Enter>\centering<Enter>\includegraphics[width=0.5\textwidth]{}<Enter>\caption{<++>}<Enter>\label{<++>}<Enter>\end{figure}<Enter><Enter><++><Esc>5kf{a
inoremap çsf \begin{subfigure}[t]{<++>\textwidth}<Enter>\includegraphics[width=\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\end{subfigure}<Enter>\hfill<Enter><++><Esc>5kf<cf>

" creating tags
inoremap çrf \cref{}<++><Esc>F{a
inoremap çct \cite{}<++><Esc>F{a
inoremap çni \noindent<space>
inoremap çch \chapter{}<++><Esc>F{a
inoremap çse \section{}<++><Esc>F{a
inoremap çss \subsection{}<++><Esc>F{a
inoremap çla \label{}<++><Esc>F{a
inoremap çtb \textbf{}<++><Esc>F{a
inoremap çem \emph{}<++><Esc>F{a
inoremap çca \caption{}<++><Esc>F{a
inoremap çqu \quad
inoremap çqq \qquad



inoremap çkk  \langle k \rangle

" fast math
inoremap çfa \forall<space>
inoremap __ _{}<++><Esc>F{a
inoremap ^^ ^{}<++><Esc>F{a
inoremap /= \neq
inoremap <= \leq
inoremap >= \geq
inoremap ç/ \frac{}{<++>}<++><Esc>2F{a
inoremap ~+ \sum
inoremap ~~ \sim

" enclosing
inoremap [[ \left[ \right]<++><Esc>F[a
inoremap {{ \left\{ \right\}<++><Esc>F{a
inoremap (( \left( \right)<++><Esc>F(a
inoremap "" ``''<++><Esc>F`a

" Creating greek letters
inoremap  ~G \Gamma
inoremap  ~D \Delta
inoremap  ~L \Lambda
inoremap  ~F \Phi
inoremap  ~P \Pi
inoremap  ~W \Psi
inoremap  ~S \Sigma
inoremap  ~T \Theta
inoremap  ~U \Upsilon
inoremap  ~X \Xi
inoremap  ~O \Omega

inoremap  ~a \alpha
inoremap  ~b \beta
inoremap  ~g \gamma
inoremap  ~d \delta
inoremap  ~ee \epsilon
inoremap  ~z \zeta
inoremap  ~et \eta
inoremap  ~t \theta
inoremap  ~i \iota
inoremap  ~k \kappa
inoremap  ~l \lambda
inoremap  ~m \mu
inoremap  ~n \nu
inoremap  ~x \xi
inoremap  ~p \pi
inoremap  ~r \rho
inoremap  ~s \sigma
inoremap  ~t \tau
inoremap  ~u \upsilon
inoremap  ~f \phi
inoremap  ~c \chi
inoremap  ~w \psi
inoremap  ~o \omega
inoremap  ~ve \varepsilon
inoremap  ~vk \varkappa
inoremap  ~vf \varphi
inoremap  ~vp \varpi
inoremap  ~vr \varrho
inoremap  ~vs \varsigma
inoremap  ~vt \vartheta

" math symbols
inoremap  ~< \langle
inoremap  ~> \rangle
inoremap  ~8 \infty
inoremap  'l \ell

