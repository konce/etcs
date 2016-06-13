" =======================================
" plugin section begins
" =======================================
" <vundle> ------------------------
" https://github.com/gmarik/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
" autoclose与neocomplete有一处不兼容的问题，插入模式下如果有补全窗口时，需要按两次esc才能回到插入模式。用auto-pairs则ok
" Plugin 'Townk/vim-autoclose'
Plugin 'jiangmiao/auto-pairs'
Plugin 'pangloss/vim-javascript'
" Plugin 'gabrielelana/vim-markdown'
Plugin 'vim-scripts/SyntaxRange'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'othree/html5.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'wavded/vim-stylus'
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'vim-scripts/matchit.zip'

Plugin 'zoubin/vim-git'
" let g:tabstop_alternatives = [2, 4]
" Plugin 'zoubin/vim-tabstop'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Put your non-Plugin stuff after this line
" ------------------------ </vundle>

" <vim-git> ------------------------
" Plugin 'zoubin/vim-git'
" https://github.com/zoubin/vim-git
noremap <leader>g :call git#BlameRange()<CR>
vnoremap K y:call git#GrepText(getreg('"'))<CR>
nnoremap K :call git#GrepCursorWord()<CR>
nnoremap <C-T> ^<C-W>F
" ------------------------ </vim-git>

" <emmet-vim> ------------------------
let g:user_emmet_leader_key='<leader>t'
" ------------------------ </emmet-vim>

" <auto-pairs> ------------------------
" let g:AutoPairsFlyMode=1
" ------------------------ </auto-pairs>

" <nerdtree> ------------------------
" The NERD tree allows you to explore your filesystem and to open files and directories
" Plugin 'scrooloose/nerdtree'
" open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
" map <leader>n :NERDTreeToggle<CR>
" h NERD_Tree.txt
" https://github.com/scrooloose/nerdtree
" ------------------------ </nerdtree>

" <javascript> ------------------------
" Vastly improved Javascript indentation and syntax support in Vim
" Plugin 'pangloss/vim-javascript'
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
" let javascript_enable_domhtmlcss = 1
" https://github.com/pangloss/vim-javascript
" ------------------------ </javascript>

" <ultisnips> ------------------------
" The ultimate snippet solution for Vim
" Plugin 'SirVer/ultisnips'
" let g:UltiSnipsExpandTrigger="<c-l>"
" let g:UltiSnipsJumpForwardTrigger="<c-l>"
" let g:UltiSnipsJumpBackwardTrigger="<c-q>"
" g:UltiSnipsExpandTrigger               <tab>
" g:UltiSnipsListSnippets                <c-tab>
" g:UltiSnipsJumpForwardTrigger          <c-j>
" g:UltiSnipsJumpBackwardTrigger         <c-k>
" 默认在.vim/UltiSnips目录下添加。见g:UltiSnipsSnippetDirectories
" https://github.com/SirVer/ultisnips
" ------------------------ </ultisnips>

" <ultisnippets> ------------------------
" vim-snipmate default snippets (Previously snipmate-snippets)
" Plugin 'honza/vim-snippets'
" https://github.com/honza/vim-snippets
" ------------------------ </ultisnippets>

" <neocomplete> ------------------------
" Plugin 'Shougo/neocomplete'
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplete#close_popup() . "\<CR>"
"   " For no inserting <CR> key.
"   "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-l>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" https://github.com/Shougo/neocomplete.vim/
" ------------------------ </neocomplete>

" <neosnippet> ------------------------
" Plugin 'Shougo/neosnippet'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" https://github.com/Shougo/neosnippet.vim
" ------------------------ </neosnippet>

" =======================================
" plugin section ends
" =======================================

" =======================================
" folding section begins
" =======================================
" don't use syntax folding, it could be very slow
set foldmethod=indent
set foldlevelstart=2
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
" =======================================
" folding section ends
" =======================================

