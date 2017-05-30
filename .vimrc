" Remove ALL auto-commands.  This avoids having the autocommands twice when
" the vimrc file is sourced again.
autocmd!

" In Makefiles, tabs matter
autocmd FileType automake setlocal noexpandtab

" Set filetype to cpp for vpp files.
autocmd BufNewFile,BufRead *.vpp set filetype=cpp

colorscheme molokai   " The badwolf color scheme!
syntax enable   " enable syntax processing
set backspace=2 " enable backspaces over autoindents and stuff. fixes
                " problems on MacOS
set term=screen-256color
set expandtab   " expand tab to spaces
set tabstop=3   " number of visual spaces per TAB
set softtabstop=3   " number of spaces in tab when editing
set shiftwidth=3   " # of columns a tab spans
set number   " show line numbers
set ruler    " show the line number, column number at bottom right
set cursorline   " highlight current line
set colorcolumn=85   " highlight the column limit
set confirm   " prompt before quitting
filetype indent on   " load filetype-specific indent files
filetype plugin on
set wildmenu   " visual autocomplete for command menu
set lazyredraw   " redraw only when we need to.
set showmatch   " highlight matching [{()}]
set incsearch   " search as characters are entered
set hlsearch   " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldenable   " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10   " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indentation
" move vertically by visual line
nnoremap <Up> gk
nnoremap <Down> gj
" highlight last inserted text
nnoremap gV `[v`]
set nojoinspaces  " Disable wide sentence spacing when joining 2 or more lines.

set runtimepath^=~/.vim/bundle/ctrlp.vim   "ctrlp plugin
set runtimepath^=~/.vim/bundle/nerdtree   "NERDtree plugin
set runtimepath^=~/.vim/bundle/nerdcommenter   "NERD Commenter plugin

" Toggle NERDtree map:
nnoremap <F5> :NERDTreeToggle<CR>

" Maps to switch between multiple split windows:
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Easier scrolling maps:
nnoremap <C-Up> <C-y>
nnoremap <C-Down> <C-e>
inoremap <C-Up> <C-x><C-y>
inoremap <C-Down> <C-x><C-e>

" Maps for easier tab operations:
nnoremap <silent> <F7> :tabp<CR>
nnoremap <silent> <F8> :tabn<CR>

" start with a tags file in the current directory and go up to the root directory.
set tags=./tags;/

" Key bindings for enabling and disabling AutoComplPop
nnoremap <C-l> :AcpUnlock<CR>
nnoremap <C-k> :AcpLock<CR>
inoremap <C-l> <Esc>:AcpUnlock<CR>i<A-Right>
inoremap <C-k> <Esc>:AcpLock<CR>i<A-Right>

" The first tab completes as much as it can, second tab displays a list of
" options, and the third tab will present a list that allows you to scroll
" through and select filenames beginning with that prefix.
set wildmode=longest,list,full
set wildmenu

""" Loading the project specific vimrc. This should always be the last step.

if exists("*LoadProjectVimrc")
else

   function! LoadProjectVimrc()
      let curdir = getcwd()
      while 1
         if filereadable(".vimrc")
            if getcwd()."/.vimrc" == $MYVIMRC
               break
            endif
            source .vimrc
            break
         endif

         if getcwd() == "/"
            break
         endif

         cd ..
      endwhile
      exe "cd ".fnameescape(curdir)
   endfunction

   call LoadProjectVimrc()

endif
