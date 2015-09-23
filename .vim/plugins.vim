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
" ░▓ File:  ▓ plugins.vim
" ░▓▓▓▓▓▓▓▓▓▓
" ░░░░░░░░░░
"

" Install plugin manager {{{
   if empty(glob("~/.vim/autoload/plug.vim"))        
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
   endif                         
" }}}
      
" ┏━┓╻  ╻ ╻┏━╸╻┏┓╻   ┏━┓╺┳╸╻ ╻┏━╸┏━╸
" ┣━┛┃  ┃ ┃┃╺┓┃┃┗┫   ┗━┓ ┃ ┃ ┃┣╸ ┣╸ 
" ╹  ┗━╸┗━┛┗━┛╹╹ ╹   ┗━┛ ╹ ┗━┛╹  ╹  
" -------------------------------------------{{{
      
  call plug#begin('~/.vim/plugged')                 
     
      Plug 'scrooloose/syntastic'             " Syntax checking hacks for vim
      Plug 'airblade/vim-gitgutter'           " Shows a git diff
      Plug 'tpope/vim-fugitive'               " Git wrapper
      Plug 'rking/ag.vim'                     " Front for ag
      Plug 'itchyny/lightline.vim'            " Lean & mean status/tabline for vim - строка статуса/состояния
      Plug 'mhinz/vim-startify'               " Nice start screen

 
      " Group dependencies, vim-snippets depends on ultisnips
      Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
      
      " On-demand loading
      Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
      
      " My ADD
      Plug 'kien/ctrlp.vim'                   " Fuzzy file, buffer, mru, tag, etc finder.
      Plug 'tacahiroy/ctrlp-funky'
      Plug 'tpope/vim-surround'               " provides mappings to easily delete, change and add such surroundings in pairs

      "Python Add
      Plug 'klen/python-mode', {'for': 'python'}      " Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box
      Plug 'mitsuhiko/vim-jinja', {'for': 'python'}   " Jinja support for vim
      
  " Add plugins to &runtimepath
  call plug#end()

" }}}

