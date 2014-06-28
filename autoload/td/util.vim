"=============================================================================
" FILE: autoload/td/util.vim
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

let s:host = 'api.treasuredata.com'

function! td#util#http_get(path, params)
  return s:JSON.decode(s:HTTP.get('http://' . s:host . a:path, a:params, {'AUTHORIZATION' : 'TD1 '.g:td_api_key}).content)
endfunction

function! td#util#http_post(path, params)
  return s:JSON.decode(s:HTTP.post('http://' . s:host . a:path, a:params, {'AUTHORIZATION' : 'TD1 '.g:td_api_key}).content)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
