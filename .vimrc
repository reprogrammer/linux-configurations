filetype plugin indent on
autocmd Filetype java,tex,bib,xml,html,ruby setlocal expandtab | setlocal shiftwidth=2 | setlocal softtabstop=2
set textwidth=80
set ignorecase "Ignore case when searching
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
set spell spelllang=en_us "switches on spell checking
setlocal spell spelllang=en_us "switches on spell checking
color elflord
"http://aspell.net/0.50-doc/man-html/3_Basic.html#SECTION00424000000000000000
map  :w!<CR>:!LOCALWORDS_KEY=LocalWords && LOCALWORDS_FILE=.aspell.en.pws && echo "personal_ws-1.1 en 0" > $LOCALWORDS_FILE && grep "$LOCALWORDS_KEY" % \| sed s/^.*"$LOCALWORDS_KEY".*:" "*// \| sed s/" "/\\n/g \| sort \| uniq >> $LOCALWORDS_FILE && grep -oP "(?<=[0-9]\|{)[a-zA-Z]*\|[a-zA-Z]*(?=[0-9]\|})" % \| sort \| uniq >> $LOCALWORDS_FILE && aspell --personal=./$LOCALWORDS_FILE check % && rm $LOCALWORDS_FILE<CR>:e! %<CR>
