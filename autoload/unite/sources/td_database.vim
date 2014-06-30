"=============================================================================
" FILE: autoload/unite/sources/td_database.vim
" AUTHOR: iyuuya <i.yuuya@gmail.com>
" Last Change: 30-Jun-2014.
" License: MIT license
"=============================================================================
scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! unite#sources#td_database#define()
  return s:source
endfunction

let s:source = {
      \ 'name' : 'td/database',
      \ }

function! s:source.gather_candidates(args, context)
  let databases = td#database#list()

  return map(databases, '{
        \ "word" : v:val.name,
        \ "source" : "td/database",
        \ }')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
