#!/usr/bin/python
import elasticsearch
print "Welcome to the hacking hood"

counter=0
fname="hack_list"
with open(fname) as f:
    content=f.readlines()
    for line in content:
        print line
        counter+=1
        print counter
        


