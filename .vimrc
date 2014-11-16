imap <C-j> <C-[>
nnoremap <F5> :silent update<Bar>silent !firefox %:p &<CR>
set nocompatible               " be iMproved
filetype off
set guioptions+=a
set clipboard+=unnamed
set clipboard+=autoselect
set noswapfile

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/NERDTree'
NeoBundle 'daylerees/colour-schemes',{'rtp':'vim/'}
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'railscasts'
NeoBundle 'sickill/vim-monokai'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'othree/html5-syntax.vim'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundleLazy 'jelera/vim-javascript-syntax',{'autoload':{'filetypes':['javascript']}}
NeoBundle 'kien/ctrlp.vim'


filetype plugin indent on     " required!
filetype indent on
syntax on

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" previm key-mappings.


set wildmenu
set showcmd

set hlsearch
set autoindent

set ruler
set laststatus=2

set number

set guicursor=a:blinkon0

set guioptions-=T
set guioptions+=m

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

NeoBundleCheck

autocmd BufReadPre *.js let b:javascript_lib_use_jquery=1
autocmd BufWritePre *.js :call JsBeautify()
" for html
autocmd FileType *.html  :call HtmlBeautify()
" for css or scss
autocmd FileType *.css  :call CSSBeautify()
autocmd BufNewFile,BufRead *.md set filetype=markdown

syntax enable
colorscheme monokai


