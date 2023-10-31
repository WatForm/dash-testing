from dash2tla.syntax import *
import os
import re

def inject_changes(file_contents):
    return inject_inc(inject_prop(inject(ct)))

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
            new_string = "\t" + OR + " " + parenthesis(TRANSITION + " " + AND + " " + ct_prime+EQUAL+INCREMENT+parenthesis(ct))+"\n"
            modified_file.append(new_string)
            new_string = "\t" + OR + " " + parenthesis(STUTTER + " " + AND + " " + ct_prime+EQUAL+ct)+"\n"
            modified_file.append(new_string)
        else:
            modified_file.append(x)
        i = i+1
    return modified_file

def inject_prop(file_contents, prop):
    modified_file = []
    for x in file_contents:
        if x.startswith(EOF):
            new_string = "\n"+ PROPERTY + " " + DEFINITION + " " + prop + "\n"
            modified_file.append(new_string)
        modified_file.append(x)
    return modified_file

def inject_inc(file_contents, lim):
    modified_file = []
    for x in file_contents:
        if x.startswith(NEXT):
            new_string = "\n" + INCREMENT+parenthesis(n)+" "+DEFINITION+" "+IF+" "+n+LESSER+lim+" "+THEN+" "+n+"+1 "+ELSE+" "+ct+"\n\n"
            modified_file.append(new_string)
        modified_file.append(x)
    return modified_file


def replace_module_name(file_contents, old_name, new_name):
    for i in range(len(file_contents)):
        if file_contents[i].find(MODULE) != -1:
            file_contents[i] = file_contents[i].replace(old_name, new_name)
    return file_contents

def setup_test(model_path, test_path):
    ver = open(test_path,"r")
    expected = ver.readlines()[2].startswith("true")
    cfg_file_path = "./dash2tla/test_conf.cfg"
    test_file_path = create_test(model_path,test_path)

def interpret_results(output_string):
    results = {}
    time = re.search(r'Finished in ([0-9]+)s at ',output_string)
    if time:
        results["reported_time"] = int(time.group(1))
    states = re.search(r'([0-9]+) states generated, ([0-9]+) distinct states found, ',output_string)
    if states:
        results["states"] = int(states.group(1))
        results["distinct_states"] = int(states.group(2))

    pf = re.search(r"No error has been found",output_string)
    if pf:
        results["result"] = True
        return results

    pf = re.search(r"Error:( .* violated\.)",output_string)
    if not pf:
        results["debug"] = output_string
        return results
    
    results["result"] = False
    results["error"] = pf.group(1)
    behavior = re.compile(r'Error: The following behaviour constitutes a counter-example:(.*)Finished checking temporal properties, ',re.DOTALL).search(output_string)
    if behavior:
        results["counter_example"] = behavior.group(1)
    
    return results