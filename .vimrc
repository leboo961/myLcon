set nocompatible        " first thing to do is to turn this option of.
                        "If on, all vim  enhancement and improvment are
                        "
                        "turned off and vim is set to be compatible with vi
filetype off
"
call plug#begin()
"    layout plugins
Plug 'jistr/vim-nerdtree-tabs'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'petrushka/vim-opencl' , {'for' : 'opencl'}
"
"    productivity plugins
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'                   """ best thing similar to a minimap in vim
Plug 'scrooloose/syntastic'
Plug 'doxygen/doxygen'
"
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
Plug 'github/copilot.vim'
"
call plug#end()
"
filetype plugin indent on       " load specific filetype detection, plugin and indent  => so later give right syntax, etc...`
let g:ft_ignore_pat = '\.\(Z\|gz\|bz2\|zip\|tgz\)$'     " ignore inspection of certain file type
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.a,*.so,*.pyc,*.swp,.git/,    "specify filename patterns that should be ignored when searching for files,
                                                                            "for example when using the find command
syntax on
let mapleader=" "
let g:maplocalleader=";"
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
set backspace=indent,eol,start
set completeopt=menuone,noinsert
set shortmess=atToOc

" colorscheme config
"
colorscheme gruvbox
""hi Normal guibg=NONE ctermbg=NONE "for a transparent background with st terminal
set bg=dark
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
tnoremap <C-l> <C-w>l
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
"
" Mouse Configuration
"
set mouse=a
"
" Search Configuration in a file
"
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
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'readonly', 'gitbranch', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'GitBranch'
      \ },
      \ }
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
" mapping
"
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []      []

inoremap '      ''<Left>
inoremap '<CR>  '<CR>'<Esc>O
inoremap ''     '
inoremap ''     ''

inoremap "      ""<Left>
inoremap "<CR>  "<CR>"<Esc>O
inoremap ""     "
inoremap ""     ""
"
" terminal mode mapping
"
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>t :call ToggleTerminal()<CR>
""
"
" easier mapping for special register copy/paste
":
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



if executable('rg')
    set grepprg=rg\ --color=auto\ --no-heading\ --smart-case
else
    set grepprg=grep\ --color=always\ -nH
endif
set grepformat=%f:%l:%c:%m
command! -nargs=+ Grep execute 'silent grep! . -e <args>' | copen | redraw
"nnoremap <leader>g :grep <c-r>=expand("<cword>")<cr><cr><cr>
nnoremap <leader>g :grep! "\b<C-R><C-W>\b" `find . -type f -readable`<CR>:copen<CR>


"
" Function to customize some functionnalities
"
function! GitBranch()
	let l:branch = system('git rev-parse --abbrev-ref HEAD 2>/dev/null')
	return strlen(l:branch) ? ' ' . substitute(l:branch, '\n', '', '') : ''
endfunction

"       spell check enable only for tex and markdown file
"
function! SetupForTex()
    setlocal updatetime=1
    set makeprg=pdflatex\ -synctex=1\ -interaction=nonstopmode\ %\ &&\ zathura\ %:r.pdf\ &
    "set makeprg=pdflatex\ -synctex=1\ -interaction=nonstopmode\ %\ &&\ zathura\ %:r.pdf\ line('.')\  col('.')\ &
    set spell spelllang=en_gb " en_us  " press z= to get suggestion
    set spellfile="/usr/share/hunspell/en_GB.dic" " move to word and press zg to add word to dic permanently, and use zG to add it until u close vim/ in a way to ignore the miss spelling
endfunction
"
"       markdown function setup
"
function! SetupFor_md()
    let g:maplocalleader=";"
    setlocal updatetime=1
    setlocal textwidth=100
    set makeprg=pandoc\ -s\ %\ --pdf-engine=xelatex\ -o\ %:r.pdf\ &\ disown
    set spell spelllang=en_gb " en_us  " press z= to get suggestion
    set spellfile="/usr/share/hunspell/en_GB.dic" " move to word and press zg to add word to dic permanently, and use zG to add it until u close vim/ in a way to ignore the miss spelling
    nmap <LocalLeader>m :w <bar> make<cr><cr>
