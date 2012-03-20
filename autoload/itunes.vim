﻿"=============================================================================
" FILE: itunes.vim
" AUTHOR: Masahiro Kimoto <masahiro.kimoto@gmail.com>
" Last Modified: 2012 Mar 20
" Version: 0.1
"=============================================================================

let s:save_cpo = &cpo
set cpo&vim

if has('mac') "{{{
  function! s:request_to_itunes(request)
    call system("osascript -e 'tell application \"iTunes\" to " . a:request . "'")
  endfunction

  function! itunes#play() "{{{
    call s:request_to_itunes('play')
  endfunction "}}}

  function! itunes#stop() "{{{
    call s:request_to_itunes('stop')
  endfunction "}}}

  function! itunes#next() "{{{
    call s:request_to_itunes('next track')
  endfunction "}}}

  function! itunes#prev() "{{{
    call s:request_to_itunes('previous track')
  endfunction "}}}

  function! itunes#pause() "{{{
    call s:request_to_itunes('playpause')
  endfunction "}}}

  function! itunes#repeat() "{{{
    call s:request_to_itunes('set song repeat of current playlist to one')
  endfunction "}}}

  function! itunes#loop() "{{{
    call s:request_to_itunes('set song repeat of current playlist to all')
  endfunction "}}}
elseif has('win32') || has('win64')
endif "}}}

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: foldmethod=marker