" Vim syntax file
" Language:     JavaScript
" Maintainer:   vim-javascript community
" URL:          https://github.com/pangloss/vim-javascript
syntax keyword jsBuiltins define require navigator length location
syntax keyword jsOperator yield

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink jsParens               Operator
  HiLink jsFuncParens           Operator

  HiLink jsBrackets             Function
  HiLink jsBraces               Function
  HiLink jsFuncBraces           Function
  HiLink jsClassBraces          Function
  HiLink jsIfElseBraces         Function
  HiLink jsTryCatchBraces       Function
  HiLink jsModuleBraces         Function
  HiLink jsObjectBraces         Function
  HiLink jsFinallyBraces        Function
  HiLink jsRepeatBraces         Function
  HiLink jsSwitchBraces         Function
  HiLink jsTemplateBraces       Function
  HiLink jsDestructuringBraces     Function

  HiLink jsThis                 Identifier
  HiLink jsLength               Identifier

  delcommand HiLink
endif

