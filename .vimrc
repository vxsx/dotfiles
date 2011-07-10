set nocompatible

" set number
set ruler
syntax on
set cursorline

" Set encoding
set fileencodings=utf8,cp1251
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set list listchars=tab:\ \ ,trail:·,nbsp:%

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" menu Encoding.UTF-8          :e ++enc=utf-8<CR>
" menu Encoding.KOI8-R         :e ++enc=koi8-r<CR>
" menu Encoding.KOI8-U         :e ++enc=koi8-u<CR>
" menu Encoding.CP1251         :e ++enc=cp1251<CR>
" menu Encoding.IBM-855        :e ++enc=ibm855<CR>
" menu Encoding.IBM-866        :e ++enc=ibm866<CR>
" menu Encoding.ISO-8859-5     :e ++enc=iso-8859-5<CR>
" menu Encoding.Latin-1        :e ++enc=latin1<CR>
" map <F2> :emenu Encoding.<TAB>



" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" make uses real tabs
au FileType make                                     set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=79

au BufNewFile,BufRead *.less set ft=less
au BufNewFile,BufRead *.tt set ft=html
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

map    <D-S-]>   gt
imap   <D-S-]>   <ESC>gt
map    <D-S-[>   gT
imap   <D-S-[>   <ESC>gT
map    <D-1>     1gt
imap   <D-1>     <ESC>1gt
map    <D-2>     2gt
imap   <D-2>     <ESC>2gt
map    <D-3>     3gt
imap   <D-3>     <ESC>3gt
map    <D-4>     4gt
imap   <D-4>     <ESC>4gt
map    <D-5>     5gt
imap   <D-5>     <ESC>5gt
map    <D-6>     6gt
imap   <D-6>     <ESC>6gt
map    <D-7>     7gt
imap   <D-7>     <ESC>7gt
map    <D-8>     8gt
imap   <D-8>     <ESC>8gt
map    <D-9>     9gt
imap   <D-9>     <ESC>9gt
map    <D-0>     :tablast<CR>
imap   <D-0>     <ESC>:tablast<CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>



imap <D-[> <ESC><<
imap <D-]> <ESC>>>
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" make it easy
nmap <Space> :


" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" Bubble chunks of text not working
" vmap <C-Right> dpgv
" vmap <C-Left> dPgv



" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme

" let g:solarized_termcolors = 16
set background=dark
color solarized

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set undofile
set undodir=~/.vim/backup

" here i'm setting nospell so it won't break some of my snippets, i don't
" really use it anyway
set nospell

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

set visualbell
set scrolloff=3

" map cyrillic keys to latin to use in command mode
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
"map . /

map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
"map , ?


" vnoremap <silent> <Leader>s :<C-U>let @/="<C-R>=MakePattern(@*)<CR>"<CR>:set hls<CR>
nmap <silent> <Leader><Space> :noh<CR>


let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'


if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif


if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
  nmap <Leader>a<Space> :Tabularize /<Space><CR>
  vmap <Leader>a<Space> :Tabularize /<Space><CR>
endif

iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nnoremap <Leader>[ <C-w>h<C-w><Bar>
nnoremap <Leader>] <C-w>l<C-w><Bar>

" thing is, if I leave only firefox.app - it opens firefox on my win7 virtual machine
abbrev ff :! open -a /Applications/Firefox.app %:p<cr>
abbrev gc :! open -a /Applications/Google\ Chrome.app %:p<cr>

nnoremap <tab> %
vnoremap <tab> %

" this is for learning hjkl moving
nnoremap <up>  <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up>   <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

inoremap jj <esc>

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j:e
nnoremap <leader>we <C-w>v<C-w>l:e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>se <C-w>s<C-w>j:e <C-R>=expand("%:p:h") . "/" <CR>

set rnu

nnoremap <Leader>gu :GundoToggle<CR>

function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map <Leader>s :call StripWhitespace ()<CR>

