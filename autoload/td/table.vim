"=============================================================================
" FILE: autoload/td/table.vim
" AUTHOR: iyuuya <i.yuuya@gmail.com>
" Last Change: 29-Jun-2014.
" License: MIT license
"=============================================================================
scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! td#table#list(database)
  return td#util#http_get('/v3/table/list/' . a:database, {}).tables
endfunction

" [todo] - POST /v3/table/swap/:database/:table1/:table2
function! td#table#swap(database, src, dst)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
