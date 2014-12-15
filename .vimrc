filetype plugin indent on
autocmd Filetype java,cpp,tex,bib,xml,html,ruby,vim,r,sh setlocal expandtab | setlocal shiftwidth=2 | setlocal softtabstop=2 | syntax on
set textwidth=80
set ignorecase "Ignore case when searching
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
autocmd FileType txt,tex set spell spelllang=en_us "switches on spell checking
autocmd FileType txt,tex setlocal spell spelllang=en_us "switches on spell checking
color ron
"http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
    if part[0] =~ '\v[%#<]'
      let expanded_part = fnameescape(expand(part))
      let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
    endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
"http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_2)#Key_notation
map  :buffers<CR>
autocmd Filetype tex map  :w!<CR>:Shell detex % \| diction -bs<CR>
autocmd Filetype tex map  :w!<CR>:Shell detex % \| java -jar $HOME/apps/LanguageTool/languagetool-commandline.jar -l en<CR>
"http://aspell.net/0.50-doc/man-html/3_Basic.html#SECTION00424000000000000000
map  :w!<CR>:!LOCALWORDS_KEY=LocalWords && LOCALWORDS_FILE=.aspell.en.pws && echo "personal_ws-1.1 en 0" > $LOCALWORDS_FILE && grep "$LOCALWORDS_KEY" % \| sed s/^.*"$LOCALWORDS_KEY".*:" "*// \| sed s/" "/\\n/g \| sort \| uniq >> $LOCALWORDS_FILE && grep -oP "(?<=[0-9]\|{)[a-zA-Z]*\|[a-zA-Z]*(?=[0-9]\|})" % \| sort \| uniq >> $LOCALWORDS_FILE && WORDS_FILE_NAME="local-words.txt" && CURRENT_PATH=$PWD && TARGET_FILE="" && until [[ "`readlink -f $CURRENT_PATH`" == "/" <Bar><Bar> -n "$TARGET_FILE" ]]; do TARGET_FILE=`find "$CURRENT_PATH" -maxdepth 1 -mindepth 1 -iname $WORDS_FILE_NAME`; CURRENT_PATH=$CURRENT_PATH/..; done && if [ -n "$TARGET_FILE" ]; then cat $TARGET_FILE >> $LOCALWORDS_FILE ; fi && aspell --personal=./$LOCALWORDS_FILE check % && rm $LOCALWORDS_FILE<CR>:e! %<CR>
