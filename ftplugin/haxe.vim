" Haxe CTAGS
set tags+=$HAXE_STD/tags
set tags+=$HAXE_LIB/tags
let g:neocomplcache_enable_at_startup = 1

" Vaxe
inoremap <S-SPACE> <ESC>:call vaxe#ImportClass()<CR>o
