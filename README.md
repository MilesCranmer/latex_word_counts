# latex_word_counts
Scripts to help track progress in overleaf/sharelatex documents


## How to use:

1. Put "update_gits.sh" in the directory where you hold all your overleaf git repos. Add it to a cronjob to regularly update all the git repos and force overleaf to commit regularly.
2. Run "word_count.sh" inside a git repo (with "grep_dates.py" in the same directory) to see the word count over the last 20 days.
