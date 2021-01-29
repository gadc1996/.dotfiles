" Plugins
call plug#begin('~/.vim/plugged')
"Themes
Plug 'dracula/vim',{'as': 'dracula'}
Plug 'morhetz/gruvbox'

"IDE
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-fugitive'

"Utilities
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim'

call plug#end()

"Plugin configurations
"Themes configuration
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

"IDE configuration
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\~$'] 
let NERDTreeMinimalUI = 1
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

"Utilities configuration
set nocompatible
filetype plugin on

"Configurations
set tabstop=2 "Set tab length 
set nowrap "Disable text wrapping
set nobackup	"Disable backup files
set noswapfile "Disable swap files
set noshowmode "Hide default status bar 
set laststatus=2
set shiftwidth=2 "Set tab length at newline"
set number relativenumber "Display line numbers
let &t_ut='' "Prevents terminal colorscheme to mess up Vim

" Mappings
let mapleader = ' '
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>qq :wq<CR>
nmap <C-t> :tabnew<CR>
nmap <C-w> :tabclose<CR>
nmap <Leader>t :NERDTreeToggle<CR>
nnoremap <silent> <C-p> :Files<CR>
autocmd FileType python map <buffer> <F6> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F6> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"VimWiki configurations
