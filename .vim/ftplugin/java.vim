" basic java highlighting
let java_highlight_functions = 1
let java_highlight_all = 1

let b:ale_fixers = ['google_java_format']
let b:ale_linters = ['javac']

highlight Operator ctermfg=5  guifg=#d175bc
highlight Typedef ctermfg=5  guifg=#d175bc
highlight Type ctermfg=4  guifg=#69b7d3
highlight Number term=bold ctermfg=16 gui=bold guifg=#d2d22d
highlight link javaScopeDecl Statement
highlight link javaType Type
highlight link javaDocTags PreProc
