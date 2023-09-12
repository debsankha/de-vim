Prerequisites
-------------
* `ripgrep`

Installation
------------
Use your favourite plugin manager. If using
[Vundle](https://github.com/VundleVim/Vundle.vim), `.vimrc` needs:
```vimrc
Bundle 'debsankha/de-vim'
```
followed by a `:BundleInstall()` from a vim window.

Download and extract all words from wiktionary dump
---------------------------------------------------
```bash
sh download_and_process_data.sh
```
This should create a csv file with the noun -> gender mappings:
`~/nouns_and_genders.csv`

Using the plugin
----------------
`<leader>g` will highlight the current word under the cursor.

Customizing
-----------
* Changing the keybinding: modify `g:key_german_gender_trigger` in `.vim/bundle/de-vim/plugin/devim.vim`.
* Changing the highlighting: edit `.vim/bundle/de-vim/autoload/deviminit.vim`.

Issues
------
This isjust a PoC. A list of problems:
* Creating the wordlist is not automated.
* The filepath is hardcoded.
* There's no error handling in case a word is not found.

