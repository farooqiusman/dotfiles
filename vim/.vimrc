set number 
set relativenumber
set wildmenu
syntax on
set ignorecase
set smartcase
set incsearch
set so=20
set tabstop=4
set shiftwidth=4
let mapleader=' '
set noswapfile

nmap <leader>v :source ~/.vimrc<CR>
let fancy_symbols_enabled = 1
set encoding=utf-8
set mouse=a
call plug#begin("~/.vim/plugged")

" Now the actual plugins:
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Code commenter
Plug 'tpope/vim-commentary'
" Search results counter
Plug 'vim-scripts/IndexedSearch'
Plug 'patstockwell/vim-monokai-tasty'
" Airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'ryanoasis/vim-devicons'
Plug 'wadackel/vim-dogrun'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-dispatch'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'dikiaap/minimalist'
Plug 'sainnhe/edge'
Plug 'gosukiwi/vim-atom-dark'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim'
Plug 'tfnico/vim-gradle'
Plug 'vim-scripts/cup.vim'
call plug#end()
set nocompatible

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

" syntax highlight on
syntax on

" better backup, swap and undos storage for vim (nvim has nice ones by
" default)
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" show line numbers
set nu

" remove ugly vertical lines on window division
set fillchars+=vert:\ 

" use 256 colors when possible
if has('gui_running') || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
    " colorscheme vim-monokai-tasty
    " colorscheme dogrun
    " colorscheme gruvbox
    " colorscheme minimalist
    " colorscheme edge
    " colorscheme onehalf
    " colorscheme onedark
    colorscheme dracula
else
    colorscheme delek
endif

set background=dark
if (has("termguicolors"))
    set termguicolors
endif
" save as sudo
ca w!! w !sudo tee "%"

" tab navigation mappings
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3


" Fzf ------------------------------

" file finder mapping
nmap <leader>f :Files<CR>
" tags (symbols) in current file finder mapping
nmap <leader>g :BTag<CR>
" the same<leader> but with the word under the cursor pre filled
nmap <leader>wg :execute ":BTag " . expand('<cword>')<CR>
" tags (symbols) in all files finder mapping
nmap <leader>G :Tags<CR>
" the same<leader> but with the word under the cursor pre filled
nmap <leader>wG :execute ":Tags " . expand('<cword>')<CR>
" general code finder in current file mapping
" nmap <leader>f :BLines<CR>
" the same<leader> but with the word under the cursor pre filled
nmap <leader>wf :execute ":BLines " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap <leader>F :Lines<CR>
" the same<leader> but with the word under the cursor pre filled
nmap <leader>wF :execute ":Lines " . expand('<cword>')<CR> commands finder mapping
" nmap <leader>c :Commands<CR>

" nmap ctrl + n will open a file in current directory as a new tab
nmap <C-n> :tabnew <bar> Files <CR>
" CoC ---------------------------------------
imap <C-j> <Plug>(coc-snippets-expand)

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = ['git']
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227


" vim-dispatch ------------------------------
nmap <silent> <Leader>r :Dispatch! ~/Scripts/compiler.sh "%"<CR>:Copen<CR>
nmap <silent> <Leader>o :Copen<CR>
nmap <silent> <Leader><Leader> :noh<CR>
vmap <silent> <Leader>y "+y
vmap <silent> <Leader>p "+p 
nmap <silent> <Leader>y "+y
nmap <silent> <Leader>p "+p
nmap <silent> <F6> :JCimportAddSmart<CR>
nmap <silent> <F5> :JCimportsAddMissing<CR>

" Save all---------------------------------
map <silent><Esc><Esc> :wa<CR>

" Pair stuff-------------------------------
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" Assembly syntax------------------------------
autocmd BufRead *.asm exe "set ft=masm commentstring=;%s"

autocmd BufRead *.vrapperrc exe "set ft=vimrc"
" JavaCup syntax-------------------------------
autocmd BufRead *.cup exe "set ft=cup"

" Abrevations---------------------------------
iabbrev sout System.out.println();


" Airline ------------------------------

" let g:airline_powerline_fonts = 0
" let g:airline_theme = 'bubblegum'
" let g:airline#extensions#whitespace#enabled = 0

" " Fancy Symbols!!

" let g:webdevicons_enable = 1

" " custom airline symbols
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'
