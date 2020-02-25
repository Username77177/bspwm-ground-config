""""""""""""""PLUGINS
call plug#begin()

" FuzzyFinder (для быстрого поиска) (sudo npm install fzf)
Plug 'junegunn/fzf.vim'
" NERDTree - быстрый просмотр файлов
Plug 'preservim/nerdtree'
" Сoc - автодополнение 
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Линия статуса
Plug 'itchyny/lightline.vim'
" Темы
Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'
" Проверка Синтаксиса
Plug 'scrooloose/syntastic' 
" Плагин для закрытия скобок
Plug 'alvan/vim-closetag'
" Emmet для Vim
Plug 'mattn/emmet-vim'
" Плагин для причесывания кода (sudo npm install prettier)
Plug 'prettier/vim-prettier', {
  \ 'do': 'sudo npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" Плагин для предпросмотра Markdown
Plug 'iamcco/markdown-preview.nvim'
" Сниппеты
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Тема
Plug 'mhartington/oceanic-next'
" C/C++ автодополнение
" Plug 'xavierd/clang_complete'
" Deoplete (замена coc)
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" YCM Замена Coc и Deoplete
" Plug 'ycm-core/YouCompleteMe'
call plug#end()
"""""""""""""""""""""""""PLUGINS
""""""""""""""""""UI
set nocompatible 
set t_Co=256
syntax enable

set expandtab
set smarttab
"1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Тема для **NeoVim**
colorscheme OceanicNext
""""""""""""""""""""UI

""""""""""""""UX
" Комбинация клавиш jkl - действует как Escape в режиме Insert
inoremap jkl <ESC>

" Функция для установки пакетов для COC
function CocPacks()
          :CocInstall coc-html
          :CocInstall coc-emmet
          :CocInstall coc-python
          :CocInstall coc-snippets
  endf

" Вызов функции с помощью <C-\>
nmap <C-\> :call CocPacks()<CR>

" OMNICOMPLETION
filetype plugin on
set omnifunc=syntaxcomplete#Complete
aug omnicomplete
    au!
    au FileType html,htmldjango,jinja,markdown setl omnifunc=emmet#completeTag 
    au FileType php setl ofu=phpcomplete#CompletePHP
    au FileType ruby,eruby setl ofu=rubycomplete#Complete
    au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
    au FileType c,cpp setl ofu=ccomplete#CompleteCpp
    au FileType css,sass,scss,stylus,less setl omnifunc=csscomplete#CompleteCSS
    au FileType javascript,jsx setl omnifunc=tern#Complete
    au FileType python setl omnifunc=pythoncomplete#Complete
    au FileType xml setl omnifunc=xmlcomplete#CompleteTags
aug END

"""""""""""""""""""UX

""""""""""""""""""""""PLUGINS CONFIGURATION
"""Closetag

" Указываем расширения файлов в которых работает автодополнение тегов
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" Автодополнение тегов HTML по умолчанию
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"""NERDTREE

" В нормальном режиме Ctrl+f вызывает :NERDTree
nmap <C-f> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"""Lightline

" Линия статуса: конфигурация
set noshowmode " Табличка --INSERT-- больше не выводится на экран
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'oceanicnext',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

"""Clang

let g:clang_library_path='ls /usr/lib/llvm-6.0/lib'

"""Emmet
" Делаем так, чтобы Emmet работал только в HTML/CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
