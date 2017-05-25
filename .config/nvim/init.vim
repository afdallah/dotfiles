"------------- Graphical tweak -------------"
" Use 24-bit (true-color) mode in Vim/Neovim
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
    set termguicolors
endif

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

set t_CO=256                                    " Set terminal color to 256 mode

" Option for Macvim and gvim only
if has("gui_running")
    " Better font reduce stress, https://github.com/andreberg/Meslo-Font
    " Meslo has a good default line-height/vertical spacing
    set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline:h13
    " Set line height
    set linespace=6
    " Remove all gui decoration: scroolbar right and leftt, top menu, tab.
    set guioptions=
    set relativenumber
    " Set default window size
    set lines=50 columns=120
    :winpos 50 50 " Center window
endif

hi CursorLineNR cterm=bold
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNr term=bold  gui=bold ctermfg=11 guifg=yellow
augroup END

" Netrw Generic Style
hi link netrwData Operator
hi link netrwLib Operator
hi link netrwMakeFile Operator
hi link netrwClassify Constant
hi link netrwHidePat Constant
hi link netrwList Constant

" set colorcolumn=80                              " Set line 80 char
" Wrap line if > 80 char in markdown only
au BufRead,BufNewFile *.md setlocal textwidth=80

">> Vim one <<"
function! ActivateVimeOne()
    call one#highlight('Identifier', '', '', 'italic')
    call one#highlight('Keyword', '', '', 'bold')

    call one#highlight('htmlArg', '', '', 'italic')

    call one#highlight('SpecialComment', '', '', 'italic')
    call one#highlight('Comment', '5c6370', '', 'italic')

    call one#highlight('javascriptVariable', '', '', 'italic')
    call one#highlight('jsThis', '', '', 'italic')
    call one#highlight('javascriptClassKeyword', '', '', 'italic')
    call one#highlight('javascriptFuncArg', '', '', 'italic')
    call one#highlight('javascriptFuncKeyword', '', '', 'italic')
    call one#highlight('jsFuncCall', '', '', 'italic')

    call one#highlight('sassMixin', '', '', 'italic')

    call one#highlight('markdownItalic', '', '', 'italic')
endfunction

" This 2 line should alway placed above colorscheme definition to achieve the
" right color
syntax on                                       " Enable syntax highlighter

" Theme
if (has("nvim"))
    colorscheme one
    let g:airline_theme='one'
    let g:one_allow_italics = 1                 " Enable italic

    set background=dark                         " For the dark version
    call ActivateVimeOne()                      " Must below set background
else
    " Set theme depend on the time of the day
    if strftime("%H") >= 19
        colorscheme monokai

        let g:monokai_term_italic = 1
        let g:airline_theme='base16_ocean'
    else
        colorscheme one

        let g:airline_theme='one'
        let g:one_allow_italics = 1             " Enable italic

        set background=dark                     " For the dark version

        call ActivateVimeOne()                  " Must below set background
    endif

    " Accroding to this post http://sunaku.github.io/vim-256color-bce.html
    if &term =~ '256color'
        " Disable Background Color Erase (BCE) so that color schemes
        " work properly when Vim is used inside tmux and GNU screen.
        " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
        set t_ut=
    endif
endif

