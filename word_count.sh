#!/bin/bash

for n in `seq 20 -1 0`; do
    total=0
    m=$(echo "$n - 1"|bc)
    for sha in $(git log --format="%ad %H" --date=iso | sort  | python grep_dates.py $m $n); do
        added=$(git diff --word-diff=porcelain $sha~1..$sha|grep -e"^+[^+]"|wc -w|xargs)
        deleted=$(git diff --word-diff=porcelain $sha~1..$sha|grep -e"^-[^-]"|wc -w|xargs)
        duplicated=$(git diff $sha~1..$sha|grep -e"^+[^+]" -e"^-[^-]"|sed -e's/.//'|sort|uniq -d|wc -w|xargs)
        if [ "$added" -eq "0" ]; then
            changed=$deleted
            total=$((total+deleted))
        elif [ "$(echo "$duplicated/$added > 0.8" | bc -l)" -eq "1" ]; then
            x='1' #do nothing
        else
            changed=$((added+deleted))
            total=$((total+changed))
        fi
    done
    echo "$n days ago, the total words changed was: $total"
done
