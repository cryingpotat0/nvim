#!/Users/ragz/anaconda3/bin/python
import sys
import datetime
from pathlib import Path

DATE_FORMAT = '%Y-%m-%d'

template = \
"""= {date} =

== Reading ==

== Thoughts ==

== Schedule ==
{schedule}

== Checklist ==
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
    day_of_the_week = today.strftime('%A')

    if day_of_the_week not in exercise:
        return common
    return common + exercise_base + exercise[day_of_the_week]

def get_checklist(today):
    return "- [ ] \n"

today = get_date(sys.argv)
output = template.format(
    date=today.strftime('%a %d %b %Y'),
    schedule=get_schedule(today),
    checklist=get_checklist(today),
)

# Print it out for vimwiki to process
print(output)
