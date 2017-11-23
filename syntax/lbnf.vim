" Vim syntax file
" Language: LBNF
" Add this to your vimrc "au bufreadpre,bufnewfile *.cf set ft=lbnf"
" and put this file in ~/.vim/syntax/
" Author: Jim Persson <di2peji [AT] student [DOT] chalmers [dot] se>

if v:version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

syn match lbnfStatement /^entrypoints/
syn match lbnfStatement /^comment/
syn match lbnfStatement /^rules/
syn match lbnfStatement /\v^separator(\s+nonempty)/
syn match lbnfStatement /\v^terminator(\s+nonempty)/
syn match lbnfStatement /\v^(position )?token/
syn match lbnfStatement /^layout/
syn match lbnfStatement /^coercions/
syn match lbnfStatement /^internal/
syn match lbnfComment   /^--.*$/
syn match lbnfLabel     /^\w*\./        nextgroup=lbnfClass
syn match lbnfClass     /.*/            contained contains=lbnfEquals,lbnfString,lbnfList,lbnfIdent
syn match lbnfEquals    /::=/           contained
syn match lbnfIdent     / [a-zA-Z0-9]*/ contained

syn region lbnfString start=+"+  end=+"+
syn region lbnfList   start=+\[+ end=+\]+

hi link lbnfStatement  Keyword
hi link lbnfString     String
hi link lbnfList       Identifier
hi link lbnfComment    Comment
hi link lbnfLabel      Label
hi link lbnfClass      Identifier
hi link lbnfEquals     Operator
hi link lbnfIdent      Identifier