" ┏━┓╻  ╻ ╻┏━╸╻┏┓╻   ┏━┓┏━╸╺┳╸╺┳╸╻┏┓╻┏━╸
" ┣━┛┃  ┃ ┃┃╺┓┃┃┗┫   ┗━┓┣╸  ┃  ┃ ┃┃┗┫┃╺┓
" ╹  ┗━╸┗━┛┗━┛╹╹ ╹   ┗━┛┗━╸ ╹  ╹ ╹╹ ╹┗━┛
" -------------------------------------------{{{

  " syntatic http://git.io/syntastic.vim {
  " linters: (from aur) nodejs-jshint, nodejs-jsonlint, csslint, checkbashisms
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    highlight SyntasticErrorSign ctermfg=red ctermbg=237
    highlight SyntasticWarningSign ctermfg=yellow ctermbg=237
    highlight SyntasticStyleErrorSign ctermfg=red ctermbg=237
    highlight SyntasticStyleWarningSign ctermfg=yellow ctermbg=237
  " }

  " git-gutter http://git.io/vimgitgutter {
    let g:gitgutter_realtime = 1
    let g:gitgutter_eager = 1
    let g:gitgutter_diff_args = '-w'
    let g:gitgutter_sign_added = '+'
    let g:gitgutter_sign_modified = '~'
    let g:gitgutter_sign_removed = '-'
    let g:gitgutter_sign_removed_first_line = '^'
    let g:gitgutter_sign_modified_removed = ':'
    let g:gitgutter_max_signs = 1500
    highlight clear SignColumn
    highlight GitGutterAdd ctermfg=green ctermbg=237
    highlight GitGutterChange ctermfg=yellow ctermbg=237
    highlight GitGutterDelete ctermfg=red ctermbg=237
    highlight GitGutterChangeDelete ctermfg=red ctermbg=237
  " }

  " ag, the silver searcher http://git.io/AEu3dQ + http://git.io/d9N0MA {
    let g:agprg="ag -i --vimgrep"
    let g:ag_highlight=1
    " map \ to the ag command for quick searching
      nnoremap \ :Ag<SPACE>
  "}

  " nerdtree settings{
    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
    let g:NERDTreeWinSize = 40
    let g:NERDShutUp=1
    " explorer mappings
      nnoremap <f1> :BufExplorer<cr>
      nnoremap <f2> :NERDTreeToggle<cr>
      map <C-e> <plug>NERDTreeTabsToggle<CR>
      map <leader>e :NERDTreeFind<CR>
      nmap <leader>nt :NERDTreeFind<CR>
  " }

  " CTRLP settings {
    let g:ctrlp_working_path_mode = 'ra'
    nnoremap <silent> <D-t> :CtrlP<CR>
    nnoremap <silent> <D-r> :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
    " On Windows use "dir" as fallback command.
      if has('win16') || has('win32') || has('win64')
          let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
      elseif executable('ag')
          let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
      elseif executable('ack-grep')
          let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
      elseif executable('ack')
          let s:ctrlp_fallback = 'ack %s --nocolor -f'
      else
          let s:ctrlp_fallback = 'find %s -type f'
      endif
    let g:ctrlp_user_command = {
      \ 'types': {
          \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
          \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': s:ctrlp_fallback
    \ }
  "}

  " ctrlp-funky settings {
    let g:ctrlp_extensions = ['funky']
    nnoremap <Leader>fu :CtrlPFunky<Cr>
  " }

  " Startify settings {
    let g:startify_change_to_dir = 0
    let g:startify_files_number = 8
    let g:startify_bookmarks = ['~/.vimrc',]
    let g:startify_skiplist = ['vimrc',]
  " }

  " Python-mode settings {
    " Python-mode
    " Activate rope
    " Keys:
    " K Show python docs
    " <Ctrl-Space> Rope autocomplete
    " <Ctrl-c>g Rope goto definition
    " <Ctrl-c>d Rope show documentation
    " <Ctrl-c>f Rope find occurrences
    " <Leader>b Set, unset breakpoint (g:pymode_breakpoint enabled)
    " [[ Jump on previous class or function (normal, visual, operator modes)
    " ]] Jump on next class or function (normal, visual, operator modes)
    " [M Jump on previous class or method (normal, visual, operator modes)
    " ]M Jump on next class or method (normal, visual, operator modes)
      let g:pymode_rope = 0 
    " Documentation
      let g:pymode_doc = 0
      let g:pymode_doc_key = 'K'
    "Linting
      let g:pymode_lint = 0
      let g:pymode_lint_checker = "pyflakes,pep8"
      let g:pymode_lint_ignore="E501,W601,C0110"
      let g:pymode_lint_write = 0
    " Support virtualenv
      let g:pymode_virtualenv = 1
    " Enable breakpoints plugin
      let g:pymode_breakpoint = 1
      let g:pymode_breakpoint_key = '<leader>b'
    " Syntax highlighting
      let g:pymode_syntax = 1
      let g:pymode_syntax_all = 1
      let g:pymode_syntax_indent_errors = g:pymode_syntax_all
      let g:pymode_syntax_space_errors = g:pymode_syntax_all
    " Don't autofold code
      let g:pymode_folding = 0
    " Get possibility to run Python code
      let g:pymode_run = 0
    " Other options
      let g:pymode_options_colorcolumn = 0
      let g:pymode_lint_checkers = ['pyflakes']
      let g:pymode_trim_whitespaces = 0
      let g:pymode_options = 0
  " }


  " ┏━┓╺┳╸┏━┓╺┳╸╻ ╻┏━┓╻  ╻┏┓╻┏━╸
  " ┗━┓ ┃ ┣━┫ ┃ ┃ ┃┗━┓┃  ┃┃┗┫┣╸ 
  " ┗━┛ ╹ ╹ ╹ ╹ ┗━┛┗━┛┗━╸╹╹ ╹┗━╸
  " lightline http://git.io/lightline
  " █▓▒░ wizard status line
  set laststatus=2
  let g:lightline = {
    \ 'colorscheme': 'zenburn',
    \ 'active': {
    \   'left': [ [ 'filename' ],
    \             [ 'readonly', 'fugitive' ] ],
    \   'right': [ [ 'percent', 'lineinfo' ],
    \              [ 'fileencoding', 'filetype' ],
    \              [ 'fileformat', 'syntastic' ] ]
    \ },
    \ 'component_function': {
    \   'modified': 'WizMod',
    \   'readonly': 'WizRO',
    \   'fugitive': 'WizGit',
    \   'filename': 'WizName',
    \   'filetype': 'WizType',
    \   'fileformat' : 'WizFormat',
    \   'fileencoding': 'WizEncoding',
    \   'mode': 'WizMode',
    \ },
    \ 'component_expand': {
    \   'syntastic': 'SyntasticStatuslineFlag',
    \ },
    \ 'component_type': {
    \   'syntastic': 'error',
    \ },
    \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
    \ 'subseparator': { 'left': '▒', 'right': '░' }
    \ }

  function! WizMod()
    return &ft =~ 'help\|vimfiler' ? '' : &modified ? '»' : &modifiable ? '' : ''
  endfunction

  function! WizRO()
    return &ft !~? 'help\|vimfiler' && &readonly ? 'x' : ''
  endfunction

  function! WizGit()
    if &ft !~? 'help\|vimfiler' && exists("*fugitive#head")
      return fugitive#head()
    endif
    return ''
  endfunction

  function! WizName()
    return ('' != WizMod() ? WizMod() . ' ' : '') .
          \ ('' != expand('%:t') ? expand('%:t') : '[none]') 
  endfunction

  function! WizType()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
  endfunction

  function! WizFormat()
    return ''
  endfunction

  function! WizEncoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &enc : &enc) : ''
  endfunction

  augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp call s:syntastic()
  augroup END
  function! s:syntastic()
    SyntasticCheck
    call lightline#update()
  endfunction





" }}}






