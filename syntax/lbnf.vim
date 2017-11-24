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

set commentstring=--%s

syn match  lbnfStatement         /^entrypoints/
syn match  lbnfStatement         /^comment/
syn match  lbnfStatement         /^rules/                                contained
syn match  lbnfStatement         /\v^separator(\s+nonempty)?/            contained nextgroup=lbnfNonTerminal
syn match  lbnfStatement         /\v^terminator(\s+nonempty)?/           contained nextgroup=lbnfNonTerminal
syn match  lbnfStatement         /\v^(position )?token/                  contained nextgroup=lbnfNonTerminal
syn match  lbnfStatement         /\v^layout\s+(stop|toplevel)?/
syn match  lbnfStatement         /^coercions/
syn match  lbnfStatement         /^internal/
syn match  lbnfComment           /^--.*$/
syn match  lbnfLabel             /^[A-Z_][a-zA-Z0-9_]*\./                contained nextgroup=lbnfCategory
syn match  lbnfEquals            /::=/                                   contained
syn match  lbnfUnionOp           /|/                                     contained
syn match  lbnfCategory          /\s\+[A-Z][a-zA-Z0-9_]*/                contained
syn match  lbnfNonTerminal       /\s\+[A-Z][a-zA-Z0-9_]*/                contained
syn match  lbnfParens            /\v(\(|\))/                             contained

syn region lbnfTerminal  start=+"+  end=+"+
syn region lbnfList      start=+\[+ end=+\]+

syn region lbnfProductionRule
\ start=/\v^([_A-Z][a-zA-Z0-9_]*\.|rules)/
\ end=";"
\ contains=lbnfStatement,lbnfLabel,lbnfEquals,lbnfTerminal,lbnfList,lbnfNonTerminal,lbnfUnionOp

syn region lbnfSeparatorPragma
\ start=/^separator/ end=";"
\ contains=lbnfStatement,lbnfNonTerminal,lbnfTerminal

syn region lbnfTerminatorPragma
\ start=/^terminator/ end=";"
\ contains=lbnfStatement,lbnfNonTerminal,lbnfTerminal

syn match  lbnfCharacterClass    /\v(eps|upper|lower|letter|digit|char)/ contained
syn match  lbnfTokenQuantifier   /\v(\*|\+|\?)/ contained
syn region lbnfTokenChar         start=+'+    end=+'+
syn region lbnfTokenCharSequence start=+{"+   end=+"}+
syn region lbnfTokenCharUnion    start=+\["+  end=+"\]+

syn region lbnfTokenPragma
\ start=/^token/ end=";"
\ contains=lbnfParens,lbnfStatement,lbnfCharacterClass,lbnfTokenChar,
\          lbnfUnionOp,lbnfTokenCharSequence,lbnfTokenCharUnion,lbnfTokenQuantifier

syn region lbnfCoercionsPragma
\ start=/^coercions/ end=";"
\ contains=lbnfStatement,lbnfNonTerminal,lbnfPrecedence

syn region lbnfLayoutPragma
\ start=/^layout/ end=";"
\ contains=lbnfStatement,lbnfTerminal

syn match lbnfPrecedence /[0-9]\+/ contained

hi link lbnfStatement         Keyword
hi link lbnfComment           Comment
hi link lbnfLabel             Label
hi link lbnfNonTerminal       Identifier
hi link lbnfTerminal          String
hi link lbnfList              Identifier
hi link lbnfEquals            Operator
hi link lbnfUnionOp           Delimiter
hi link lbnfParens            Operator
hi link lbnfCharacterClass    Type
hi link lbnfTokenChar         Character
hi link lbnfTokenCharSequence String
hi link lbnfTokenCharUnion    Type
hi link lbnfTokenQuantifier   Operator
hi link lbnfPrecedence        Number
hi link lbnfCategory          lbnfNonTerminal
