"=============================================================================
" FILE: autoload/td.vim
" AUTHOR: iyuuya <i.yuuya@gmail.com>
" Last Change: 29-Jun-2014.
" License: MIT license
"=============================================================================
scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let Vital = vital#of('td')
let s:HTTP = Vital.import('Web.HTTP')
let s:JSON = Vital.import('Web.JSON')

let authorization_prefix = 'AUTHORIZATION: TD1 '
let s:host = 'api.treasuredata.com'

function! td#get(path, params)
  return s:JSON.decode(s:HTTP.get('http://' . s:host . a:path, a:params, {'AUTHORIZATION' : 'TD1 '.g:td_api_key}).content)
endfunction

function! td#post(path, params)
  return s:JSON.decode(s:HTTP.post('http://' . s:host . a:path, a:params, {'AUTHORIZATION' : 'TD1 '.g:td_api_key}).content)
endfunction

function! td#databases()
  return td#get('/v3/database/list', {}).databases
endfunction

function! td#tables(database)
  return td#get('/v3/table/list/' . a:database, {}).tables
endfunction

" [todo] - POST /v3/table/swap/:database/:table1/:table2
function! td#table_swap(database, src, dst)
endfunction

function! td#jobs()
  return td#get('/v3/job/list', {}).jobs
endfunction

function! td#job_issue(database, query, ...)
  " [todo] - priority
  " priority (optional): priority of the job. -2 (VERY LOW) to 2 (VERY HIGH). The default is 0 (NORMAL).
  return td#post('/v3/job/issue/hive/' . a:database, { 'query' : a:query })
endfunction

function! td#job_status(job_id)
  return td#get('/v3/job/status/' . a:job_id, {})
endfunction

function! td#job_show(job_id)
  return td#get('/v3/job/show/' . a:job_id, {})
endfunction

function! td#job_kill(job_id)
  return td#post('/v3/job/kill/'.a:job_id)
endfunction

function! td#job_result(job_id)
  return s:HTTP.get('http://api.treasuredata.com/v3/job/result/' . a:job_id, { 'format' : 'csv' }, {'AUTHORIZATION' : 'TD1 '.g:td_api_key}).content
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
