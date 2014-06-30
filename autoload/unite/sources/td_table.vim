"=============================================================================
" FILE: autoload/unite/sources/td_table.vim
" AUTHOR: iyuuya <i.yuuya@gmail.com>
" Last Change: 30-Jun-2014.
" License: MIT license
"=============================================================================
scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! unite#sources#td_table#define()
  return s:source
endfunction

let s:source = {
      \ 'name' : 'td/table',
      \ }

function! s:source.gather_candidates(args, context)
  let tables = td#table#list(a:args[0])

  return map(tables, '{
        \ "word" : v:val.name,
        \ "source" : "td/table",
        \ }')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
