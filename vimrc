" This will be passed down to my children
" if you are reading this in the future (probably year 2214)
" and the humans are still winning against the robots, hopefully
" this helps.
"
" <3 Ryan LaBouve, 2015
"

" ~*~*~*~*~*  General Config ~*~*~*~*~
"
colorscheme colorsbox-stnight

filetype off                  " required
syntax enable                 " enable syntax processing

set nocompatible              " be iMproved, required
set expandtab       " tabs are spaces
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
" http://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in
" http://dougblack.io/words/a-good-vimrc.html
"
set ignorecase
set smartcase

" UI STUFF
"
set number              " show line numbers
set relativenumber
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]

" SEARCHING STUFF
"
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" My leader is `,` This is quite important
let mapleader=","

" Get out of here colon
" You wastin mah time
" http://vim.wikia.com/wiki/Map_semicolon_to_colon
nmap ; :



" ~*~*~*~*~*  Vundle Stuff ~*~*~*~*~
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elixir-lang/vim-elixir'

" For browsing the files
Bundle 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'mattn/emmet-vim'
Plugin 'dsawardekar/ember.vim'
Bundle 'dsawardekar/portkey'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mileszs/ack.vim'
Plugin 'elzr/vim-json'
Plugin 'editorconfig/editorconfig-vim'        " respect projects rules
Plugin 'mxw/vim-jsx'
Plugin 'bling/vim-airline'
Plugin 'chrismccord/bclose.vim'               " For closing buffers


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
"
" A quicker way to reload vimrc
noremap <Leader>r :so %


" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']
let NERDTreeShowHidden=1

" Git plugin not hosted on GitHub
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Get dat airline bar going
let g:airline#extensions#tabline#enabled = 1

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp|bower_components)|(\.(swp|ico|git|svn))$'


" ## Splitting Stuff
"
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <C-f> :Ack   . <Left><Left><Left><Left>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-

augroup END

" Hat Tips:
" - https://github.com/thoughtbot/dotfiles/blob/master/vimrc
