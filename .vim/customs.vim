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


" Environments (GUI/Console) ---------------------------------------------- {{{

if has('gui_running')
    " GUI Vim

    set lines=50 columns=125                " 40 lines of text instead of 24

    " Remove all the UI cruft
    set go-=T                   " Remove the toolbar
    set go-=l
    set go-=L
    set go-=r                   " remove right-hand scroll bar
    set go-=R

    highlight SpellBad term=underline gui=undercurl guisp=Orange

    " Different cursors for different modes.
    "set guicursor=n-c:block-Cursor-blinkon0
    "set guicursor+=v:block-vCursor-blinkon0
    "set guicursor+=i-ci:ver20-iCursor

    if has("gui_macvim")
        " Full screen means FULL screen
        set fuoptions=maxvert,maxhorz

        set guifont=Menlo\ Regular\ for\ Powerline:h12

        " Use the normal HIG movements, except for M-Up/Down
        let macvim_skip_cmd_opt_movement = 1
        no   <D-Left>       <Home>
        no!  <D-Left>       <Home>
        no   <M-Left>       <C-Left>
        no!  <M-Left>       <C-Left>

        no   <D-Right>      <End>
        no!  <D-Right>      <End>
        no   <M-Right>      <C-Right>
        no!  <M-Right>      <C-Right>

        no   <D-Up>         <C-Home>
        ino  <D-Up>         <C-Home>
        imap <M-Up>         <C-o>{

        no   <D-Down>       <C-End>
        ino  <D-Down>       <C-End>
        imap <M-Down>       <C-o>}

        imap <M-BS>         <C-w>
        inoremap <D-BS>     <esc>my0c`y
    else
        " Non-MacVim GUI, like Gvim
        set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10

    end
else
    " Console Vim
    " For me, this means iTerm2, possibly through tmux
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256            " Tell the term has 256 colors
    endif
endif

" }}}




"----------

"setlocal spell spelllang=ru_yo,en_us
" циклическое переключение спелл-чекера (взято с www.opennet.ru/base/X/vim_orfo.txt.html)
if has("spell")
"   По умолчанию проверка орфографии выключена.
    setlocal spell spelllang=
    setlocal nospell
    "
    function ChangeSpellLang()
        if &spelllang =~ "en_us"
            setlocal spell spelllang=ru
            echo "spelllang: ru"
        elseif &spelllang =~ "ru"
            setlocal spell spelllang=
            setlocal nospell
            echo "spelllang: off"
        else
            setlocal spell spelllang=en_us
            echo "spelllang: en"
        endif
    endfunc

    " map spell on/off for English/Russian
    map <F11> <Esc>:call ChangeSpellLang()<CR>
    " limit it to just the top 10 items
    set sps=best,10
endif

" Эту небольшую функцию можно вставить  в свой .vimrc и все. По нажатию
" F11 будут попеременно включаться Русский, Английски, или вообще
" выключаться проверка орфографии. Все неправильно написанные слова будут
" подсвечены. Теперь при наведении на это слово курсора и нажатии z=
" выпадет менюшка, с возможными правильными вариантами. Как и везде слово
" можно добавить к словарю (zG), перейти к следующей (]z), предыдущей ([z)
" ошибке, пометить слово как ошибочное - zW.


" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}



" End of custom.vim
