"Installed Packages:
" Rainbow Parentheses: https://code.google.com/p/vim-scripts/wiki/RainbowParenthsisBundle 
" PowerShell Syntax: http://www.vim.org/scripts/script.php?script_id=1327
" NOT ANY MORE - Fugitive Git Wrapper: http://www.vim.org/scripts/script.php?script_id=2975
" NOT ANY MORE - Yankring: http://www.vim.org/scripts/script.php?script_id=1234
" Vim Commentary: https://github.com/tpope/vim-commentary (to comment stuff out)
" NerdTree: https://github.com/scrooloose/nerdtree (to browse filesystem)
" NOT ANY MORE - Vimproc: https://github.com/Shougo/vimproc.vim (for interactive console apps inside vim)
" Vim Asterisk: https://github.com/haya14busa/vim-asterisk (Advanced search behavior)

"My own scripts which should be provided:
"	after/syntax/ps1.vim -- Adds SQL syntax highlighting to Powershell @" strings.


" Always set nocompatible first. It uses Vim (rather than Vi) settings!
" Side effects include changing other options, so use this before everything else.
set nocompatible

" Need this to get encoding to work right on Windows.
set encoding=utf-8

" Make sure I have a convenient leader key
" This needs to occur before any mappings which depend on <Leader>
let mapleader = ' '

""""""""""""""""""""""
"" External Modules
""""""""""""""""""""""

"### SETTINGS ###"

"Database Configs (for DbExt) - Must be before Pathogen
"    source $VIM/_dbext_settings.vim

    " Use <Space>d instead of <Space>s for database stuff
    let g:dbext_map_prefix='<Leader>d'

    " Rainbow parentheses
    let g:rainbow_active = 1

    " Configure slimv
    let g:paredit_leader = ','
    let g:slimv_leader = ','


"### LOAD PLUGINS ###"
    "Pathogen package manager for Vim https://github.com/tpope/vim-pathogen
    execute pathogen#infect()

    packadd! matchit

""""""""""""""""""""""""""""""""""
" Visual/Aesthetic Configuration "
""""""""""""""""""""""""""""""""""

" Font - Open Source DejaVu Sans Mono font
set guifont=DejaVu_Sans_Mono:h12:cANSI

"Don't start on the welcome screen
set shortmess+=I

"Highlight the line that the cursor is on
set cursorline

"Allow many, many tabs if desired with -p option
set tabpagemax=150

"Always show cursor position
set ruler

"Always indicate matching brackets for cursor
set showmatch

"Always show incomplete commands (e.g., show <C-w> when starting a window cmd)
set showcmd

"More useful display of long lines at the end of windows
set display+=lastline

"Syntax coloring
syntax on

"Search highlighting
set hlsearch
"Initially clear it
nohl

"Status line configuration
:set statusline=%<%f\ %h%m%r\ %{&fileencoding?&fileencoding:&encoding}%=\ %{VimBuddy()}\ \ %-14.(%l,%c%V%)\ %P

"Display line numbers
set number

"Disable beeping & flashing 
"See help visual bell
set noerrorbells
set novisualbell
set vb t_vb=

"Always show a status line for all windows
set laststatus=2

"More friendly wrapping (only on spaces)
set linebreak

""""""""""""""""""""""""""""""""
" User Interface Configuration "
""""""""""""""""""""""""""""""""
"
" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

"Uses the clipboard register instead of the unnamed register
"This means that yank, put, etc. will function directly on
"the clipboard, saving typing with the common operation.
"Note: We may wish to disable this later, some people find it more annoying.
"NOTE: This is disabled because it turns out I frequently copy then overwrite
"      the clipboard register by mistake when this is enabled.
"set clipboard+=unnamed

"Initial setting for scrolloff to keep cursor centered on screen. There is a
"mapping later to <F3> which will toggle this.
set scrolloff=27


"When in visual mode, always include the item under the cursor
set selection=inclusive

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Incremental searching, e.g., search while typing for / command
set incsearch

"When joining formatted lines, delete the comment character
set formatoptions+=j 

"Be sure to let us know when a file is changed externally
set autoread

"Enable the mouse in any terminal that supports it
if has('mouse')
    set mouse=a

    " Disable the mouse for cursor positioning
    " This is useful because when clicking back into Vim from another
    " application, I rarely want to move the cursor with it.
    " Note: Did not disable in Visual, to allow cursor-based selection.
    ":nmap <LeftMouse> <nop>
    ":imap <LeftMouse> <nop>
    :map <Leftmouse> <nop>
    :map <2-LeftMouse> <nop>
    :map <3-LeftMouse> <nop>
    :map <4-LeftMouse> <nop>
    :map <Rightmouse> <nop>
    :map <2-RightMouse> <nop>
    :map <3-RightMouse> <nop>
    :map <4-RightMouse> <nop>