endfunction
"
"       toggle terminal
"
function! ToggleTerminal()
    let l:termlist = []
    for buf in getbufinfo({'buflisted' :1})
        let l:buftype = getbufvar(buf.bufnr,'&buftype','Error terminal not found')
        if buftype == "terminal"
            let termlist += [buf.bufnr]
        endif
    endfor
    if len(termlist) == 0
        execute "terminal"
    elseif len(termlist) == 1
        if bufwinnr(termlist[0]) == -1
            execute "sb" .get(termlist,0)
        else
            execute "hide"
        endif
    elseif len(termlist) > 1
        "let winid = popup_create("text", #{minwidth: '50', minheight: '20'})
        let winid = popup_create(['text1','text2'], #{
                        \ pos: 'botleft',
                        \ border: [],
                        \ padding: [0,1,0,1],
                        \ close: 'click',
                        \ })
    endif
endfunction

if !exists('g:git_roots_per_buffer')
    let g:git_roots_per_buffer = {}
endif

function! s:UpdatePath()
    if &buftype !=# '' || &readonly | return | endif

    let l:current_buf_id = bufnr('%')
    let l:git_root = ''
    let l:old_cwd = getcwd()
    execute 'cd' fnameescape(expand('%:p:h'))
    let l:git_toplevel_output = trim(system('git rev-parse --show-toplevel 2>/dev/null'))
    execute 'cd' fnameescape(l:old_cwd)

    if !empty(l:git_toplevel_output) && isdirectory(l:git_toplevel_output)
        let l:git_root = l:git_toplevel_output
    endif

    if !empty(l:git_root)
        let l:path_to_add = l:git_root . '/**'
        if index(split(&path, ','), l:path_to_add) < 0
            let &path = l:path_to_add . ',' . &path
        endif
        let g:git_roots_per_buffer[string(l:current_buf_id)] = l:path_to_add
    elseif has_key(g:git_roots_per_buffer, string(l:current_buf_id))
        call remove(g:git_roots_per_buffer, string(l:current_buf_id))
    endif
endfunction

function! s:CleanupPathOnBufQuit()
    let l:quitting_buf_id = bufnr('%')
    let l:path_to_remove = ''

    if has_key(g:git_roots_per_buffer, string(l:quitting_buf_id))
        let l:path_to_remove = g:git_roots_per_buffer[string(l:quitting_buf_id)]
        call remove(g:git_roots_per_buffer, string(l:quitting_buf_id))

        let l:path_still_in_use = 0
        for [buf_id, path_val] in items(g:git_roots_per_buffer)
            if path_val ==# l:path_to_remove | let l:path_still_in_use = 1 | break | endif
        endfor

        if !l:path_still_in_use
            let l:current_path_list = split(&path, ',')
            let &path = join(filter(l:current_path_list, 'v:val !=# l:path_to_remove'), ',')
        endif
    endif
endfunction

"
" Configuration depending on filetype
"
augroup configgroup
    autocmd!
    autocmd bufwritepost .vimrc source %
    autocmd BufWritePre * %s/\s\+$//e " Remove trailing white space
    autocmd FileType fortran setlocal ignorecase infercase
    autocmd FileType Makefile setlocal noexpandtab
    autocmd Filetype tex call SetupForTex()
    autocmd Filetype markdown  call SetupFor_md()
    autocmd FileType c,cpp,java set mps+==:;
    autocmd FileType html,cpp set mps+=<:>
    autocmd FileType pdf  nmap p :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
    autocmd QuickFixCmdPre grep silent! copen
augroup end

augroup pathBasicCompletion
    autocmd InsertCharPre * call feedkeys("\<C-x>\<C-f>", 'n')
    autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
augroup end

augroup pathManagement
    autocmd!
    autocmd BufEnter,BufReadPost * call s:UpdatePath()
    autocmd BufUnload * call s:CleanupPathOnBufQuit()
augroup end
" opens search results in a window w/ links and highlight the matches
"command! -nargs=+ Grep execute 'silent rg! . -e <args>' | copen | execute 'silent /<args>'
"command! -nargs=+ Grep execute 'silent grep! . -e <args>' | copen | execute 'silent /<args>'
"command! -nargs=+ Grep execute 'silent grep! -I -r -n --exclude-dir=git --exclude *.{json,pyc} . -e <args>' | copen | execute 'silent /<args>'
" shift-control-* Greps for the word under the cursor

