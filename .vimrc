set nocompatible        " first thing to do is to turn this option of.
                        "If on, all vim  enhancement and improvment are
                        "turned off and vim is set to be compatible with vi
filetype off
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"
call vundle#begin()
"
"    layout plugins
"
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'joshdick/onedark.vim'                """ Atom style color scheme
Plugin 'itchyny/lightline.vim'
Plugin 'petrushka/vim-opencl'
"
"    productivity plugins
"
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'                   """ best thing similar to a minimap in vim
"Plugin 'OmniCppComplete'
Plugin 'scrooloose/syntastic'
Plugin 'doxygen/doxygen'
"
" Autocomplete
"
"Plugin 'neoclide/coc.nvim', {'branch': 'release'}
""
call vundle#end()
"
filetype plugin indent on       " load specific filetype detection, plugin and indent  => so later give right syntax, etc...`
let g:ft_ignore_pat = '\.\(Z\|gz\|bz2\|zip\|tgz\)$'     " ignore inspection of certain file type
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.a,*.so,*.pyc,*.swp,.git/,    "specify filename patterns that should be ignored when searching for files,
                                                                            "for example when using the find command
syntax on
"
" tab Configuration
"
set tabstop=8
set shiftwidth=4
set softtabstop=0
set expandtab
set smartindent
set smarttab
"
" folds Configuration
"
set foldenable
set foldmethod=indent
set foldlevelstart=0
set foldnestmax=10
set foldlevel=0
"
" UI Configuration
"
"set cursorline          " highlight current line
set number              " show line numbers
set relativenumber      " Set relative number depending on the cursor position
                        " In case where number is not set, the editor will
                        " show just the relative number of line, otherwise it
                        " will use a hybrid where the cursor shows the global
                        " number
set showcmd             " show command in bottom bar
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set ruler               " Show line, column number, and relative position within a file in the status line
set fileencoding=utf-8
set fileformat=unix
set fileformats=unix
setlocal ff=unix
set statusline+=%#warningmsg#
set statusline+=%*
set laststatus=2        " show the status line
set noshowmode          " disable the show mode because it is appearing in the statusline defined above
set shortmess=atToO
set backspace=indent,eol,start
"
" Basic autocomplete Configuration
"
"set omnifunc=syntaxcomplete#Complete
function SetCppOmnifunc()
     "OmniCppComplete
     set tags+=~/.vim/tags/cpp
     set omnifunc=omni#cpp#complete#Main
     let OmniCpp_NamespaceSearch = 1
     let OmniCpp_GlobalScopeSearch = 1
     let OmniCpp_ShowAccess = 1
     let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
     let OmniCpp_MayCompleteDot = 1 " autocomplete after .
     let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
     let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
     let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
     " automatically open and close the popup menu / preview window
     au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
     set completeopt=menuone,menu,longest,preview
endfunction
"
function SetPyOmnifunc()
     "OmniCppComplete
     "set tags+=~/.vim/tags/cpp
     "set omnifunc=omni#cpp#complete#Main
     "let OmniCpp_NamespaceSearch = 1
     "let OmniCpp_GlobalScopeSearch = 1
     "let OmniCpp_ShowAccess = 1
     "let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
     "let OmniCpp_MayCompleteDot = 1 " autocomplete after .
     "let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
     "let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
     set omnifunc=pythoncomplete#Complete
     set completeopt=menuone,menu,longest,preview
     "echo expand('<cword>')
     "return command <C><C-o>
     "if(expand('<cword>')=='.')
         "return <C-x><C-o>
     " automatically open and close the popup menu / preview window
     au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
endfunction
"

" status line
"
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
"
" colorscheme config
"
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE "for a transparent background with st terminal
set t_co=256
set t_ut=
"
" window spliting and navigating preference
"
set splitright
set splitbelow
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
"
"
" Mouse Configuration
"
set mouse=a
"
" Search Configuration in a file
"
" set ignorecase is set just for fortran files
set incsearch   " search as characters are entered
set hlsearch    " highlight matches
set smartcase   " uppercase causes case-sensitive search
set wrapscan    " searches wrap back to the top of file
"
" netrw Configuration
"
"let g:loaded_netrw=1
let g:netrw_preview=1
let g:netrw_browse_split=3
let g:netrw_alto=0
    "g:netrw_preview g:netrw_alto result
    "         0             0     |:aboveleft|
    "         0             1     |:belowright|
    "         1             0     |:topleft|
    "         1             1     |:botright|
