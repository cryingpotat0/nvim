#!/Users/ragz/anaconda3/bin/python
import sys
import datetime
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
              "- [ ] Sleep by 11\n")
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

def get_checklist(today):
    yesterday = today - datetime.timedelta(days=1)
    new_checklist = []
    old_checklist = []
    checklist_started = False
    #with open(f'~/vimwiki/diary/{yesterday.strftime("%Y-%m-%d")}.md') as f:
    #    for lin in f.readlines():
    #        checklist_started = "Checklist" in lin
    #        if not checklist_started: continue

    #        if is_heading(lin):
    #            new_checklist.push_back(lin)
    #            old_checklist.push_back(lin)
    #        elif is_incomplete_task
            

    return "- [ ] \n"

today = get_date(sys.argv)
output = template.format(
    date=today.strftime('%a %d %b %Y'),
    schedule=get_schedule(today),
    checklist=get_checklist(today),
)

# Print it out for vimwiki to process
print(output)
