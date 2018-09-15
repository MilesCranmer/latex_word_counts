import sys
import datetime

start_days_ago = datetime.timedelta(days=int(sys.argv[1]))
end_days_ago = datetime.timedelta(days=int(sys.argv[2]))

for line in sys.stdin:
    split_line = line.split(' ') #date, time, UTC, hash
    date_string = split_line[0]
    hash_string = split_line[-1].replace('\n', '')
    date = datetime.datetime.strptime(date_string, '%Y-%m-%d')
    today = datetime.datetime.today()

    if date > today - end_days_ago and \
       date < today - start_days_ago:

        print(hash_string)