let g:netrw_banner=0
let g:netrw_liststyle = 3
let g:netrw_winsize   = 20
let g:netrw_bufsettings ='rnu'
let g:netrw_list_hide= '^\..*,.git/$'
"let g:netrw_list_hide=  netrw_gitignore#Hide().'.*\.swp$''.git$'
"
" fuzzy file search
"
set path+=**,../src,../include,src/,include/
"
" fuzzy file search
"
set tags+=**,~/.vim/tags/
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4
"
" autocomplete
"
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview
let g:ycm_server_python_interpreter='/usr/bin/python3.7'
"
"
" mapping
"
"
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()
inoremap '      ''<Left>
inoremap '<CR>  '<CR>'<Esc>O
inoremap ''     '
inoremap ''     ''
inoremap "      ""<Left>
inoremap "<CR>  "<CR>"<Esc>O
inoremap ""     {
inoremap ""     ""
"
" easier mapping for special register copy/paste
"
nnoremap <leader>y "+Y
nnoremap <leader>p "+P
"
" Ctags
"
nnoremap <F2> :!ctags -R .<CR><CR>
"
" Tagbar configuration and mapping
"
let g:tagbar_compact=1          " remove help message
let g:tagbar_width=30           " in characters
let g:tagbar_autofocus=1        " cursor jump into tagbar window when open
nmap <F8> :TagbarToggle<CR>
"
" language snippets
"
"       C++
nnoremap `cc   :-1read !sed -n -e '4,29p'  ~/.vim/snippets/cpp.snippets<CR>1kzo1jzo4jf(a
nnoremap `cnm  :-1read !sed -n -e '31,33p' ~/.vim/snippets/cpp.snippets<CR>1ka
nnoremap `cm   :-1read !sed -n -e '35,39p' ~/.vim/snippets/cpp.snippets<CR>2ka
"
"       FORTRAN
nnoremap `fm   :-1read !sed -n -e '4,19p'  ~/.vim/snippets/fortran.snippets<CR>4kfmdw
nnoremap `ft   :-1read !sed -n -e '21,26p' ~/.vim/snippets/fortran.snippets<CR>5kfo
nnoremap `fp   :-1read !sed -n -e '28,37p' ~/.vim/snippets/fortran.snippets<CR>2kf(i
nnoremap `fs   :-1read !sed -n -e '39,48p' ~/.vim/snippets/fortran.snippets<CR>2kf(i
nnoremap `fpm  :-1read !sed -n -e '50,54p' ~/.vim/snippets/fortran.snippets<CR>1ka
"
"       PYTHON
nnoremap `pyc  :-1read !sed -n -e '3,20p'  ~/.vim/snippets/python.snippets<CR>1kf(a
nnoremap `pyf  :-1read !sed -n -e '22,26p' ~/.vim/snippets/python.snippets<CR>1kf(a
nnoremap `pym  :-1read !sed -n -e '28,30p' ~/.vim/snippets/python.snippets<CR>1ka
"
"       spell check enable only for tex file
"
function SetupForTex()
    setlocal updatetime=1
    set makeprg=pdflatex\ -synctex=1\ -interaction=nonstopmode\ %\ &&\ zathura\ %:r.pdf\ &
    "set makeprg=pdflatex\ -synctex=1\ -interaction=nonstopmode\ %\ &&\ zathura\ %:r.pdf\ line('.')\  col('.')\ &
    set spell spelllang=en_gb " en_us  " press z= to get suggestion
    set spellfile="/usr/share/hunspell/en_GB.dic" " move to word and press zg to add word to dic permanently, and use zG to add it until u close vim/ in a way to ignore the miss spelling
endfunction
"
"       markdown function setup
"
function SetupFor_md()
    let g:maplocalleader=";"
    setlocal updatetime=1
    setlocal textwidth=100
    set makeprg=pandoc\ -s\ %\ --pdf-engine=xelatex\ -o\ %:r.pdf\ &\ disown
    set spell spelllang=en_gb " en_us  " press z= to get suggestion
    set spellfile="/usr/share/hunspell/en_GB.dic" " move to word and press zg to add word to dic permanently, and use zG to add it until u close vim/ in a way to ignore the miss spelling
    nmap <LocalLeader>m :w <bar> make<cr><cr>
endfunction

" Configuration depending on filetype
"
augroup configgroup
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e " Remove trailing white space
    autocmd FileType fortran setlocal ignorecase infercase
    autocmd FileType Makefile setlocal noexpandtab
    autocmd Filetype tex call SetupForTex()
    autocmd Filetype markdown  call SetupFor_md()
    "autocmd Filetype markdown  let maplocalleader=','; call SetupFor_md()
    autocmd FileType c,cpp,java set mps+==:;
    autocmd FileType html,cpp set mps+=<:>
    autocmd FileType pdf  nmap p :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
    au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
    au bufnewfile,bufread,bufenter,FileType python let Omnipython_MayCompleteDot=1
    "autocmd FileType *
augroup end
" opens search results in a window w/ links and highlight the matches
"set grepprg=rg\ -n
set grepprg=grep\ --color=always\ -n\ $*\
"command! -nargs=+ Grep execute 'silent rg! . -e <args>' | copen | execute 'silent /<args>'
"command! -nargs=+ Grep execute 'silent grep! . -e <args>' | copen | execute 'silent /<args>'
"command! -nargs=+ Grep execute 'silent grep! -I -r -n --exclude-dir=git --exclude *.{json,pyc} . -e <args>' | copen | execute 'silent /<args>'
" shift-control-* Greps for the word under the cursor
:nmap <leader>g :grep <c-r>=expand("<cword>")<cr><cr>

"let maplocalleader="\;"
let g:maplocalleader=";"
