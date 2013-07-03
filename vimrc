" Options
set nocompatible
set ruler  
"set foldmethod=indent
set incsearch
set novisualbell
set t_vb=
set mouse=a
set mousemodel=popup
set hidden
set guioptions-=T
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set laststatus=2
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P,
set statusline+=%{GitBranchInfoString()}
set smartindent
set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t

filetype off
syntax on
colorscheme slate
set number
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

filetype plugin indent on 

" backups
set backup
function! BackupDir()
    let l:backupdir=$HOME.'/.vim/backup/'.substitute(expand('%:p:h'), '^'.$HOME, '~', '')

    if !isdirectory(l:backupdir)
        call mkdir(l:backupdir, 'p', 0700)
    endif

    let &backupdir=l:backupdir

    let &backupext=strftime('-%Y-%m-%d-%H-%M')
endfunction

autocmd! bufwritepre * call BackupDir()

" encodings
set termencoding=utf-8
set fileencodings=utf8,cp1251,cp866
set encoding=utf8
set wildmenu
set wildmode=list:longest,full
set wcm=<Tab> 
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
map <F8> :emenu Encoding.<TAB>

" keybindings
nmap <silent> <F5> :NERDTreeToggle<CR>
nmap <silent> <F2> :BufExplorer<CR>

" Bundles
Bundle 'gmarik/vundle'
Bundle 'rails.vim'
Bundle 'The-NERD-tree'
Bundle 'perl-support.vim'
Bundle 'taglist.vim'
Bundle 'taglist-plus'
Bundle 'Git-Branch-Info'
Bundle 'hypergit.vim'
Bundle 'ruby.vim'
Bundle 'bufexplorer.zip'
