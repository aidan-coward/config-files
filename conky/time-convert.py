#!/usr/bin/python

from sys import argv

script, raw_time = argv

time = int(raw_time)

seconds = time % 60
minutes = time % 3600 // 60
hours = time // 3600

if seconds < 10:
    seconds = "0%s" % str(seconds)



if hours > 0:
    if minutes < 10:
        minutes = "0%s" % str(minutes)
        print("%s:%s:%s" % (hours, minutes, seconds))
    else: 
        print("%s:%s:%s" % (hours, minutes,seconds))
else:
    print("%s:%s" % (minutes, seconds))