endif

"Enable much better completion within command mode. (e.g., :-commands)
set wildmode=longest:full,full wildmenu

"Enable being able to switch between unsaved buffers
"Much more friendly when editing multiple files simultaneously.
set hidden

"No timeout for partial multi-key sequences
"This lets me think about what I'm doing at any point while entering a command
set nottimeout

"Choose a folding method
set foldmethod=manual

"Tab->spaces at start of line (and appropriate backspace action)
"But regular tab elsewhere
set smarttab

" The following options are used for handling Windows text files
" appropriately, useful mostly in Windows:
if has("win32")
    set ffs=dos,unix " Correct specification of line endings
    set ff=dos " Default to using DOS line endings when writing
    setglobal fileencodings^=ucs-bom "Powershell uses UTF-16 with a BOM (or UTF-8 with a BOM); this detects byte order
endif

"GUI options: Disable mouse, menus, and all other clutter.
if has("gui_running")
    "Disable toolbar, it doesn't do anything but occupy screen real estate
    set guioptions-=T

    "No tear-off menu items; just leave them as menus.
    set guioptions-=t

    "No menu bar at all, actually. I never use it.
    set guioptions-=m

    "Remove right hand scrollbar and left hand toggling scrollbar
    "This both makes more screen real estate available, and prevents buggy
    "resizing behavior in the event that these appear and/or disappear.
    set guioptions-=rL
endif

"Indentation Customization See Vim.Wikia.Com/Wiki/VimTip83 for more details
set expandtab "Spaces instead of hard tabs (important since not everyone here uses a decent editor)
set softtabstop=4 "Spaces to insert
set tabstop=4 "Display 4 spaces per tab (not written to buffer by default)
set shiftwidth=4 "Spaces to insert for >>, <<, or == commands and auto indentation

"Indenting comments correctly
set nosmartindent 
set cindent
set cinkeys-=0#
set indentkeys-=0#

" Don't unindent when closing parentheses in any filetype
set cinoptions=")0"


"Prevent automatic insertion of linebreaks
set textwidth=0
set wrapmargin=0
set linebreak
set nolist
set formatoptions-=tc

" Searching should not wrap around automatically
set nowrapscan

"""""""""""""""""""""""""""""""""
" Back-End/Memory Configuration "
"""""""""""""""""""""""""""""""""

"Enable filetype detection
"Uses default settings so mail gets 'tw' to 72, 'cindent' for c files, etc.
"Also load indent files, to auto lang-dependent indenting
filetype plugin indent on

"Set a very long history (max)
set history=10000

"Stop writing those annoying ~ files.
set nobackup
set nowritebackup
set noswapfile

"No octal numbers, it can be inadvertently confusing and is almost never
"useful in the sort of code I write.
set nrformats-=octal


"SQL type for highlighting TQSL correctly
let g:sql_type_default = 'sqlanywhere'



""""""""""""""""""""""""
" Function Definitions "
""""""""""""""""""""""""



"Version from http://superuser.com/questions/697847/cant-run-vimdiff-7-4-on-windows-7
"Was relevant for earlier versions of Vim official distribution
" if has("win32")
"  function! MyDiff()
"    let opt = '-a --binary '
"    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"    let arg1 = v:fname_in
"    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"    let arg2 = v:fname_new
"    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"    let arg3 = v:fname_out
"    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"    if $VIMRUNTIME =~ ' '
"      if &sh =~ '\<cmd'
"        if empty(&shellxquote)
"          let l:shxq_sav = ''
"          set shellxquote&
"        endif
"        let cmd = '"' . $VIMRUNTIME . '\diff"'
"      else
"        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"      endif
"    else
"      let cmd = $VIMRUNTIME . '\diff'
"    endif
"    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"    if exists('l:shxq_sav')
"      let &shellxquote=l:shxq_sav
"    endif
"  endfunction
" endif


