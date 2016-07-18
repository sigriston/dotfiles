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

" Quickfix {{{2
Plug 'yssl/QFEnter'

" Statusline {{{2
Plug 'vim-airline/vim-airline'

" Undo history {{{2
Plug 'mbbill/undotree'

" Version Control {{{2
Plug 'tpope/vim-fugitive'
Plug 'jaxbot/github-issues.vim'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" Misc {{{2
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Snippets {{{2
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
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
