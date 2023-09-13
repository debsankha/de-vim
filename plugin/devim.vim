let s:german_gender_list_filepath = "nouns_and_genders.csv"

function! ReadGermanGenderMappings()
  let genderdict = {}
  let genderfilepath = fnamemodify('~', ':p') . s:german_gender_list_filepath
  for line in readfile(genderfilepath)
    let [noun, gender] = split(line, ",")
    let genderdict[noun]=gender[:1] " only first letter is relevant
  endfor
  return genderdict
endfunction


function! GermanGenderHighlightInit()
  let b:german_gender_mappings = ReadGermanGenderMappings()
  let b:german_gender_mapping_highlight_set=0
endfunction

function! GermanGenderHighlightCurrentWord()
  let [lineno, wordbegin]=searchpos("\\<", "bn")
  let [lineno, wordend]=searchpos("\\>", "n")
  let gender = b:german_gender_mappings[expand("<cword>")]

  if gender == 'm'
    let matchgrp = "german_gender_m"
  elseif gender == 'f'
    let matchgrp = "german_gender_f"
  else
    let matchgrp = "german_gender_n"
  endif
  let b:german_gender_current_highlight = matchaddpos(matchgrp, [[lineno, wordbegin, wordend-wordbegin]])
endfunction

function! GermanGenderSetOrDeleteHighLight()
  call deviminit#SetUpStuff()
  if b:german_gender_mapping_highlight_set==1
    call matchdelete(b:german_gender_current_highlight)
    let b:german_gender_mapping_highlight_set=0
  else
    call GermanGenderHighlightCurrentWord()
    let b:german_gender_mapping_highlight_set=1
  endif
endfunction


call GermanGenderHighlightInit()
let g:key_german_gender_trigger = 'g'
execute 'map <Leader>' . g:key_german_gender_trigger . ' :call GermanGenderSetOrDeleteHighLight()<CR>'
