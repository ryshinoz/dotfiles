" plugin
source ~/.vimrc.neobundle

" indent
source ~/.vimrc.indent
" neocomplcache
source ~/.vimrc.neocomplcache
" neosnippet
source ~/.vimrc.neosnippet
" colorscheme
source ~/.vimrc.colorscheme
" statusline
source ~/.vimrc.statusline
" goshrepl
source ~/.vimrc.goshrepl
" gist
source ~/.vimrc.gist

set noswapfile
set nobackup
set number
syntax on
nnoremap j gj
nnoremap k gk

" MacVimで保存したファイルをテキストエディタで開けるようにする
au BufWritePost * call SetUTF8Xattr(expand("<afile>"))
function! SetUTF8Xattr(file)
    let isutf8 = &fileencoding == "utf-8" || ( &fileencoding == "" && &encoding == "utf-8")
    if has("unix") && match(system("uname"),'Darwin') != -1 && isutf8
        call system("xattr -w com.apple.TextEncoding 'utf-8;134217984' '" . a:file . "'")
    endif
endfunction

"YankRing.vim
set viminfo+=!
let g:yankring_manual_clipboard_check = 0

" Markdown
if system("uname") == "Darwin\n"
    let g:quickrun_config = {}
    let g:quickrun_config.markdown = {
          \ 'outputter' : 'null',
          \ 'command'   : 'open',
          \ 'cmdopt'    : '-a',
          \ 'args'      : 'Marked',
          \ 'exec'      : '%c %o %a %s',
          \ }
endif

" tmux C-tとかぶっちゃうので
"nnoremap <C-[> :pop<CR>

" Vim motions
let g:EasyMotion_leader_key = "'"
