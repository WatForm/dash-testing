from dash2tla.syntax import *
import os

# to run a test, new file named <x>_test.tla is made
# a new variable named ct is created (read from syntax)
# the property is injected into the file
# a .cfg file is created
# tla command is called and the test is run

def create_test(file_path, prop_path):# takes in a .tla file and a .ver file and makes a temporary file for testing
    f = open(file_path,"r")
    f_prop = open(prop_path,"r")
    temp_file = file_path[:-4]+"_test.tla"
    prop = f_prop.read()
    f_contents = f.readlines()
    f_contents = replace_module_name(f_contents,os.path.basename(file_path)[:-4],"_test")
    f_contents = inject_ct(f_contents)
    f_contents = inject_prop(f_contents, prop)
    with open(temp_file, "w") as c:
        for t in f_contents:
            c.write(t)
    pass

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

def inject_prop(file_contents, prop):
    modified_file = file_contents
    return modified_file
    pass

def replace_module_name(file_contents, old_name, append):
    for i in range(len(file_contents)):
        if file_contents[i].find(MODULE) != -1:
            file_contents[i] = file_contents[i].replace(old_name, old_name+append)
    return file_contents