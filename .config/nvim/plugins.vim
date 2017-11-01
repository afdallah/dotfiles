" Install Ycm + dep and compile
function! InstallYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py
    !cd ./third_party/ycmd/third_party/tern_runtime && npm install
  endif
endfunction

call plug#begin('~/.config/nvim/bundle')

" Plug 'kien/ctrlp.vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-obsession'
Plug 'scrooloose/nerdcommenter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'
Plug 'skwp/vim-html-escape'
Plug 'digitaltoad/vim-pug'
Plug 'marijnh/tern_for_vim', { 'do' : 'npm install' }
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'godlygeek/tabular'
Plug 'gregsexton/MatchTag'
Plug 'andersoncustodio/vim-enter-indent'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe', { 'do': function('InstallYCM') }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'jceb/emmet.snippets'
Plug 'editorconfig/editorconfig-vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim', { 'do' : 'cp colors/* ~/.config/nvim/colors/' }
Plug 'rakr/vim-one', { 'do' : 'cp colors/* ~/.config/nvim/colors/' }
Plug 'crusoexia/vim-monokai', { 'do' : 'cp colors/* ~/.config/nvim/colors/' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'wakatime/vim-wakatime'
Plug 'vim-scripts/simple_playground.vim'
Plug 'skwp/greplace.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'JamshedVesuna/vim-markdown-preview', { 'do' : 'pip install grip' }
Plug 'mxw/vim-jsx'

" Plugin 'scrooloose/syntastic'
" Plugin 'junegunn/vim-easy-align'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'maksimr/vim-jsbeautify', { 'do' : 'git submodule update --init --recursive' }
" Plugin 'maxbrunsfeld/vim-yankstack'
" Plugin 'elzr/vim-json'
" Plugin 'moll/vim-node'
" Plugin 'syngan/vim-vimlint'
" Plugin 'ynkdir/vim-vimlparser'
" Plugin 'flazz/vim-colorschemes'
" Plugin 'wookiehangover/jshint.vim'
" Plugin 'Yggdroot/indentLine'
" Plugin 'arnaud-lb/vim-php-namespace'
" Plugin 'sheerun/vim-polyglot'
" Plug 'amadeus/vim-mjml'
call plug#end()
