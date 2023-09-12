#!/bin/sh

echo "Downloading wikitionary dump"
wget https://dumps.wikimedia.org/dewiktionary/latest/dewiktionary-latest-pages-articles.xml.bz2
echo "Extracting words"
cat dewiktionary-latest-pages-articles.xml | rg -o --multiline "== .* (.*)==\n===.*===" > all_words_grepd.txt

echo "Extracting gender mappings"
python extract_gender_mappings.py
