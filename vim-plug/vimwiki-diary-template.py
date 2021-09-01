#!/Users/ragz/anaconda3/bin/python
import sys
import datetime
import mistletoe
import os
from pathlib import Path

DATE_FORMAT = '%Y-%m-%d'

template = \
"""# {date} #

## Reading ##

## Thoughts ##

## Schedule ##
{schedule}

## Checklist ##
{checklist}

"""

def get_date(argv):
    if len(argv) < 2:
        return datetime.date.today()
    path = Path(argv[1])
    return datetime.datetime.strptime(path.stem, DATE_FORMAT)

def get_schedule(today):
    common = ("- [ ] No P\n"
              "- [ ] Cook\n"
              "    -\n"
              "- [ ] Sleep by 11\n"
              "- [ ] No YouTube\n")
    exercise_base = "- [ ] Exercise\n"
    exercise = {
        "Monday": \
        ("    - [ ] Run\n"
         "    - [ ] Full body 20 min\n")
        ,
        "Tuesday": \
        ("    - [ ] Arms + back\n"
         "    - [ ] 1 minute dead hang\n"
         "    - [ ] 5 negative pull ups\n")
        ,
        "Wednesday": \
        ("    - [ ] Walk\n"
         "    - [ ] Full body 20 min\n")
        ,
        "Thursday": \
        ("    - [ ] Core/back\n"
         "    - [ ] 1 minute dead hang\n"
         "    - [ ] 5 negative pull ups\n")
        ,
        "Friday": \
        ("    - [ ] Run\n"
         "    - [ ] Full body 20 min\n")
        ,
    }

    other = {
        "Saturday": "- [ ] Leetcode",
        "Sunday": "- [ ] Leetcode",
    }

    day_of_the_week = today.strftime('%A')

    if day_of_the_week in exercise:
        common = common + exercise_base + exercise[day_of_the_week]

    if day_of_the_week in other:
        common = common + other[day_of_the_week]

    return common


def _get_last_active_diary_path(today):
    files = sorted(os.listdir('/Users/ragz/vimwiki/diary'))
    today_str = today.strftime("%Y-%m-%d") + '.md'
    if files[-2] == today_str:
        return '/Users/ragz/vimwiki/diary/' + files[-3]
    return '/Users/ragz/vimwiki/diary/' + files[-2]

def get_checklist(today):
    new_lines_for_previous = None
    with open(_get_last_active_diary_path(today)) as f:
       lines = f.readlines()
       checklist_lines = None
       for i, lin in enumerate(lines):
           if not "Checklist" in lin: continue

           checklist_lines = lines[i+1:]
           new_lines_for_previous = lines[:i+1]
           last_day_checklist_start = i+1
           break
        
       filtered_checklist = []
       finished_checklist = []
       for lin in checklist_lines:
           # Completed or will-not-complete items, along with headings go to
           # the previous days checklist
           if '[X]' in lin or '[-]' in lin: 
               finished_checklist.append(lin)
               continue

           if '-' not in lin:
               finished_checklist.append(lin)

           # Partially completed items will be made incomplete for the next
           # day
           if '[.]' in lin:
               finished_checklist.append(lin)
               lin = lin.replace('[.]', '[ ]')

           filtered_checklist.append(lin)

       new_lines_for_previous += finished_checklist

    with open(_get_last_active_diary_path(today), 'w') as f:
        f.write(''.join(new_lines_for_previous))
            
    return ''.join(filtered_checklist)

today = get_date(sys.argv)
output = template.format(
    date=today.strftime('%a %d %b %Y'),
    schedule=get_schedule(today),
    checklist=get_checklist(today),
)

# Print it out for vimwiki to process
print(output)
