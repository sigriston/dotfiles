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