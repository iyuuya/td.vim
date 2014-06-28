"=============================================================================
" FILE: autoload/td/database.vim
" AUTHOR: iyuuya <i.yuuya@gmail.com>
" Last Change: 29-Jun-2014.
" License: MIT license
"=============================================================================
scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let g:td_default_database = ''

function! td#database#list()
  return td#util#http_get('/v3/database/list', {}).databases
endfunction

function! td#database#name()
  if g:td_default_database != ''
    return g:td_default_database
  else
    return ''
  end
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
