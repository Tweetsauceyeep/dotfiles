"autocmd BufWritePre *.js Prettier

"===================Vim Settings==============
" for WEBPACK When using automatic compilation of your code,
" you could run into issues when saving your files.
" Some editors have a "safe write" feature that can potentially
" interfere with recompilation. "https://webpack.js.org/guides/development/"
" test if symlink works bro - IT WORK DOE
set nocompatible
" removes insert word  below status bar
set noshowmode

set backspace=indent,eol,start  " more powerful backspacing

" Default Vim config + remaps
"mac copy pasting
vnoremap \y y:call system("pbcopy", getreg("\""))<CR>
nnoremap \p :call setreg("\"", system("pbpaste"))<CR>p
verbose imap <Tab> "hopefully this makes tabbing work in vimwiki
noremap YY "+y<CR>
noremap LP "+gP<CR>
noremap XX "+x<CR>
inoremap jk <esc> 
let mapleader = " " "leader is space bar
nnoremap <leader>r :w<CR>: !node %<CR>
nnoremap <F2> :NERDTree<CR>
" Prettier remap
map <leader>p :Prettier<CR> 

map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>


set backupcopy=yes "for vim

set encoding=UTF-8
filetype off
set showmatch "bracket pair highlighting

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" supposed to be 300
set updatetime=30

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
set tabstop=2
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
""""
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
"Plug 'justinmk/vim-sneak' "missing movement in vim (use s{char}{char} to look for stuff)
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vimwiki/vimwiki'
Plug 'alvan/vim-closetag'
Plug 'ctrlpvim/ctrlp.vim'
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
"{{ TMux - Vim integration
Plug 'christoomey/vim-tmux-navigator'
"}}
"neoformat and prettier work together. to run prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'branch': 'release/0.x'
  \ }

"<-------Themes for vim---------> 
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'embark-theme/vim', { 'as': 'embark' } " ayo this is actually really nice
"#Plug 'pineapplegiant/spaceduck' "literally duck this is so cool
"Plug 'connorholyday/vim-snazzy' "looks clean ash
Plug 'arcticicestudio/nord-vim'
Plug 'edersonferreira/dalton-vim'
"Plug 'ciaranm/inkpot'
"Plug 'aonemd/kuroi.vim'
"Plug 'liuchengxu/space-vim-dark'
"Plug 'cormacrelf/vim-colors-github' "github styled colorscheme
"Plug 'tomasiser/vim-code-dark'
"Plug 'ldelossa/vimdark'
"Plug 'AhmedAbdulrahman/vim-aylin'
Plug 'andreasvc/vim-256noir' "minimal colorscheme
"Plug 'davidosomething/vim-colors-meh'
"Plug 'nikolvs/vim-sunbather'

call plug#end()

set relativenumber

"============== BASE 16 STUFF ADDED 10-30-22 ============================
"if exists('$BASE16_THEME')
"      \ && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
"    let base16colorspace=256
"    colorscheme base16-$BASE16_THEME
"endif


"CtrlP config
let g:ctrlp_map = '<C-p>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"===========================


let g:indentLine_char = '┆'
let g:indentLine_leadingSpaceChar = '·'

" FZF config: fzf 
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

" VIMWIKI
let g:vimwiki_list = [{'path': '~/obsidian-notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

function! VimwikiLinkHandler(link)
    if a:link =~ '\.\(pdf\|jpg\|jpeg\|png\|gif\)$'
        call vimwiki#base#open_link(':e ', 'file:'.a:link)
        return 1
    endif
    return 0
endfunction


" Tell FZF to use RG - so we can skip .gitignore files even if not using
" :GitFiles search
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden -g "!{node_modules,.git}" '
nmap <silent> fj :Files<CR>
nmap <silent> <leader>f :Rg<CR>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
"With the above, every time we invoke Rg, FZF + ripgrep will not consider filename as a match in Vim.
let g:fzf_layout = { 'down': '10' }


" open startify on entry
 autocmd VimEnter *
                 \   if !argc()
                 \ |   Startify
                 \ |   wincmd w
                 \ | endif


"==========================================================================
"lightline CONFIG
set laststatus=2
" config for like the contents of the stauts bar
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             ['gitbranch', 'readonly', 'filename', 'textonbar','%:p:h' ] ],
      \    'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'filetype'] ]
      \ },
      \ 'component': {
      \   'textonbar': ' '
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
colorscheme nord
hi Normal ctermbg=NONE guibg=NONE
" code belows set default for git gutter colors
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

" terminal 256 colors
set termguicolors
" FOR SOME ALACRITTY SHIT
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

