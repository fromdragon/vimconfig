" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "test"

hi Normal 	ctermbg=236     ctermfg=250   "背景色
hi Comment 	ctermbg=236	    ctermfg=110   "注释
hi CursorLine cterm=bold    ctermbg=238	  "下划线 
hi Constant ctermbg=236		ctermfg=124	  "tab  <include>
hi Visual   ctermbg=240					  "圈选区
hi Title ctermfg=73					  "函数名
hi Statement ctermfg=136				  "语法关键字
hi PreProc   ctermfg=5                    "macro
hi Search 	ctermbg=100                   "highlight 
hi Pmenu     ctermfg=2      ctermbg=8      "关键字补全菜单 
hi PmenuSel  cterm=bold ctermfg=2       ctermbg=234   "关键字补全菜单选中项
hi Search    cterm=bold ctermbg=100 ctermfg=251    "高亮显示
hi Directory ctermfg=12                      "补全的目录

" vim: sw=2
