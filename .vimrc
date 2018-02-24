set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ErichDonGubler/vim-sublime-monokai'  """ sublime style color scheme
Plugin 'joshdick/onedark.vim'                """ Atom style color scheme
Plugin 'sheerun/vim-polyglot'                """ syntax highlight enhancement
Plugin 'universal-ctags/ctags'          """ Required for tagbar
Plugin 'xolox/vim-misc'                 """ Required for easytags
Plugin 'xolox/vim-easytags'             """ creating tags to jump into definition
Plugin 'majutsushi/tagbar'              """ best thing similar to a minimap in vim
"
"       Minimap plugin not working great for the moment
"
Plugin 'koron/minimap-vim'
"""""" lugin 'severin-lemaignan/vim-minimap'  show just dots as minimap , not worth
"it 
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" noPlugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"filetype plugin indent on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
"       netRW: Open files in a split window
"
let g:netrw_browse_split=1
"syntax on
set foldmethod=indent
set foldlevelstart=0
set foldnestmax=10
set foldenable
set foldlevel=0 

set tabstop=8
set shiftwidth=4 
set softtabstop=0
set expandtab
set smarttab

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_fortran_include_dirs=['build/mod','mod']
let g:syntastic_cpp_include_dirs=['include','src/include']

let g:nerdtree_tabs_open_on_console_startup=1
" 
" NERDCommenter Setup
" 
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code
" indentation
" let g:NERDDefaultAlign = 'left'
"
" " Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a
" region)
" let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1
"
"
"
"
"let g:easytags_file = '~/.vim/tags'
set tags=../build/tags; """ ./tags
let g:easytags_dynamic_files = 2
"
"
"       Tagbar mapping
"
nmap <F8> :TagbarToggle<CR>
"let g:tagbar_ctags_bin=/usr/bin/ctags
"
"
"       Ctrlp Configuration
"
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'ra'    " set it to 0 to change the working directory during a Vim session and make CtrlP respect that change.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"
"       Excluding directories
"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.obj,*.pyc    " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"
"       UI Config
"
set number              " show line numbers
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set ruler               " Show line, column number, and relative position within a file in the status line 

"
"       Searching Config
"
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
"
"       Mouse Setting for selection
"
set mouse=a             " enable visual selection press shift in order disable and copy from outside vim
set mousemodel=popup
"set paste
"
"       Moving line arround settings
"
"nnoremap <S-Up> :m-2<CR>
"nnoremap <S-Down> :m+<CR>
"inoremap <S-Up> <Esc>:m-2<CR>
"inoremap <S-Down> <Esc>:m+<CR>
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv
"
"
"
"       Color scheme
"
"
"       Sublime Style
"
"let g:monokai_term_italic=1
"let g:monokai_gui_italic=1
syntax on
colorscheme monokai     
if has('nvim') || has('termguicolors')
      set termguicolors         "set termguicolors "If you are using a terminal which support truecolor like iterm2, enable the gui color
  else      
      set t_co=256            """ also for sublime
  endif
let g:monokai_term_italic=1
let g:monokai_gui_italic=1
"
"       end Sublime Style
"
"
"       Atom Style
"
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
colorscheme onedark
"
"       End Atom Style
"
let g:ackprg = 'ag --nogroup --nocolor --column' " silver searcher
"
"       just to adjust tabs for Makefile
"
augroup configgroup
    autocmd!
    autocmd FileType Makefile setlocal noexpandtab
augroup end