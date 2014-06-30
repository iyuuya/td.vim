"=============================================================================
" FILE: autoload/unite/sources/td_job.vim
" AUTHOR: iyuuya <i.yuuya@gmail.com>
" Last Change: 30-Jun-2014.
" License: MIT license
"=============================================================================
scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! unite#sources#td_job#define()
  return s:source
endfunction

let s:source = {
      \ 'name' : 'td/job',
      \ }

function! s:source.gather_candidates(args, context)
  let jobs = td#job#list()

  return map(jobs, '{
        \ "word" : v:val.job_id . " status: " . v:val.status,
        \ "source" : "td/job",
        \ }')
endfunction

call unite#define_source(s:source)

let &cpo = s:save_cpo
unlet s:save_cpo