" Italic Support *Must use actual escape symbol by pressing <C-v><Escape>
" to achieve italic style, make sure higlight Comment cterm=italic alway
" placed below colorscheme definition
set t_ZH=[3m
set t_ZR=[23m

highlight Comment cterm=italic

set fillchars+=vert:│                           " Make split border nicer

hi VertSplit ctermbg=NONE guibg=NONE

set laststatus=2
set complete=.,w,u,b                            " Set autocomplete
set display+=lastline                           " Hide @ symbol when screen
set showcmd                                     " Show pressed command

"------------- Buffer -------------"
set hidden                                      " Force switch buffer
"Set autowriteall                               " Automatically write the file when switching buffer

set wrap                                        " Set wordwrap
let &showbreak = '↳ '

set number                                      " Show number
" set relativenumber                              " Set relativenumber

"------------- Clipboard -------------"
set clipboard=unnamed                       " Set clipboard to able to copy from and to system clipboard

"------------- Indentation -------------"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start                  " Make Backspace behave like another text editor
set autoindent
set smartindent
set smarttab
set breakindent
set copyindent
set shiftround
set list                                        " Display whitespace char
set listchars=tab:▸\ ,eol:¬

"------------- Split Option -------------"
set splitright                                  " New vsplit in the right of current
set splitbelow                                  " New split below current
set completeopt-=menu                           " Disable scratch preview window

"------------- Searching -------------"
set ignorecase                                  " Make search insensitive
set hlsearch
set incsearch                                   " Move cursor before hit enter
set showmatch
set smartcase

"------------- Misc -------------"
set timeoutlen=1000 ttimeoutlen=0               " Remove delay when htting escape

" folding manual
set foldmethod=manual

set mouse=a                                     " Enable Mouse in vim

set spelllang=en_us                             " Spellcheck

set noerrorbells visualbell t_vb=               " Remove bell sound when error

set autoread

set nocompatible

" dont make any backup and temporary files
set nobackup
set noswapfile

filetype plugin indent on

" Make rendering faster
set ttyfast
"------------- Mapping -------------"
let mapleader = ','                             " Set leader map to comma

" Shortcut for editing .vimrc
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :so $MYVIMRC<cr>
nmap <Leader>ep :tabedit ~/.config/nvim/plugins.vim<cr>

" Remove search higlight when hit escape
nnoremap <silent> <esc><esc> :noh<cr>

" Make Navigation split easier
nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>

"---------- Auto Commands -----------"
" Automatically source .vimrc file on save
augroup autosourcing
  autocmd!
  autocmd BufWritePost $MYVIMRC so %
augroup END

autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS

" Omnicomplete autocompletion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css,scss set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

" Dynamic indentation depend on file type
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype css,scss setlocal ts=2 sw=2 expandtab

" Ctags help to autocomplete class name (CSS, SCSS)
"autocmd FileType css,scss set iskeyword=@,48-57,_,-,?,!,192-25

"------------- Source Plugins -------------"
so ~/.config/nvim/plugins.vim                           " source Plugin

"------------- Plugin Settings -------------"
">> Ctrl-p <<"
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'                            " Show result on top
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " Ignore everything iside gitignore file
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|target|dist)|(\.(swp|ico|git|svn))$'

">> Make YouCompleteMe compatible with Ultisnips <<"
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

">> Better keybinding for Ultisnips <<"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsEditSplit="vertical"                                                             " Open snip window in split
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"

" Autoclose scratch window
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" YouCompleteMe Enable Omnifunc
let g:ycm_semantic_triggers =  {
    \   'c' : ['->', '.'],
    \   'objc' : ['->', '.'],
    \   'ocaml' : ['.', '#'],
    \   'cpp,objcpp' : ['->', '.', '::'],
    \   'perl' : ['->'],
    \   'php' : ['->', '::', '(', 'use ', 'namespace ', '\'],
    \   'cs,java,typescript,d,python,perl6,scala,vb,elixir,go' : ['.', 're!(?=[a-zA-Z]{3,4})'],
    \   'html': ['<', '"', '</', ' '],
    \   'vim' : ['re![_a-za-z]+[_\w]*\.'],
    \   'ruby' : ['.', '::'],
    \   'lua' : ['.', ':'],
    \   'erlang' : [':'],
    \   'haskell' : ['.', 're!.'],
    \   'scss,css': [ 're!^\s{2,4}', 're!:\s+' ],
    \ }

" Prevent omnifunc appear in this filetype
let g:ycm_filetype_blacklist={
    \   'tagbar' : 1,
    \   'nerdtree' : 1,
    \   'markdown' : 1,
    \   'unite' : 1,
    \   'text' : 1,
    \   'csv' : 1,
    \}

">> Vim Airline <<"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" Powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Display vim mode as letter
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

">> Vim simple playground <<"
fun! BuildNodePlayground()
    call BuildPlayground("node", "//=>", "console.log")
endfun

">> Editorconfig <<"
" According tho this issue https://github.com/editorconfig/editorconfig-vim/issues/50
let g:EditorConfig_core_mode = 'python_external'

">> NerdCommenter <<"
" Add space between symbol
let g:NERDSpaceDelims = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

">> GitGutter <<"
set updatetime=250
nmap <Leader>g :GitGutterSignsToggle<cr>

">> NERDTree <<"
" Nerdtree window resize
let g:NERDTreeWinSize = 30

" Dont show hidden files
let g:NERDTreeShowHidden=0

" Auto change working directory based on the current root dir
let g:NERDTreeChDirMode=2

" Single click to open nodes
let g:NERDTreeMouseMode=3

" Dont let Nerdtree hijack netrw and vinegar
let NERDTreeHijackNetrw = 0

" Ignored files
let g:NERDTreeIgnore=['\.swp$', '\~$', 'node_modules$', '\.map$', 'maps$']
let g:NERDTreeWinPos = "right"

nnoremap <c-n> :NERDTreeToggle<cr>

let g:NERDTreeDirArrowExpandable="▸"
let g:NERDTreeDirArrowCollapsible="▾"

">> Vinegar <<"
" let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$,node_modules'

">> Tabular <<"
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Auto align when typing Pipe table on markdown
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction

">> js beatify <<"
".vimrc
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
