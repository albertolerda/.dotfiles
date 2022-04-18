set tabstop=8     " tabs are at proper location
set expandtab     " don't use actual tab character (ctrl-v)
set shiftwidth=2  " indenting is 4 spaces
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs
set cindent       " stricter rules for C programs

" set relativenumber
set number relativenumber

let mapleader = " " " map leader to Space

" == VIM PLUG ================================
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'axelf4/vim-strip-trailing-whitespace'
"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Rust config
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
"Plug 'dikiaap/minimalist'

" Plug 'preservim/nerdtree'
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vlime/vlime', {'rtp': 'vim/'}
call plug#end()
" == VIMPLUG END ================================
" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================

set background=dark
" colorscheme minimalist

Plug 'tpope/vim-repeat'


if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" Normal mode
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l
" Terminal mode
if has('nvim')
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
endif
" Insert mode
inoremap <M-h> <ESC><c-w>h
inoremap <M-j> <ESC><c-w>j
inoremap <M-k> <ESC><c-w>k
inoremap <M-l> <ESC><c-w>l
" Visual mode
vnoremap <M-h> <ESC><c-w>h
vnoremap <M-j> <ESC><c-w>j
vnoremap <M-k> <ESC><c-w>k
vnoremap <M-l> <ESC><c-w>l

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Expand to path of current buffer
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
map ,o :FZF<CR>
set hidden

" Set $VISUAL to nvim in term
if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
