"autocmd BufWritePre *.js Prettier

"===================Vim Settings==============
" for WEBPACK When using automatic compilation of your code,
" you could run into issues when saving your files.
" Some editors have a "safe write" feature that can potentially
" interfere with recompilation. "https://webpack.js.org/guides/development/"
" test if symlink works bro - IT WORK DOE


"mac copy pasting test
vnoremap \y y:call system("pbcopy", getreg("\""))<CR>
nnoremap \p :call setreg("\"", system("pbpaste"))<CR>p

noremap YY "+y<CR>
noremap LP "+gP<CR>
noremap XX "+x<CR>


let mapleader = " " "leader is space bar
nnoremap <leader>r :w<CR>: !node %<CR>
" Code above maps <space>r to save file and run code in crtl z mode


map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>


set backupcopy=yes "for vim

set encoding=UTF-8
nnoremap <F2> :NERDTree<CR>
set nocompatible
filetype off
set showmatch "bracket pair highlighting

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" highlights current number (pls delete iff no worky )
set cursorline
set cursorlineopt=number

" When i commented this line out, matching brackets worked na idk why
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold

filetype plugin indent on
"set relativenumber "relative nums
set number     " Enable line numbers
syntax on  " Enable syntax highlighting

" How many columns of whitespace a \t is worth
" How many columns of whitespace a level of indentation is worth
set shiftwidth=2
" Use spaces when tabbing
set expandtab
set incsearch  " Enable incremental search
set hlsearch   " Enable highlight search
"set termwinsize=3x0   " Set terminal size
set splitbelow         " Always split below
set mouse=a            " Enable mouse drag on window splits
set nowrap


nmap <silent> fk :ter<CR>
"CURSOR This will give you a blinking block in normal mode, a blinking vertical bar in insert mode, and a blinking underscore in replace mode.

let &t_EI = "\<Esc>[1 q"
let &t_SR = "\<Esc>[3 q"
let &t_SI = "\<Esc>[5 q"

""  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar


"Install vim-plug if we don't already have it
    if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'   "pr sure this is syntax highlighting
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax (from ben awad)
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mattn/emmet-vim'
Plug 'justinmk/vim-sneak' "missing movement in vim (use s{char}{char} to look for stuff)
"Plug 'tpope/vim-surround' " shortcuts to easily change/delete/add surroundings in pairs
Plug 'preservim/nerdtree'
"Plug 'ryanoasis/vim-devicons'"
Plug 'mhinz/vim-startify'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'Yggdroot/indentLine' "  indent line stuff
Plug 'ntpeters/vim-better-whitespace'
Plug 'davidhalter/jedi-vim' "Vim keybinds for jedi python autocomplete library
Plug 'ctrlpvim/ctrlp.vim'

"{{ Autopairs
" ---> closing XML tags <---
Plug 'alvan/vim-closetag'
" ---> files on which to activate tags auto-closing <---
  let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue,*.phtml,*.js,*.jsx,*.coffee,*.erb'
" ---> closing braces and brackets <---
Plug 'jiangmiao/auto-pairs'
"}}

"{{ Git integration
" ---> git commands within vim <---
Plug 'tpope/vim-fugitive'
" ---> git changes on the gutter <---
Plug 'airblade/vim-gitgutter'
" ---> nerdtree git changes <---
Plug 'Xuyuanp/nerdtree-git-plugin'
"}}

"{{ TMux - Vim integration
Plug 'christoomey/vim-tmux-navigator'
"}}
"neoformat and prettier work together. to run prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'branch': 'release/0.x'
  \ }


"Themes for vim
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'embark-theme/vim', { 'as': 'embark' } " ayo this is actually really nice
Plug 'pineapplegiant/spaceduck' "literally duck this is so cool
Plug 'connorholyday/vim-snazzy' "looks clean ash
Plug 'edersonferreira/dalton-vim'
Plug 'ciaranm/inkpot'
Plug 'aonemd/kuroi.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'cormacrelf/vim-colors-github' "github styled colorscheme
Plug 'tomasr/molokai'
Plug 'tomasiser/vim-code-dark'
Plug 'ldelossa/vimdark'
Plug 'AhmedAbdulrahman/vim-aylin'
Plug 'andreasvc/vim-256noir' "minimal colorscheme
Plug 'davidosomething/vim-colors-meh'
Plug 'nikolvs/vim-sunbather'

call plug#end()

"CtrlP stuff

let g:ctrlp_map = '<C-p>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"===========================


let g:indentLine_char = '┆'
let g:indentLine_leadingSpaceChar = '·'

""VIM FZF config: fzf =====================================
" Use same colors for FZF as current theme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Tell FZF to use RG - so we can skip .gitignore files even if not using
" :GitFiles search
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden -g "!{node_modules,.git}" '
nmap <silent> fj :Files<CR>
let g:fzf_layout = { 'down': '10' }


" open startify on entry
 autocmd VimEnter *
                 \   if !argc()
                 \ |   Startify
                 "\ |   NERDTree
                 \ |   wincmd w
                 \ | endif


"==========================================================================
" vim markdown preview config
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1

"lightline CONFIG
set laststatus=2
set noshowmode " removes insert word  below status bar
" config for like the contents of the stauts bar
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['gitbranch', 'readonly', 'filename', 'textonbar','%:p:h' ] ],
      \    'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'filetype'] ]
      \ },
      \ 'component': {
      \   'textonbar': 'B) ඞ  '
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
        \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \  }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
"===========================================================================

"coc extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-python',
  \ 'coc-explorer',
  \]

nmap <leader>e <Cmd>CocCommand explorer<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
inoremap <silent>expr>< <cr pumvisible() ? coc#_select_confirm()
  \: "\"C-g<u\>CR<\>c-r<=coc#on_enter()\<>CR"">>"


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


"===========================================================================

set background=dark
colorscheme sunbather 

"======stuff for nerdtree====================================================
map <C-n> :NERDTreeToggle %<CR>
let NERDTreeShowBookmarks = 1   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinPos = "left"     " Panel opens on the left side
let NERDTreeWinSize = 23        " Set panel width to 31 columns
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']
"autocmd VimEnter * NERDTree  "open nerdtree on start

let g:NERDTreeGitStatusWithFlags = 1

" sync open file with NERDTree
" " Check if NERDTree is open or active
"function! IsNERDTreeOpen()
"  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction
"
"" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
"" file, and we're not in vimdiff
"function! SyncTree()
"  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"    NERDTreeFind
"    wincmd p
"  endif
"endfunction
"
"" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif



"==========================================================================

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"  if (has("termguicolors"))
"  endif
"endif
"=========================================================================

" terminal 256 colors
set termguicolors


