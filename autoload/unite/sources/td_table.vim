"=============================================================================
" FILE: autoload/unite/sources/td_table.vim
" AUTHOR: iyuuya <i.yuuya@gmail.com>
" Last Change: 29-Jun-2014.
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
  " [todo] - 引数どうやったら渡せるのか調べる
  let tables = td#table#list()

  return map(tables, '{
        \ "word" : v:val.name,
        \ "source" : "td/table",
        \ }')
endfunction

call unite#define_source(s:source)

let &cpo = s:save_cpo
unlet s:save_cpo
