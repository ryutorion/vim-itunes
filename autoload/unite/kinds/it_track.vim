"=============================================================================
" FILE: unite/kinds/it_track.vim
" AUTHOR: Masahiro Kimot <masahiro.kimoto@gmail.com>
" Last Modified: 2012 Mar 24
"=============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! unite#kinds#it_track#define() "{{{
  return s:kind
endfunction "}}}

let s:kind = {
      \ 'name' : 'it_track',
      \ 'default_action' : 'play',
      \ 'action_table' : {}
      \}

" Actions "{{{
let s:kind.action_table.play = {
      \ 'description' : 'play the track'
      \}

if has('mac')
  function! s:kind.action_table.play.func(candidate) "{{{
    call system("osascript -e 'tell Application \"iTunes\" to play file track id " . a:candidate.action__id ." of user playlist 1'")
  endfunction "}}}
elseif has('win32') || has('win64')
  function! s:kind.action_table.play.func(candidate) "{{{
  endfunction "}}}
endif
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: fdm=marker