" Function to create a comment box around lines of text
" chr = Box character ('#', '-', ';' etc.) for box frame
" lns = Comment starter - middle line starts and ends with this - can be longer than one char
" ul, ur, ll, lr = 2-char strings to use at corners, including start char
function! CreateCommentBox(chr,lns,lne,ul,ur,ll,lr) range
    " All lines in range
    let l:lines = getline(a:firstline, a:lastline)

    " Get maximum length of any line in range
    let l:maxlnlen = 0
    for l:ln in l:lines
        if len(l:ln) > l:maxlnlen
            let l:maxlnlen = len(l:ln)
        endif
    endfor

    " Extra length of top and bottom lines in case line start and end are longer than 1 char each
    let l:ln_xtra_len = strlen(a:lns) + strlen(a:lne) - 2

    " Construct list of output lines
    let l:outln = []

    " Start line (upper corners and middle character)
    let l:start_line = a:ul  . repeat(a:chr, l:maxlnlen + l:ln_xtra_len) . a:ur
    call add(l:outln, l:start_line)

    " Middle lines (start and end sequence and padding spaces)
    for l:ln in l:lines
        let l:ln_fin = a:lns . " " . l:ln . " " . repeat(" ", l:maxlnlen - len(l:ln)) . a:lne
        call add(l:outln, l:ln_fin)
    endfor

    " End line (lower corners and middle character)
    let l:end_line   = a:ll  . repeat(a:chr, l:maxlnlen + l:ln_xtra_len) . a:lr
    call add(l:outln, l:end_line)

    " Outut lines to buffer
    execute a:firstline . "," . a:lastline . "delete"
    call append(a:firstline - 1, l:outln)

    " Move cursor to sensible final spot
    execute "normal " . (a:firstline + len(l:outln) - 1) . "G"
endfunction
" Specific configurations of the above
function! CreatePSBox() " Powershell
    call CreateCommentBox('#','##','##','##','##','##','##') 
endfunction
function! CreateSQLBox() " SQL - Dashes
    call CreateCommentBox('-','--','--','--','--','--','--') 
