#!/bin/bash


if [ "${3}" = "last" ]; then
    start=$(cat "${1}" | grep -sin  "${2}" | head -n1  | cut -d: -f1)
    end=$(cat "${1}" | tail -n "+${start}" | grep -sin "$4" | tail -n 1 | cut -d: -f1)
    end=$(($start+$end))
    sed "${start},${end}d" $1
else
    start=$(cat "${1}" | grep -sin  "${2}" | head -n1  | cut -d: -f1)
    end=$(cat "${1}" | tail -n "+${start}" | grep -sin "$3" | head -n 1 | cut -d: -f1)
    end=$(($start+$end))
    sed "${start},${end}d" $1
fi


#./remove_pattern_range.sh file start_pattern ["last"] end_pattern
#./remove_pattern_range.sh asymetric_crypto.html MathJax last MathJax > b.html
