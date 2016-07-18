" vim:fdm=marker
" **********************************************
" * Thiago Massariolli Sigrist's init.vim file *
" **********************************************

"    (L) Thiago Massariolli Sigrist 2007-2016
"    ----------------------------------------

" **********************************************
" **********************************************


" Basic Settings {{{1
" Use 24-bit (true-color) mode in Vim/Neovim.
" Thanks joshdick/onedark.vim for the tip!

if (has("nvim"))
  " This is for neovim <= 0.1.4
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  " ... and this is for neovim >= 0.1.5
  set termguicolors
endif

" Use cursor shapes in terminal
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Line numbers - current line has absolute number, other lines have relative
set nu
set rnu

" Expands tabs/indents to 2 characters
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Search smartcase options
set ignorecase
set smartcase

" Enable current-line highlighting
set cursorline

" Virtual edit for visual blocks.
set virtualedit=block


" PLUGINS {{{1
call plug#begin()

" Plugins use roughly the same sections as the vim-galore awesome-list
" https://github.com/mhinz/vim-galore/blob/master/content/plugins.md

" Colorschemes {{{2
Plug 'morhetz/gruvbox'

" Alignment {{{2
Plug 'junegunn/vim-easy-align'

" Code completion {{{2
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" Commenters {{{2
Plug 'tpope/vim-commentary'

" Delimiters {{{2
Plug 'jiangmiao/auto-pairs'
" Plug 'Raimondi/delimitMate'

" Fuzzy finders {{{2
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Grep tools {{{2
Plug 'mhinz/vim-grepper'

" Navigation {{{2
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'tpope/vim-unimpaired'
Plug 'osyo-manga/vim-anzu'
Plug 'kien/rainbow_parentheses.vim'
Plug 'gcmt/wildfire.vim'

" Quickfix {{{2
Plug 'yssl/QFEnter'
Plug 'milkypostman/vim-togglelist'

" Statusline {{{2
Plug 'vim-airline/vim-airline'

" Undo history {{{2
Plug 'mbbill/undotree'

" Version Control {{{2
Plug 'tpope/vim-fugitive'
" Plug 'jaxbot/github-issues.vim' - slows down fugitive too much
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" Misc {{{2
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'matze/vim-move'
Plug 'neomake/neomake'
Plug 'editorconfig/editorconfig-vim'
Plug 'rizzatti/dash.vim'

" Snippets {{{2
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'

" Language: JavaScript
Plug 'ahmedelgabri/vim-ava-snippets'
call plug#end()


" Default colorscheme
set background=dark
colorscheme gruvbox

" PLUGIN CONFIGURATION {{{1
" Bindings for vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" junegunn/fzf {{{2
nnoremap <c-p> :FZF<cr>

" mhinz/vim-grepper {{{2
let g:grepper = {
  \ 'tools': ['pt', 'git', 'grep'],
  \ }
nnoremap <leader>git :Grepper -tool git -noswitch<cr>
nnoremap <leader>*   :Grepper -tool pt -cword -noprompt<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" haya14busa/incsearch {{{2
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" haya14busa/incsearch-easymotion {{{2
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

" vim-airline/vim-airline {{{2
let g:airline_powerline_fonts=1

" mbbill/undotree {{{2
" Mapping for undotree
nnoremap <F5> :UndotreeToggle<CR>

" tpope/vim-fugitive {{{2
nnoremap <F7> :Gstatus<CR>

" osyo-manga/vim-anzu {{{2
" anzu setup (plugin that shows number of occurrences when searching)
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

" statusline
set statusline=%{anzu#search_status()}

" kien/rainbow_parentheses.vim {{{2
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" matze/vim-move {{{2
let g:move_key_modifier = 'C'

" rizzatti/dash.vim {{{2
nmap <Leader>] <Plug>DashSearch
vmap <Leader>] <Plug>DashSearch