endfunction
function! CreateSQLFancyBox()  " SQL - Fancy
    call CreateCommentBox('=','||','||','/*','*\','\*','*/') 
endfunction
function! CreateVimBox() " VIM scripts
    call CreateCommentBox('"','""','""','""','""','""','""')
endfunction


" Insert cn spaces at the beginning of the line, cursor is left on last line
function! AddSpaces(cn) range
    " Save search state
    let sv_srch=&hlsearch
    let sv_sl=getreg(@/)
    let sv_slst=getregtype(@/)
    execute "silent ".a:firstline.",".a:lastline."s/^/\\=repeat(\" \"," . a:cn . ")/ge"
    " Restore search state
    let &hlsearch=sv_srch
    call setreg("/",sv_sl,sv_slst)
endfunction

" Delete cn spaces at the beginning of the line, cursor is left on last line
function! DelSpaces(cn) range
    " Save search state
    let sv_srch=&hlsearch
    let sv_sl=getreg(@/)
    let sv_slst=getregtype(@/)
    execute "silent ".a:firstline.",".a:lastline."s/^ \{".a:cn."\}//ge"
    " Restore search state
    let &hlsearch=sv_srch
    call setreg("/",sv_sl,sv_slst)
endfunction


" Toggle font size between 10 and 12 point
function! ToggleFontSize()
    if !exists('g:jm_default_font')
        let g:jm_default_font = 0
    endif
    
    if g:jm_default_font == 1
        set guifont=DejaVu_Sans_Mono:h12:cANSI
        let g:jm_default_font = 0
    else
        set guifont=DejaVu_Sans_Mono:h10:cANSI
        let g:jm_default_font = 1
    endif
endfunction




""""""""""""
" AutoCMDs "
""""""""""""
"Auto save and load views. 
"Among other things, this saves the folds I create in a file for the next time
"I load it.
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

"Leave insert mode on alt-tab etc.
"This prevents accidentally starting to type once I'm back in VIM.
"It's a much more consistent behavior that doesn't rely on my memory.
autocmd FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")

"Prevent swap files from flowing all over the place
autocmd BufReadPost *.* set noswapfile

"Maximize window on startup (only for Windows)
if has("win32")
    au GUIEnter * simalt ~x
endif

"Enable omni-completion for powershell and other syntaxes
autocmd Filetype *
    \ if &omnifunc == "" |
    \   setlocal omnifunc=syntaxcomplete#Complete |
    \ endif

"This prevents misbehaved plugins from screwing with text wrapping
autocmd FileType text setlocal textwidth=0

"Restore cursor position when editing a file
"Don't do it for invalid positions or inside event handler
"also don't re-do default position when opening new file (e.g., first line)
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif




""""""""""""""""
" Key bindings "
""""""""""""""""

"Toggle word wrapping
map <F2> :set wrap!<CR>

"Keep cursor centered for this buffer
" 27 comes from the maximum number of lines on my screen divided by 2.
" This has been edited to toggle between 27 and 0 (or back to 0 if some other
" value is put in).
"nnoremap <F3> :set scrolloff=27<CR>
nnoremap <F3> :if &scrolloff == 0\|set scrolloff=27\|else\|set scrolloff=0 \|endif<CR>

"Quickly view and switch buffers
nnoremap <F4> :buffers<CR>:buffer<Space>

"Toggle spelling with F5.
"Remember that in a syntax file, spelling can always be enabled by
"adding @spell to any contains= parameter. 
nnoremap <F5> :set spell!<CR>

"Quickly reload a file with visible ^M's (e.g., mixed line endings) in DOS
"mode. An autocmd may be better (?) but this works well enough for now.
nnoremap <F6> :e ++ff=dos<CR>

"Toggle font size between 10 and 12pt (for different monitor resolutions, or to have more screen real estate)
nnoremap <F12> :call ToggleFontSize()<CR>

"Resynchronize syntax
nnoremap <C-d> :syntax sync fromstart<CR>

"Creates a box around comments in PowerShell or Perl (or any other #-comment
"language)
map <C-F1> :call CreatePSBox()<CR>
map <C-F2> :call CreateSQLBox()<CR>

"Clear highlight with ctrl-l
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

"Don't use Ex mode, use Q for formatting
" --- Disabled to learn it well ----
"map Q gq

" CTRL-U in insert mode is problematic. Use CTRL-G u to first break undo
" so that you can undo CTRL-U after inserting line break.
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" CTRL-P to insert the current yank in a line below this one
map :normal o<ESC>P

" CTRL-Z will zap (delete) all occurrences of selected text in the buffer.
" beware of regex magic though.
map <C-z> y:%s/<C-r>"//g


" Some mappings for easier window movement
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>h <C-W>h
map <Leader>l <C-W>l


" Use CTRL-Q to do what CTRL-V used to do
" This is present mostly as a force of habit for me.
noremap <C-Q>		<C-V>


" Set CWD to current directory of open buffer
map <Leader>cd :cd %:p:h<cr>:pwd<cr>

" Quickly erase the first word on lines
map <Leader>bl :s/^\(\w\+\)/\=repeat(' ',strlen(submatch(1)))/<CR>

" Insert count spaces at beginning of line(s)
nmap <Leader>s :<C-U>call AddSpaces(v:count1)<CR>
vmap <Leader>s :call AddSpaces(v:count1)<CR>
" Additional mapping to disambiguate in a hurry, due to other mappings starting with <Space>s
nmap <Leader>ss :<C-U>call AddSpaces(v:count1)<CR>
vmap <Leader>ss :call AddSpaces(v:count1)<CR>

" Delete <count> spaces at the beginning of line(s)
nmap <Leader>S :<C-U>call DelSpaces(v:count1)<CR>
vmap <Leader>S :call DelSpaces(v:count1)<CR>

" Toggle undo tree
nnoremap U :UndotreeToggle<CR>

"Used for Vim-Asterisk plugin
" https://github.com/haya14busa/vim-asterisk
map ]   <Plug>(asterisk-*)
map [   <Plug>(asterisk-#)
map g]  <Plug>(asterisk-g*)
map g[  <Plug>(asterisk-g#)
map z]  <Plug>(asterisk-z*)
map z[  <Plug>(asterisk-z#)
map gz[ <Plug>(asterisk-gz#) 
map gz] <Plug>(asterisk-gz*)

" Restore a couple of commands wiped out by the above
nnoremap [s [s
nnoremap ]s ]s

" Toggle virtual edit
nnoremap <Leader>v :if &ve==""\|set ve=all\|echo "VirtualEdit ON"\|else\|set ve=\|echo "VirtualEdit OFF"\|endif<CR>
nnoremap c. cl
      


if has("user_commands")
    "Some mappings to fix common capitalization errors in ex commands
    "Thanks to http://blog.sanctum.geek.nz/vim-command-typos/ for the idea
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
    command! -bang Bw bw<bang>
    "
    "Convenient command to see the difference between current buffer and original
    "file (e.g., any changes you made). Only define when not defined already.
    if !exists(":DiffOrig")
        command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
            \ | wincmd p | diffthis
    endif

    "Save some typing when writing and wiping a buffer
    command! -bang -nargs=? -complete=file Wbw w<bang> <args>|bw

    "Format XML
    command! FormatXML % !C:\Users\jmudge\Desktop\Tools\Exe\xmllint.exe "%" --format

endif




