" This will be passed down to my children
" if you are reading this in the future (probably year 2214)
" and the humans are still winning against the robots, hopefully
" this helps.
"
" <3 Ryan LaBouve, 2015
"

" ~*~*~*~*~*  General Config ~*~*~*~*~
"
" colorscheme colorsbox-stnight

filetype off                  " required
syntax enable                 " enable syntax processing

set nocompatible              " be iMproved, required
set expandtab       " tabs are spaces
set history=1000                "Store lots of :cmdline history
set visualbell                  "No sounds
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands

" https://amix.dk/vim/vimrc.html
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" ## Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set smartcase


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

" UI STUFF
set number              " show line numbers
set relativenumber
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]

set autoread


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
" Colors
Plugin 'chriskempson/base16-vim'
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default
set background=dark

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elixir-lang/vim-elixir'
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

Plugin 'tmux-plugins/vim-tmux-focus-events'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
"
" A quicker way to reload vimrc
noremap <Leader>r :so ~/.vimrc<cr>

" ## Buffer Stuff, (close, next, prev)
"   - Mimics command+w
map <leader>w :Bclose<cr>
map <leader>n :bn<cr>
"  - p makes more sense, n is convinient when going back and forth
map <leader>p :bp<cr>
map <leader>n :bp<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']
let NERDTreeShowHidden=1
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")) | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Purge cache every control p time
nnoremap <silent> <c-p> :ClearCtrlPCache<cr>\|:CtrlP<cr>

" Get dat airline bar going
let g:airline#extensions#tabline#enabled = 1

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp|bower_components)|(\.(swp|ico|git|svn))$'


" ## Splitting Stuff
"
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Resizing
" -- up and down
nnoremap <silent> <Leader>+ :exe "resize +10"<CR>
nnoremap <silent> <Leader>- :exe "resize -10"<CR>
" -- left and right
nnoremap <Leader>> :exe "vertical resize +10"<CR>
nnoremap <Leader>< :vertical resize -10<CR>

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

" https://github.com/skwp/dotfiles/blob/master/vimrc
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


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
