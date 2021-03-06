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

command! TDDatabaseList
      \ echo td#database#list()

command! -nargs=1 TDTableList
      \ echo td#table#list('<args>')

command! TDJobList
      \ echo td#job#list()
command! -nargs=1 TDJobStatus
      \ echo td#job#status('<args>')
command! -nargs=1 TDJobShow
      \ echo td#job#show('<args>')
command! -nargs=1 TDJobKill
      \ echo td#job#kill('<args>')
command! -nargs=1 TDJobResult
      \ echo td#job#result('<args>')
function! s:td_issue(args)
  if a:args == ''
    let database = td#database#name()
  else
    let database = a:args
  endif
  if database == ''
    throw "Argument Error"
  endif
  return td#job#issue(database, td#util#current_buffer_str())
endfunction
command! -nargs=? TDIssueCurrentBuffer echo s:td_issue('<args>')

let &cpo = s:save_cpo
unlet s:save_cpo
