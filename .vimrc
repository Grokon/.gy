"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░
"
"  ▓▓▓▓▓▓▓▓▓▓
" ░▓ author ▓ grokon
" ░▓ code   ▓ http://
" ░▓ mirror ▓ http://git.io/.gy
" ░▓ File:  ▓ vimrc
" ░▓▓▓▓▓▓▓▓▓▓
" ░░░░░░░░░░
"

" use vim settings, rather than vi settings
" must be first, because it changes other options as a side effect
set nocompatible                                        " be iMproved (Must be first line)

" Windows Compatible {
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
    " across (heterogeneous) systems easier.
    if has('win32') || has('win64')
        set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME
    else
        set shell=/bin/bash
    endif
" }


" ┏━┓┏━┓┏━┓╻┏━╸
" ┣━┫┣━┫┗━┓┃┃  
" ┗━┛╹ ╹┗━┛╹┗━╸
" ----------------------------------------------------- {{{

    set paste                                           " paste without auto indentation
    set hidden                                          " не выгружать буфер когда переключаешься на другой

    set wildmenu                                        " enable ctrl-n and ctrl-p to scroll thru matches
    set wildmode=longest,list,full                      " make cmdline tab completion similar to bash
    set wildignorecase 
    
    set incsearch                                       " do incremental searching
    set hlsearch                                        " hilight searches by default
    set ignorecase                                      " Case insensitive search - поиск без учёта регистра символов
    set smartcase                                       " Case sensitive when uc present

    set gdefault                                        " the /g flag on :s substitutions by default

    set backspace=indent,eol,start                      " allow backspacing over everything in insert mode

    set shiftwidth=2                                    " размер отступов (нажатие на << или >>)
    set expandtab                                       " tabs are spaces, not tabs - преобразовать табуляцию в пробелы
    set tabstop=2                                       " an indentation every four columns - ширина табуляции
    set softtabstop=2                                   " let backspace delete indent - ширина 'мягкого' таба

    set mouse=a                                         " Automatically enable mouse usage
    set mousehide                                       " Hide the mouse cursor while typing

    set viewoptions=folds,options,cursor,unix,slash     " Better Unix / Windows compatibility
    set virtualedit+=block                              " Allow for cursor beyond last character (onemore)
    set iskeyword-=.                                    " '.' is an end of word designator
    set iskeyword-=#                                    " '#' is an end of word designator
    set iskeyword-=-                                    " '-' is an end of word designator

    set noswapfile                                      " не использовать своп-файл (в него скидываются открытые буферы)
    set undofile                                        " So is persistent undo ...
    set undodir=~/.vim/undo                             " undo files

    " Make those folders automatically if they don't already exist.
        if !isdirectory(expand(&undodir))
            call mkdir(expand(&undodir), "p")
        endif

    " remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


" }}}

" ╻┏┓╻╺┳╸┏━╸┏━┓┏━╸┏━┓┏━╸┏━╸
" ┃┃┗┫ ┃ ┣╸ ┣┳┛┣╸ ┣━┫┃  ┣╸ 
" ╹╹ ╹ ╹ ┗━╸╹┗╸╹  ╹ ╹┗━╸┗━╸
" ----------------------------------------------------- {{{

    set showmatch                                       " Show matching brackets/parenthesis показывать первую парную скобку   set tabpagemax=15                                   " Only show 15 tabs
    set shortmess+=filmnrxoOtT                          " Abbrev. of messages (avoids 'hit enter')

    syntax on                                           " turn on syntax highlighting
    filetype off

    set lazyredraw                                      " stop unnecessary rendering

    set number                                          " show line numbers
    set nowrap                                          " Do not wrap long lines

    " no folding
    set foldlevel=99
    set foldminlines=99

    set cursorcolumn                                    " highlight column
    set cursorline                                      " Highlight current line - подсветка строки и колонки курсора
    highlight clear SignColumn                          " SignColumn should match background
    highlight clear LineNr                              " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr                       " Remove highlight color from current line number

    " Display tabs and trailing spaces
    set list                                            " включить подсветку
    set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮    " установить символы, которыми будет осуществляться подсветка

    set autoindent                                      " ai - включить автоотступы (копируется отступ предыдущей строки)
    set smartindent                                     " Do smart autoindenting when starting a new line
    set copyindent

    colorscheme zenburn

    

" }}}

" ┏━┓╺┳┓╺┳┓┏━┓┏┓╻┏━┓
" ┣━┫ ┃┃ ┃┃┃ ┃┃┗┫┗━┓
" ╹ ╹╺┻┛╺┻┛┗━┛╹ ╹┗━┛
" ----------------------------------------------------- {{{

" External Configurations {

    " Key Mappings
    if filereadable(expand("~/.vim/mappings.vim"))
      source ~/.vim/mappings.vim
    endif

    " Abbreviations
    if filereadable(expand("~/.vim/abbreviations.vim"))
      source ~/.vim/abbreviations.vim
    endif

    " Customizations
    if filereadable(expand("~/.vim/customs.vim"))
      source ~/.vim/customs.vim
    endif

    "Plugins
    if filereadable(expand("~/.vim/plugins.vim"))
      source ~/.vim/plugins.vim
    endif

" }}}

" vim: set foldmarker={,} foldlevel=0 foldmethod=marker :
" End of vimrc
