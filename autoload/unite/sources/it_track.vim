"=============================================================================
" FILE: it_track.vim
" AUTHOR: Masahiro Kimoto <masahiro.kimoto@gmail.com>
" Last Modified: 2012 Mar 21
" Version: 0.1
"=============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! unite#sources#it_track#define()
  return s:source_it_track
endfunction

let s:source_it_track = {
      \ 'name' : 'it_track',
      \ 'description' : 'candidates from tracks in iTunes Library',
      \}

if has('mac')
  let s:command = 'osascript ' . expand('<sfile>:p:h') . "/it_track.scpt"
elseif has('win32') || has('win64')
  let s:command = 'cscript /Nologo ' . expand('<sfile>:p:h') . "/it_track.js"
endif

function! s:source_it_track.gather_candidates(args, context) "{{{
  if unite#util#has_vimproc()
    let tracks = split(vimproc#system(s:command), "\n")
  else
    let tracks = split(system(s:command), "\n")
  endif
  
  let result = []
  for track in tracks
    let t = split(track, "\t")
    let result += [{
          \ 'word' : t[0],
          \ 'kind' : 'it_track',
          \ 'action__id' : t[1]
          \}]
  endfor
  return result
endfunction "}}}

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: fdm=marker
