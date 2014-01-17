set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle

  call neobundle#rc(expand('~/.vim/bundle'))
endif

"色制限解除
set t_Co=256

NeoBundle 'git://github.com/Rip-Rip/clang_complete'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
"NeoBundle 'https://github.com/altercation/solarized.git'
NeoBundle 'https://github.com/altercation/vim-colors-solarized.git'
let g:solarized_termcolors=256
NeoBundle 'https://github.com/fugalh/desert.vim.git'
NeoBundle 'git://github.com/nanotech/jellybeans.vim'
let g:jellybeans_use_lowcolor_black = 0

NeoBundle 'git://github.com/w0ng/vim-hybrid.git'
NeoBundle 'git://gist.github.com/3278077.git'
NeoBundle 'git://github.com/ujihisa/unite-colorscheme'
let g:hybrid_use_Xresources = 1

NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/tomasr/molokai.git'
NeoBundle 'git://github.com/itchyny/lightline.vim'
NeoBundle 'git://github.com/cocopon/lightline-hybrid.vim'
let g:lightline ={}
let g:lightline.colorscheme = 'hybrid'
let g:lightline_hybrid_style = 'plain'

NeoBundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_quiet_messages= {'level': 'warnings'}

let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1
let g:syntastic_php_php_args = '-l'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

if has("lua")
  NeoBundleLazy 'Shougo/neocomplete', { 'autoload' : {
        \   'insert' : 1,
        \ }}
endif

NeoBundleLazy 'Shougo/neosnippet', {
      \ 'autoload' : {
      \   'commands' : ['NeoSnippetEdit', 'NeoSnippetSource'],
      \   'filetypes' : 'snippet',
      \   'insert' : 1,
      \   'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
      \ }}

NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}

NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}

NeoBundleLazy 'edsono/vim-matchit', { 'autoload' : {
      \ 'filetypes': 'ruby',
      \ 'mappings' : ['nx', '%'] }}

NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}

NeoBundleLazy 'alpaca-tc/neorspec.vim', {
      \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
      \ 'autoload' : {
      \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
      \ }}

NeoBundleLazy 'alpaca-tc/alpaca_tags', {
      \ 'depends': 'Shougo/vimproc',
      \ 'autoload' : {
      \   'commands': ['TagsUpdate', 'TagsSet', 'TagsBundle']
      \ }}

NeoBundleLazy 'tsukkee/unite-tag', {
      \ 'depends' : ['Shougo/unite.vim'],
      \ 'autoload' : {
      \   'unite_sources' : ['tag', 'tag/file', 'tag/include']
      \ }}


NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
" non github repos
NeoBundle 'https://github.com/wincent/Command-T.git'

NeoBundle 'vim-scripts/javacomplete'
autocmd FileType java :setlocal ownifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo

NeoBundle 'https://github.com/thinca/vim-ref.git'


filetype plugin on
filetype indent on

"color setting
syntax enable

"if has('gui_running')
"    set background=light
"else
    set background=dark
"endif

"colorscheme solarized
colorscheme hybrid

"other setting

"行表示
set number

"カーソル行表示
set cursorline

"アンダーラインを引く
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

"アンダーラインを引く
highlight CursorLine gui=underline guifg=NONE guibg=NONE


"デフォルトのtabや改行がみえると邪魔なので工夫
"ここから

"改行タブがみえる
set list

highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", ' +$')

" 行頭のTAB文字を可視化
highlight TabString ctermbg=red guibg=red
au BufWinEnter * let w:m2 = matchadd("TabString", '^\t+')
au WinEnter * let w:m2 = matchadd("TabString", '^\t+')

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

"ここまで

"タブをタブとして扱う
"set noexpandtab
set expandtab

"タブ表示幅
set tabstop=4

"タブ挿入幅
set shiftwidth=4

"タブをおした時の空白の数0の場合はtabstop(ts)に依存
set softtabstop=0

"paste
set pastetoggle=<C-E>

"インクリメンタルサーチ
set incsearch

"コマンドモードで補完
set wildmenu wildmode=list:full

"others
"ファイルタイプを指定
"set filetype=javascript
"改行コードを変える
"set fileformat=unix
"change encoding.
"set fileencoding=utf-8



"コメントの色を変える
hi Comment ctermfg=2

source $VIMRUNTIME/macros/matchit.vim
let b:match_words = '<:>,<div.*>:</div>'

"keybind
:nnoremap ,ev :tabnew $HOME/.vimrc<CR>
:nnoremap ,rv :source $HOME/.vimrc<CR>


"setting
augroup AlpacaTags
	autocmd!
	if exists(':Tags')
	        autocmd BufWritePost Gemfile TagsBundle
		autocmd BufEnter * TagsSet
 		" 毎回保存と同時更新する場合はコメントを外す
		"     " autocmd BufWritePost * TagsUpdate
	endif
augroup END

"------------------------------------
" neosnippet
"------------------------------------
"neosnippet "{{{
 
" snippetを保存するディレクトリを設定してください
" example
let s:default_snippet = neobundle#get_neobundle_dir() .'/neosnippet/autoload/neosnippet' " 本体に入っているsnippet
let s:my_snippet = '~/.snippet' " 自分のsnippet
let g:neosnippet#snippets_directory = s:my_snippet
let g:neosnippet#snippets_directory = s:default_snippet . ',' .s:my_snippet

imap <silent><C-F>                	<Plug>(neosnippet_expand_or_jump)
inoremap <silent><C-U>            	<ESC>:<C-U>Unite snippet<CR>
nnoremap <silent><Space>e         	:<C-U>NeoSnippetEdit -split<CR>
smap <silent><C-F>                  <Plug>(neosnippet_expand_or_jump)
"xmap <silent>o						<Plug>(neosnippet_register_oneshot_snippet)
"}}}


"for switch.vim
function! s:separate_defenition_to_each_filetypes(ft_dictionary) "{{{
	let result = {}

	for [filetypes, value] in items(a:ft_dictionary)
	    for ft in split(filetypes, ",")
			if !has_key(result, ft)
			    let result[ft] = []
		    endif
	
			call extend(result[ft], copy(value))
		endfor
	endfor

	return result
endfunction "}}}


