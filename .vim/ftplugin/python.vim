set tabstop=4
set shiftwidth=4
set expandtab

set textwidth=150  " lines longer than 79 columns will be broken

let b:ale_fixers = ['autopep8']
let g:ale_python_flake8_args="--ignore=F821"
