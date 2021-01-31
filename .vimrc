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
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml'] }
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'turbio/bracey.vim',{
	\ 'do' : 'npm install --prefix server'}

"Utilities
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

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
let NERDTreeWinSize = 10000
let g:bracey_server_allow_remote_connections = 1
let g:bracey_server_port = 8080
let g:prettier#autoformat = 0
let g:prettier#print_width = 10000
let g:prettier#config#html_whitespace_sensitivity = 'strict'
let g:prettier#config#use_tabs= 'true'
let g:prettier#config#tab_width= 2
let g:mkdp_auto_start = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml Prettier

"Utilities configuration
set nocompatible
filetype plugin on

"Vim Configurations
set tabstop=2 "Set tab length 
set nowrap "Disable text wrapping
set nobackup	"Disable backup files
set noswapfile "Disable swap files
set noshowmode "Hide default status bar 
set laststatus=2
set shiftwidth=2 "Set tab length at newline"
set number relativenumber "Display line numbers
let &t_ut='' "Prevents terminal colorscheme to mess up Vim
set belloff=all "Prevents anoying beeping

" Mappings
let mapleader = ' '
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>s :sp<CR>
nmap <Leader>vs :vs<CR>
nmap <Leader>ls :Bracey<CR>
nmap <C-t> :tabnew<CR>
nmap <C-w> :tabclose<CR>
nmap <Leader>t :NERDTreeToggle<CR>
nmap <Leader>md :MarkdownPreview<CR>
nmap <Leader>mds :MarkdownPreviewStop<CR>
nnoremap <silent> <C-p> :Files<CR>
autocmd FileType python map <buffer> <F6> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F6> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
map <F7> gg=G<C-o><C-o>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
