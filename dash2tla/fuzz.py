depth = 2
num = 10
and_prob = 0.5
transition_density = 0.1

# use dash-alloy as a benchmark for correctness

import math
import random
import sys
import visualize as vs

output_path = sys.argv[1]



transcript = "test"

def write():
    with open(output_path,"w") as f:
        f.write(transcript)

class State:
    def __init__(self, n):
        self.name = n
        self.transitions = []
        self.events = []
        self.AND = []
        self.OR = [] # default is OR[0]
    def toStringRep(self):
        s = []
        s.append("state "+self.name)
        s.append("{")
        for e in self.events:
            s.append(e.toStringRep())
        for t in self.transitions:
            s.append(t.toStringRep())
        for st in self.AND:
            sr = st.toStringRep()
            sr[0] = "conc "+sr[0]
            s.append(sr)
        if len(self.OR) != 0:
    
            sr_def = self.OR[0].toStringRep()
            sr_def[0] = "default "+sr_def[0]
            s.append(sr_def)
            for i in range(1,len(self.OR)):
                s.append(self.OR[i].toStringRep())
        
        s.append("}")
        return s


class Transition:
    
    name = ""
    def __init__(self, n):
        self.name = n
        self.on = None # event
        self.goto = None # state
        self.send = None # event
        self.from_ = None # state
    def toStringRep(self):
        s = []
        s.append("trans "+self.name)
        s.append("{")
        sr = []
        if self.from_:
            sr.append("from "+self.from_.name)
        if self.on:
            sr.append("on "+self.on.name)
        if self.goto:
            sr.append("goto "+self.goto.name)
        if self.send:
            sr.append("send "+self.send.name)
        s.append(sr)
        s.append("}")
        return s

class Event:
    name = ""
    def __init__(self, n):
        self.name = n


def printStringRep(stringrep, offset): #stringrep is an array were each element is array or a string, tree structure
    s = ""
    tab = "\t"*offset
    for x in stringrep:
        if isinstance(x, list):
            s = s+printStringRep(x, offset+1)
        else:
            s = s+tab+x+"\n"
    return s


def probability(x):
    return 1





sum_prob = 0
for x in range(depth):
    sum_prob+=probability(x)

root_state = State("SRoot")
state_list = [[root_state]] # states in ith level in a set
for x in range(depth):
    num_in_level = int(num*probability(x)/sum_prob)
    if num_in_level == 0:
        num_in_level=1
    next_level = []
    for y in range(num_in_level):
        st = State("n_"+str(x)+"_"+str(y))
        next_level.append(st)
        if random.random()>and_prob:
            random.choice(state_list[len(state_list)-1]).OR.append(st)
        else:
            random.choice(state_list[len(state_list)-1]).AND.append(st)
    state_list.append(next_level)


def random_cross_hatch(state_list,density):
    for s1 in state_list:
        for s2 in state_list:
            if random.random() < density:
                transition_name = s1.name+"_to_"+s2.name
                t = Transition(transition_name)
                t.goto = s2
                s1.transitions.append(t)

list_of_lists = state_list
flattened_list = [item for sublist in list_of_lists for item in sublist]
random_cross_hatch(flattened_list,transition_density)

transcript = printStringRep(root_state.toStringRep(),0)
write()
vs.write_to_graph(root_state)
print("complete")