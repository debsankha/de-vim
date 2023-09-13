import re
import csv
from pathlib import Path

OUTFILE = "~/nouns_and_genders.csv"

if __name__ == '__main__':

    with open("all_words_grepd.txt", 'r') as f:
        words = f.read()

    german_word_regex = re.compile(r"==\s+\b(.*)\b\s+\(\{\{Sprache\|Deutsch\}\}\)\s+==\n===\s+\{\{Wortart\|Substantiv.*?\}\},\s+\{\{([mfn]{1,3})\}\}.*")
    word_and_genders = re.findall(german_word_regex, words)

    with open(Path(OUTFILE).expanduser(), 'w', newline='') as csvfile:
        writer = csv.writer(csvfile, delimiter=',')
        for w,g in word_and_genders:
            if not (',' in w or ' ' in w):
                writer.writerow([w,g])
    print(f"Wrote gender mappings to {OUTFILE}")
