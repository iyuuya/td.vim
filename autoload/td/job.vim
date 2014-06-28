"=============================================================================
" FILE: autoload/td/job#.vim
" AUTHOR: iyuuya <i.yuuya@gmail.com>
" Last Change: 29-Jun-2014.
" License: MIT license
"=============================================================================
scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! td#job#list()
  return td#util#http_get('/v3/job#/list', {}).jobs
endfunction

function! td#job#issue(database, query, ...)
  " [todo] - priority
  " priority (optional): priority of the job#. -2 (VERY LOW) to 2 (VERY HIGH). The default is 0 (NORMAL).
  return td#util#http_post('/v3/job#/issue/hive/' . a:database, { 'query' : a:query })
endfunction

function! td#job#status(job_id)
  return td#util#http_get('/v3/job#/status/' . a:job_id, {})
endfunction

function! td#job#show(job_id)
  return td#util#http_get('/v3/job#/show/' . a:job_id, {})
endfunction

function! td#job#kill(job_id)
  return td#util#http_post('/v3/job#/kill/'.a:job_id)
endfunction

function! td#job#result(job_id)
  return s:HTTP.get('http://api.treasuredata.com/v3/job#/result/' . a:job_id, { 'format' : 'csv' }, {'AUTHORIZATION' : 'TD1 '.g:td_api_key}).content
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
