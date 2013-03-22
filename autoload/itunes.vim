"=============================================================================
" FILE: itunes.vim
" AUTHOR: Masahiro Kimoto <masahiro.kimoto@gmail.com>
" Last Modified: 2013 Mar 22
" Version: 0.1
"=============================================================================

let s:save_cpo = &cpo
set cpo&vim

if has('mac') "{{{
  function! s:request_to_itunes(request)
    if unite#util#has_vimproc()
      call vimproc#system_bg("osascript -e 'tell application \"iTunes\" to " . a:request . "'")
    else
      call system("osascript -e 'tell application \"iTunes\" to " . a:request . "'")
    endif
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

  function! itunes#volume_up(value) "{{{
    call s:request_to_itunes('set sound volume to sound volume + ' . a:value)
  endfunction "}}}
  function! itunes#volume_down(value) "{{{
    call s:request_to_itunes('set sound volume to sound volume - ' . a:value)
  endfunction "}}}

elseif has('win32') || has('win64')
  let s:path = expand('<sfile>:p:h') . '/itunes.js'
  function! s:request_to_itunes(request)
    if unite#util#has_vimproc()
      call vimproc#system_bg("cscript.exe " . substitute(s:path, '\\', '/', 'g') . ' ' . a:request)
    else
      call system("cscript " . substitute(s:path, '/', '\\', 'g') . ' ' . a:request)
    endif

  endfunction

  function! itunes#play() "{{{
    call s:request_to_itunes('play')
  endfunction "}}}

  function! itunes#stop() "{{{
    call s:request_to_itunes('stop')
  endfunction "}}}

  function! itunes#next() "{{{
    call s:request_to_itunes('next')
  endfunction "}}}

  function! itunes#prev() "{{{
    call s:request_to_itunes('prev')
  endfunction "}}}

  function! itunes#pause() "{{{
    call s:request_to_itunes('pause')
  endfunction "}}}

  function! itunes#repeat() "{{{
    call s:request_to_itunes('repeat')
  endfunction "}}}

  function! itunes#loop() "{{{
    call s:request_to_itunes('loop')
  endfunction "}}}

  function! itunes#volume_up(value) "{{{
    call s:request_to_itunes('volume_up '. a:value)
  endfunction "}}}

  function! itunes#volume_down(value) "{{{
    call s:request_to_itunes('volume_down '. a:value)
  endfunction "}}}
endif "}}}

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: foldmethod=marker
