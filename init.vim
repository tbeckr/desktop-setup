call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'preservim/nerdcommenter'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'jason0x43/vim-js-indent'
    Plug 'majutsushi/tagbar'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
    Plug 'arcticicestudio/nord-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'rakr/vim-one'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'lifepillar/vim-solarized8'
    Plug 'ThePrimeagen/vim-be-good', {'do': '.\install.sh'}
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'lynnard/pandoc-preview.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'dracula/vim'
    Plug 'adamclerk/vim-razor'
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'gcmt/taboo.vim' 
call plug#end()



filetype indent on
syntax on

set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set statusline+=%#warningmsg#
set go-=T
set clipboard=unnamedplus
set encoding=utf-8
set hidden
set backspace=indent,eol,start
"set guifont=FiraCode\ NF:h15
"set guifont=FiraMono\ NF:h15



" para funcionar ligatures
set encoding=utf-8

let g:deoplete#enable_at_startup = 1
let mapleader = ','
let maplocalleader = ';'

" python support
let g:python_host_prog = 'C:/Python27/python.exe'
let g:python3_host_prog = 'C:/Python38/python.exe'


" vim-arline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
"let g:airline_theme='dracula' 

if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark
"set background=light
"colorscheme dracula
colorscheme gruvbox

" NerdTre
map <C-o> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode = 2
let g:NERDTreeDirArrowExpandable = ""
let g:NERDTreeDirArrowCollapsible = ""
let g:NERDTreeWinSize = 40

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

"map <C-p> :CtrlP<CR>
"map <leader><C-p> :CtrlPMRU<CR>
"let g:ctrlp_custom_ignore = 'node_modules\|git'

nmap <leader><tab> :FZF<CR>
nmap <leader><tab>n :FZF C:\Dados\Onedrive\Notes\<CR>
nmap <leader>bb :Buffers<CR>

 "Custom mappings
map <F9> :edit ~\AppData\Local\nvim\init.vim<CR>
map <leader><F9> :so ~\AppData\Local\nvim\init.vim<CR>
map <leader>bn :bn<CR>
map <F8> :TagbarToggle<CR>
map <F10> :CocDiagnostics<CR>

set clipboard+=unnamed  " use the clipboards of vim and win
"set paste               " Paste from a windows or from vim
set go+=a               " Visual selection automatically copied to the clipboard

command! Notas NERDTree Notas
map <F2> :NERDTree 

function! PreviewMarkdown()
if &filetype == 'markdown'
   silent !"C:\Program Files (x86)\Calibre2\markdown-calibre.exe" "%" > E:\tmp\md-view.html
   silent !"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -app=E:\tmp\md-view.html 
else
    echo "Não é um arquivo markdown"
endif
endfunction

map <leader>p :call PreviewMarkdown()<CR>

set conceallevel=1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_follow_anchor = 1
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

map <C-h> <C-w><C-h>
map <C-j> <C-w><C-j>
map <C-k> <C-w><C-k>
map <C-l> <C-w><C-l>


set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
set signcolumn=number
else
set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
inoremap <silent><expr> <c-space> coc#refresh()
else
inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
else
call CocAction('doHover')
endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f :call CocAction('format')<CR>

augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nmap <space>w :w<CR>

let g:airline#extensions#tabline#enabled = 1

" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

if has('nvim') && exists('&winblend') && &termguicolors
  set winblend=20

  hi NormalFloat guibg=None
  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif

  if stridx($FZF_DEFAULT_OPTS, '--border') == -1
    let $FZF_DEFAULT_OPTS .= ' --border'
  endif

  function! FloatingFZF()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

let $FZF_DEFAULT_COMMAND='fd --type f'


function! Teste()
    let l:testeOptions = ["quit", "", "teste1", "teste2", "teste3"]
    let l:c=0
    let l:c = confirm("Teste confirm", "&teste\nteste&1\nteste&2\nteste&3")
    let width = float2nr(&columns * 0.4)
    let height = float2nr(&lines * 0.4)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    let l:buf = nvim_create_buf(v:false, v:true)
    call nvim_open_win(l:buf, v:true, opts)
    map <buffer> <CR>  :q<CR>
    set modifiable
    set nonu
    call appendbufline(l:buf, 0, "Testando")
    call appendbufline(l:buf, "$", l:testeOptions[l:c])
    set nomodifiable

endfunction

nnoremap <F3>  :call Teste()<CR> 

function! TogBG()
    let &background = ( &background == "dark"? "light" : "dark" )
    if exists("g:colors_name")
        exe "colorscheme " . g:colors_name
    endif
endfunction

nnoremap <leader>tbg :call TogBG()<CR>

let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#spell#default_langs = ["pt_br", "en_us"]
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#syntax#conceal#use = 1
let g:pandoc#syntax#conceal#urls = 1

nnoremap <leader>ol :only<CR>

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

call rpcnotify(0, 'Gui', 'Font', 'FiraCode Nerd Font', 1)

nnoremap <F4> :Tagbar<CR>
nnoremap <leader>d :OmniSharpDocumentation<CR>
