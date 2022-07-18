" GENERAL SETTINGS
set enc=utf-8
set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set nobackup
set nowritebackup
filetype indent on
set autoindent
set smartindent
set backspace=indent,eol,start
set shortmess-=S
set wrap linebreak nolist
set cursorline
set ruler
set hlsearch
set cursorcolumn
set cursorline
set t_Co=256
set mouse=i
filetype indent on
set iskeyword+=- "Treat words with dash as a word in Vim
" let g:netrw_browse_split=4      " Open file in previous buffer

set clipboard=unnamedplus " use the clipboards of vim and win
" set paste                   " Paste from a windows or from vim
set belloff=all

" https://www.youtube.com/watch?v=HxMd4psEWmc
" first `sudo apt install exuberant-ctags`
" or `sudo pacman -S ctags`
" then in workind directory do `ctags -R --languages=php *` 
" search for tags with ctrl+[
" or `vim -t function_name` or inside vim `:ts function_name`
" navigate on tags with `:tn` or `:tp` or `:ts` for search results for previos tag
" below setting to look for `tags` file in working vim directory, and up above for `tags` till `$HOME` 
set tags=./tags,tags;$HOME

filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=0
set smarttab

set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set foldmethod=indent

" css and js indention inside html
let g:html_indent_script1 = 'inc'
let g:html_indent_style1 = 'inc'
let mapleader = ','

if has('gui_running')
  set guioptions -=m
  set guioptions=Ace
  set guioptions -=T
  if has('gui_gtk2')
    set guifont=Inconsolata\ 12
  elseif has('gui_macvim') set guifont=Menlo\ Regular:h14
  elseif has('gui_win32')
    set guifont=Consolas:h10:cANSI
    set rtp +=~/vimfiles
  endif
  language en  " sets the language of the messages / ui (vim)
endif

" KEYMAPS
nmap + gg=G<C-o><C-o>
nnoremap <F2> :set hlsearch!<CR>
noremap <silent> <C-k> gk
noremap <silent> <C-j> gj
nnoremap <silent> <Leader>b :TagbarToggle<CR>
nnoremap c "_c
xnoremap c "_c
nnoremap <leader>c c
nnoremap d "_d
xnoremap d "_d
nnoremap <leader>d d
xnoremap <leader>d d
noremap x "_x
" <leader>p throws away the selected text and pastes the content of the default register
xnoremap <leader>p "_dP
imap <C-v> <Esc>pa
smap <C-v> <C-g>p
cmap <C-v> <C-r>+
noremap <silent> <leader>; :Buffers<CR>
map <Leader> <Plug>(easymotion-prefix)
map <Space> <Leader>
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>

" PLUGINS
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ackyshake/VimCompletesMe'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'thaerkh/vim-workspace'
Plug 'sonph/onehalf', { 'rtp': 'vim' } " color scheme
Plug 'pangloss/vim-javascript'
call plug#end()

" PLUGIN SETTINGS

" tells fzf not to search in filenames
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

g:tagbar_ctags_bin = '$HOME\vimfiles\plugged\ctags'

let b:vcm_tab_complete='Omni completion'

let g:workspace_autosave_ignore = ['gitcommit']

colorscheme onehalfdark
let g:netrw_banner=0 " disable directory banner
let php_htmlInStrings = 1
au BufNewFile,BufRead,BufReadPost *.twig set syntax=html
" autocmd BufNewFile,BufRead *.blade.php set syntax=html
" autocmd BufNewFile,BufRead *.blade.php set filetype=html
" au BufNewFile,BufRead,BufReadPost *.blade.php set syntax=html

let g:workspace_session_name='session.vim'
let g:workspace_create_new_tabs = 0 " enabled = 1 (default), disabled = 0
let g:workspace_persist_undo_history = 1  " enabled = 1 (default), disabled = 0
let g:workspace_undodir='.undodir'

let g:user_emmet_leader_key=','
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 1

" https://minsw.github.io/fzf-color-picker/
let $FZF_DEFAULT_OPTS='
      \ --color=fg:#dcdfe4,bg:#282c34,hl:#61afef
      \ --color=fg+:#dcdfe4,bg+:#282c34,hl+:#61afef
      \ --color=info:#e5c07b,prompt:#e06c75,pointer:#c678dd
      \ --color=marker:#98c379,spinner:#c678dd,header:#56b6c2'

let g:airline_theme='onehalfdark'
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'python': ['flake8', 'pylint'],
\}
let g:ale_python_flake8_options = '--ignore=E501'

let g:javascript_plugin_jsdoc = 1

let g:airline#extensions#tagbar#enabled = 1 " enable tagbar in vim airline
