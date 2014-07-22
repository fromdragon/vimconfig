"""""""""ctags operate""""""""""""""""""

set tags=tags;
set autochdir

"""""""""""""end""""""""""""""

""""""""""""""""""""""""""""""""""""""""
"if has("cscope") 
"set csprg=/usr/bin/cscope 
"set csto=0 
"set cst 
"set csverb 
"set cspc=3 
"add any database in current dir 
"if filereadable("cscope.out") 
"cs add cscope.out 
"else search cscope.out elsewhere 
"else 
"let cscope_file=findfile("cscope.out",".;") 
"	let cscope_pre=matchstr(cscope_file,".*/") 
"if !empty(cscope_file) && filereadable(cscope_file) 
"	exe "cs add" cscope_file cscope_pre 
"endif       
"endif 
"endif
""""""""""""""""""""""""""""""""""""""""

"""""""""""""""auto save session"""""""""""""""""""""""

"autocmd VimLeave * mksession! CljiangSession.vim
nmap \clj :mksession! ~/CljiangSession.vim<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""


filetype on

set nocompatible
set nu

set so=5

syntax on

set autoindent

set smartindent

"制表位
set tabstop=4
set shiftwidth=4


set showmatch

set incsearch

"set nowrapscan  "search no circle


"nmap field
nmap <F9> :Tlist<cr>
"nmap \sh :ConqueTerm bash<cr>
nmap \sh :shell<cr>
"nmap ww <C-w><C-w>
nmap \s5 :10sp<cr>
nmap -- 5<C-w>-
nmap ++ 5<C-w>+
nmap >> 5<C-w>>
nmap << 5<C-w><
"display / hidden line num
nmap <C-n> :set nu!<cr>
" ignore / noignore case
nmap 22 :set ignorecase!<cr>
"search no wrap / wrap
nmap 33 :set wrapscan!<cr>    
"highlight/no highlight search
nmap <C-h> :set hlsearch!<cr>

nmap <S-Left> :bp<cr>
nmap <S-Right> :bn<cr>
nmap <tab> :b#<cr>
nmap BD :bd<cr>
set hidden

nmap <M-Left> gT
nmap <M-Right> gt
nmap { <C-w><C-]><C-w>T
""""""""""""""""""""state line setting"""""""""""""""""""""""""""""""""""""""
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

set statusline=%F%m%r%h%w\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
""""""""""""""""""""end"""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
	let Tlist_Ctags_Cmd = '/usr/bin/ctags'
	let Tlist_Show_One_File = 1          
	let Tlist_Exit_OnlyWindow = 1          
	let Tlist_Use_right_Window = 1        

"""""""""""""""""""""""""""""""
"end tag list
"""""""""""""""""""""""""""""""

""""""lookupfile setting""""""""""


"nmap \lk :LUTags<cr>
"nmap \ll :LUBufs<cr>
"nmap \lw :LUWalk<cr>
"
"let g:LookupFile_MinPatLength = 2      
"
"let g:LookupFile_PreserveLastPattern = 0
"
"let g:LookupFile_PreservePatternHistory = 1   
"
"let g:LookupFile_AlwaysAcceptFirst = 1         
"
"let g:LookupFile_AllowNewFiles = 0 


""""set tag file name"""""""""""
"if filereadable("./filenametags")           
"	let g:LookupFile_TagExpr = '"./filenametags"'
"
"else 
"    let filename_file=findfile("filenametags",".;") 
"if !empty(filename_file) && filereadable(filename_file) 
"    let g:LookupFile_TagExpr = '"'.filename_file.'"'
"endif       
"endif 


"""""""""lookupfile setting end""""""""

""""""""""""""viminfo""""""""""""""""""
"set viminfo+=%10
"""""""""""""""""""""""""""""""""""""""

"""""""""""file mark"""""""""""""""
nmap \mr :marks<cr>
"""""""""""""""""""""""""""""""""""

""""""""""""fuzzyfinder setting""""""""""""

nmap <F5> :FufFileWithFullCwd<CR>
nmap <F4> :FufBuffer<CR>

"""""""""""fuzzyfinder setting end""""""""

""""""""""""""window manager"""""""""""""""
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap \wm :WMToggle<cr>
"""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""FILE EXPLORE""""""""""""""""
nmap \we :Explore<cr>
""""""""""""""""""""""""""""""""""""""""""""

"""""""set underline"""""""""""""""""""""""""""""""
set background=dark
set cursorline "underline
set t_Co=256
colorscheme test
hi CursorLine cterm=bold ctermbg=238
""""""""""""""""""""""""""""""""""""""
" 增强模式中的命令行自动完成操作
set wildmenu


""""""""底行模式补全功能设为仿shell操作，按tab键列出文件"""""""""""""""""""""
set wildmode=longest,list
""""""""""""""""""""""""""""“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”“”

""""""hlyu""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1
""""""""""""""""""""""""""""""""""""""

" system clipboard
vmap <C-y> "+y

"""""""""tab标签只保留文件名""""""""""""""""""""
"function ShortTabLabel ()
"	let bufnrlist = tabpagebuflist (v:lnum)
"	let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
"	let filename = fnamemodify (label, ':t')
"	return filename
"endfunction

"set guitablabel=%{ShortTabLabel()}
"set guitablabel=%F

function MyTabLine()
let s = ''
for i in range(tabpagenr('$'))
	" 选择高亮
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif

		" 设置标签页号 (用于鼠标点击)
		let s .= '%' . (i + 1) . 'T'

		" MyTabLabel() 提供标签
		let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
endfor

" 最后一个标签页之后用 TabLineFill 填充并复位标签页号
let s .= '%#TabLineFill#%T'

" 右对齐用于关闭当前标签页的标签
if tabpagenr('$') > 1
	let s .= '%=%#TabLine#%999X'
endif

return s
endfunction

function MyTabLabel(n)
let buflist = tabpagebuflist(a:n)
let winnr = tabpagewinnr(a:n)
let label = bufname(buflist[winnr - 1])
let filename = fnamemodify (label, ':t')
return filename 
endfunction


set tabline=%!MyTabLine()
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"""""""""""""""""""grep option""""""""""""""""""""
nmap <F6> :Grep<CR><C-u>
let Grep_Skip_Dirs = '.git .repo'
let Grep_Default_Options = '-R' 
let Grep_Default_Filelist = getcwd().'/'
let Grep_Skip_Files='*.o *.bak /*/tags *.out .*.swp'
let Grep_Shell_Quote_Char=""""
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""gvim option"""""""""""""""""""""
"hide gvim toolbar
set guioptions-=m
set guioptions-=T
""""""""""""""""""""""""""""""""""""""""""""""""""
