#!/bin/bash

#./remove_pattern_range.sh file title "leave_latex"
jq '.metadata.pj_metadata = {
  "author": "Mathias Green",
  "date": "{{ datetime.now().strftime('\''%Y-%m-%d'\'') }}",
  "output": {
    "general": {
      "input": true
    },
    "html": {
      "code_folding": "show",
      "theme": "cerulean",
      "toc": false
    }
  },
  "title": "'"$2"'"}' notebooks/"$1".ipynb >  modified.ipynb

jupyter nbconvert --to html --template pj modified.ipynb 
	

./remove_pattern_range.sh modified.html " plotly -->" "</script>"  > second.html

if [ "${3}" = "leave_latex" ]; then
    cat second.html > third.html
else
    ./remove_pattern_range.sh second.html MathJax last MathJax > third.html
fi
./remove_pattern_range.sh third.html " jquery-ui" "</script>"  > fourth.html
mkdir -p outputs/"$1"
./remove_pattern_range.sh fourth.html " require -->" "</script>"  > outputs/"$1"/page.html
cp -rf templates/* outputs/"$1"/
rm -rf second.html  third.html  fourth.html modified.html modified.ipynb



