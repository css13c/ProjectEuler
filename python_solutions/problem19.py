"""
"""

# Count the number of Sundays in the 20th century. 1 Jan, 1900 was a Monday
from enum import IntEnum
from datetime import date, timedelta

class Days(IntEnum):
    Mon = 0
    Tue = 1
    Wed = 2
    Thr = 3
    Fri = 4
    Sat = 5
    Sun = 6

    def __add__(self, other):
        new_val = self.value + other.value
        if new_val > 6:
            new_val = new_val % 7

        return Days(new_val)

    def __add__(self, other: int):
        new_val = self.value + other
        if new_val > 6:
            new_val = new_val % 7

        return Days(new_val)
    
    def __str__(self):
        return self.name

def is_leap_year(year: int) -> bool:
    return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)

num_sundays = 0
dow = Days.Tue
months = [31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
for year in range(1901, 2001):
    # Calculate Feb days
    months[1] = 29 if is_leap_year(year) else 28
    for m_days in months:
        if dow == Days.Sun:
            num_sundays += 1

        dow += m_days

print(f"Problem 19 solution: {num_sundays}")