" vim:fdm=marker
" **********************************************
" * Thiago Massariolli Sigrist's init.vim file *
" **********************************************

"    (L) Thiago Massariolli Sigrist 2007-2019
"    ----------------------------------------

" **********************************************
" **********************************************


" Basic Settings {{{1

" NOTE - we no longer use termguicolors, just a base16 theme in the terminal

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

" Install vim-plug automagically
" from: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
  " Plugins use roughly the same sections as the vim-galore awesome-list
  " https://github.com/mhinz/vim-galore/blob/master/content/plugins.md

  " Colorschemes {{{2
  Plug 'chriskempson/base16-vim'

  " Alignment {{{2
  Plug 'junegunn/vim-easy-align'

  " Code completion {{{2
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Commenters {{{2
  Plug 'tpope/vim-commentary'

  " Delimiters {{{2
  Plug 'jiangmiao/auto-pairs'

  " Fuzzy finders {{{2
  Plug 'srstevenson/vim-picker'

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
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  Plug 'airblade/vim-gitgutter'

  " Tmux {{{2
  Plug 'christoomey/vim-tmux-navigator'

  " Misc {{{2
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'matze/vim-move'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'rizzatti/dash.vim'

  " Snippets {{{2
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'sheerun/vim-polyglot'
  Plug 'heavenshell/vim-jsdoc'

  " Productivity {{{2
  Plug 'vimwiki/vimwiki'

  " Windowing {{{2
  Plug 'roman/golden-ratio'
  Plug 'bagrat/vim-buffet'

  " Linting {{{2
  Plug 'dense-analysis/ale'

  " Language: JavaScript
  Plug 'epilande/vim-react-snippets'
  Plug 'ahmedelgabri/vim-ava-snippets'

  " Language: Reason
  Plug 'reasonml-editor/vim-reason-plus'
call plug#end()


" Load base16 colorscheme
source ~/.config/nvim/colorscheme.vim

" set terminal background to NONE - the color will be the same but this will
" let through urxvt's transparency
hi Normal ctermbg=NONE

" PLUGIN CONFIGURATION {{{1
" Bindings for vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" srstevenson/vim-picker {{{2
nmap <unique> <c-p> <Plug>PickerEdit

" mhinz/vim-grepper {{{2
let g:grepper = {
  \ 'tools': ['rg', 'git', 'grep'],
  \ }
nnoremap <leader>git :Grepper -tool git -noswitch<cr>
nnoremap <leader>*   :Grepper -tool rg -cword<cr>
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

" christoomey/vim-tmux-navigator {{{2
let g:tmux_navigator_no_mappings = 1

nnoremap <C-s>h :TmuxNavigateLeft<cr>
nnoremap <C-s>j :TmuxNavigateDown<cr>
nnoremap <C-s>k :TmuxNavigateUp<cr>
nnoremap <C-s>l :TmuxNavigateRight<cr>
nnoremap <C-s><Leader> :TmuxNavigatePrevious<cr>

" bagrat/vim-buffet {{{2
let g:buffet_powerline_separators = 1
let g:buffet_show_index = 1

" dense-analysis/ale {{{2
let g:airline#extensions#ale#enabled = 1

set hidden

nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gl :ALEGoToDefinition<CR>
nnoremap <silent> gL :ALEGoToDefinitionInSplit<CR>

call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})