" ======================================
" vim theme section begins
" ======================================
" 文件默认编码。支持中文显示。+multi_byte
set enc=utf-8
"文件保存时使用的编码
"fileencoding=utf-8
"打开文件进行解码的猜测列表，优先以utf-8打开
set fileencodings=utf-8,gbk
"文件默认格式unix
set ff=unix

"自动缩进
set autoindent
"显示标签栏 0: 从不 1: 大于1个时显示 2: 总是
set showtabline=2
"鼠标捕捉。设置为v时，可以copy on select
set mouse=v
" h comments
set comments=sl:/*,mb:*,ex:*/
"底部标尺
set ru
"设置制表符、回车、空格的显示
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
" set list
" 光标上下最小保留的屏幕行数
set scrolloff=2
" CTRL-H=BACKSPACE, 删除
set backspace=indent,eol,start
"打开语法高亮
syntax enable
" 当前行背影
set cursorline
"搜索时高亮显示结果
set hls
"输入搜索命令时，显示目前输入的模式的匹配位置
set is
set incsearch
"显示行号
set number
"使用:e命令的时候 可选项预览
set wildmenu

" solarized
set background=dark
if $VIMCOLORSCHEME != ''
    colorscheme $VIMCOLORSCHEME
endif

 " Store swap files in fixed location, not current directory.
 set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" 打开文件时总是跳到最后光标所在的行
autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
" ======================================
" vim theme section ends
" ======================================

" ======================================
" key mapping section begins
" ======================================
" Search for selected text, forwards or backwards.
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
" --------------------------------------
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" 重新载入配置
map <leader>s :source ~/.vimrc<CR>
map <leader>0 :set number!<CR>
map <leader>p :set paste!<CR>

" visual模式修改缩进时不退出该模式
vnoremap < <gv
vnoremap > >gv
" 选中后put时再复制put的内容，需要多次选中替换时有用
vnoremap p pgvy

" 选中put的文本（整行）
nnoremap <leader>v V`]
" 删除行末空格
nnoremap <silent><leader>w :%s/\s\+$//<CR>:let @/=''<CR>
" 切换tab
nnoremap <leader><space> :noh<CR>
nnoremap <C-L> :tabnext<CR>
nnoremap <C-H> :tabprevious<CR>

" 末尾添加分号
nnoremap <leader>a m`A;<esc>``
inoremap <leader>a <esc>m`A;<esc>``a

" 扩展%
noremap g{ f{%
noremap g[ f[%
noremap g( f(%
noremap g} f}%
noremap g] f]%
noremap g) f)%
noremap gb{ F{%
noremap gb[ F[%
noremap gb( F(%
noremap gb} F}%
noremap gb] F]%
noremap gb) F)%

" insert mode shortcut
" 模拟mac编辑方式 deprecated use `CTRL-o {normal command}` instead
"inoremap <C-E> <Esc>A
"inoremap <C-A> <Esc>I
"inoremap <C-J> <Down>
"inoremap <C-K> <Up>
"inoremap <C-B> <Left>
"inoremap <C-F> <Right>
"inoremap <C-D> <DELETE>

" command line edit
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-D> <DELETE>

" ======================================
" key mapping section ends
" ======================================

" ======================================
" use for nerdtree
" ======================================

" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
autocmd VimEnter * NERDTree

" 按下 F2 调出/隐藏 NERDTree
map <F2>  : NERDTreeToggle<CR>

" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1


" ======================================
" use for nerdtree
" ======================================

" ======================================
" use for nerdtree
" ======================================

au BufRead,BufNewFile *.rt set filetype=html
au BufRead,BufNewFile *.hbs set filetype=html
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.ftl set filetype=html
au BufRead,BufNewFile *.less set filetype=css
au BufRead,BufNewFile *.sass set filetype=css
au BufRead,BufNewFile *.cjsx set filetype=javascript
au BufRead,BufNewFile *.json set filetype=javascript

filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

