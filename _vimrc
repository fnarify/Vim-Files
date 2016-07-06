set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswni

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" Makes GVim begin maximised.
au GUIEnter * simalt ~x
" Remove backup (~) files.
set nobackup
" automatically detect filetypes.
filetype plugin indent on
" Remove auto-commenting for //
au Filetype c,cpp setlocal comments-=:// comments+=f://
" syntax highlighting.
syntax on
set autoindent
set smartindent
set smarttab
" tabs are 4 spaces.
set shiftwidth=4
set tabstop=4
set softtabstop=4
" tabs are spaces.
set expandtab
set number
" turn off error bell sound.
"set noerrorbells
" remove italics.
"let g:solarized_italic=0
silent! let g:gruvbox_italic=0
"change colour scheme, and fail quietly.
silent! colorscheme gruvbox
set background=dark
" window dimensions.
"set lines=100
"set columns=400
" key mappings.
map <C-S-Tab> :tabprev<CR>
map <C-Tab> :tabnext<CR>
map <C-w> :tabclose<CR>
map <C-t> :tabnew<CR>
