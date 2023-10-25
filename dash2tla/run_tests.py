from dash2tla.syntax import *
import os
import re

# to run a test, new file named <x>_test.tla is made
# a new variable named ct is created (read from syntax)
# the property is injected into the file
# a .cfg file is created
# tla command is called and the test is run

def create_test(file_path, prop_path):# takes in a .tla file and a .ver file and makes a temporary file for testing
    f = open(file_path,"r")
    f_cfg = open(prop_path,"r")
    temp_file = file_path[:-4]+"_test.tla"
    cfg = f_cfg.readlines()
    f_contents = f.readlines()
    f_contents = replace_module_name(f_contents,os.path.basename(file_path)[:-4],"_test")
    f_contents = inject_ct(f_contents)
    f_contents = inject_prop_inv(f_contents, cfg[0], cfg[1])
    with open(temp_file, "w") as c:
        for t in f_contents:
            c.write(t)
    return temp_file

def create_config(filepath):
    pass


def inject_ct(file_contents):
    modified_file = []
    i = 0
    while i < len(file_contents):
        x = file_contents[i]
        if x.startswith(VARIABLES):
            modified_file.append(x)
            new_string = VARIABLES + " " + ct + "\n"
            modified_file.append(new_string)
        elif x.startswith(INIT):
            modified_file.append(x)
            new_string = "\t" + AND + " " + ct + " " + EQUAL + " 0\n";
            modified_file.append(new_string)
        elif x.startswith(NEXT):
            modified_file.append(x)
            i=i+2
            new_string = "\t" + OR + " " + parenthesis(TRANSITION + " " + AND + " " + ct_prime+EQUAL+ct+"+1")+"\n"
            modified_file.append(new_string)
            new_string = "\t" + OR + " " + parenthesis(STUTTER + " " + AND + " " + ct_prime+EQUAL+ct)+"\n"
            modified_file.append(new_string)
        else:
            modified_file.append(x)
        i = i+1
    return modified_file

def inject_prop_inv(file_contents, prop, inv):
    modified_file = []
    for x in file_contents:
        if x.startswith(EOF):
            new_string = "\n"+ PROPERTY + " " + DEFINITION + " " + prop + "\n" + INVARIANT +" "+ DEFINITION + " " + inv + "\n"
            modified_file.append(new_string)
        modified_file.append(x)
    return modified_file
    pass

def replace_module_name(file_contents, old_name, append):
    for i in range(len(file_contents)):
        if file_contents[i].find(MODULE) != -1:
            file_contents[i] = file_contents[i].replace(old_name, old_name+append)
    return file_contents

def interpret_results(output_string):
    results = {}
    time = re.search(r'Finished in ([0-9]+)s at ',output_string)
    if time:
        results["time"] = int(time.group(1))
    states = re.search(r'([0-9]+) states generated, ([0-9]+) distinct states found, ',output_string)
    if states:
        results["states"] = int(states.group(1))
        results["distinct_states"] = int(states.group(2))
    
    behavior = re.search(r'Error: The behavior up to this point is:(.*)states generated, ',output_string)
    if behavior:
        results["behaviour"] = behaviour.group(1)
    
    result_line = re.search(r'Error: Invariant (.*) is violated.',output_string)
    if result_line:
        result = result_line.group(1)
        results["result"] = result == "Inv"
        if not results["result"]:
            info = re.search(r'line ([0-9]+), col ([0-9]+) to line ([0-9]+), col ([0-9]+) of module', result)
            if info:
                results["violated"] = {}
                results["violated"]["line_start"] = info.group(1)
                results["violated"]["line_end"] = info.group(3)
                results["violated"]["column_start"] = info.group(2)
                results["violated"]["column_end"] = info.group(4)
    
    return results



    

