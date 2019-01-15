" latex snipets

" set spellcheck
setlocal spell

" autoopeen pdf
map <leader>p :!mupdf %:r.pdf & <cr><cr>

" open tabs as spaces
" Creating environments
inoremap çeq \begin{equation}<Enter>\label{eq:<++>}<Enter>\end{equation}<Enter><++><Esc>2kO
inoremap çfg \begin{figure}[h]<Enter>\centering<Enter>\includegraphics[width=0.5\paperwidth]{}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{figure}<Enter><Enter><++><Esc>5kf{a

" creating tags
inoremap çrf \ref{}<++><Esc>F{a
inoremap çni \noindent<space>
inoremap çla \label{}<++><Esc>F{a

" fast math
inoremap çfa \forall<space>
inoremap __ _{}<++><Esc>F{a
inoremap ^^ ^{}<++><Esc>F{a
inoremap /= \neq
inoremap <= \leq
inoremap >= \geq
inoremap ~/ \frac{}{<++>}<++><Esc>2F{a
inoremap ~+ \sum

" enclosing
inoremap [[ \left[ \right]<++><Esc>F[a
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
inoremap  ~ep \epsilon
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
