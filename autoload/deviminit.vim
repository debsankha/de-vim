function deviminit#SetUpStuff()
  " highlight group male: red
  highlight german_gender_m term=standout ctermfg=1 ctermbg=11 guifg=#dc322f guibg=#b58900
  " highlight group female: blue
  highlight german_gender_f term=bold cterm=bold ctermfg=18 ctermbg=4 gui=bold
  " highlight group neutral: grey
  highlight german_gender_n term=bold cterm=bold ctermfg=7 ctermbg=19 gui=bold
endfunction
