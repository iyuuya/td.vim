"=============================================================================
" FILE: plugin/td.vim
" AUTHOR: iyuuya <i.yuuya@gmail.com>
" Last Change: 29-Jun-2014.
" License: MIT license
"=============================================================================
scriptencoding utf-8

if expand("%:p") ==# expand("<sfile>:p")
  unlet! g:loaded_td
endif
if exists('g:loaded_td')
  finish
endif
let g:loaded_td = 1

let s:save_cpo = &cpo
set cpo&vim

command! TDDB
      \ echo td#database#list()
command! -nargs=1 TDTable
      \ echo td#table#list('<args>')

function! s:td_issue(args)
  if a:args == ''
    let database = g:td_default_database
  else
    let database = a:args
  endif
  return td#job#issue(database, td#util#current_buffer_str())
endfunction
command! -nargs=? TDIssue echo s:td_issue('<args>')

let &cpo = s:save_cpo
unlet s:save_cpo
