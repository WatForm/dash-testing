# use dash-alloy as a benchmark for correctness

import math
import random
import sys
import visualize as vs
from model_maker import *

output_path = ""
dot_path = None

def set_paths(output, dot=None):
    global output_path
    global dot_path
    output_path = output
    dot_path = dot

def get_paths():
    global output_path
    global dot_path
    return output_path, dot_path

"""
depth = depth of tree
num = number of nodes
and_prob = probability of a node being an AND node
transition_density = probability of a transition existing between any given pair of nodes
"""

def fuzz_main(depth=2, num=10, and_prob=0.5, transition_density=0.1):
    output_path, dot_path = get_paths()
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

    list_of_lists = state_list
    flattened_list = [item for sublist in list_of_lists for item in sublist]
    random_cross_hatch(flattened_list,transition_density)

    write(printStringRep(root_state.toStringRep(),0))
    if dot_path:
        vs.write_to_graph(root_state, dot_path)

def write(transcript):
    global output_path
    with open(output_path,"w") as f:
        f.write(transcript)

def probability(x):
    return 1




def random_cross_hatch(state_list,density):
    for i in range(len(state_list)):
        for j in range(len(state_list)):
            if random.random() < density and i<=j:
                transition_name = s1.name+"_to_"+s2.name
                t = Transition(transition_name)
                t.goto = s2
                s1.transitions.append(t)

