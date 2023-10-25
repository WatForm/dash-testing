from dash2tla.translate_test import *
from dash2tla.run_tests import *
from dash2tla.util import *
import os
import json
import subprocess
import re

root_folder = "./models"

def main(args):
    if len(args) == 0 or args[0] == "help":
        help()
    elif args[0] == "tests":
        translate_tests(args[1:])
    elif args[0] == "models":
        translate_models()
    elif args[0] == "run":
        run_all_tests()
    elif args[0] == "clean":
        clean()
    pass

def help():
    with open("./dash2tla/README","r") as f:
        print(f.read())
    pass


def translate_tests(args): # generates .ver files for every .json test, filter applied
    debug = len(args)>0 and args[0] == "debug"
    files = filter(get_all_absolute_paths(root_folder,"json"),".*","-trace_prop[0-9]+\.json")
    for f in files:
        print(f)
        f_target = f[:-4]+"ver"
        with open(f,"r") as fx:
            result = parse(json.load(fx),debug)
            with open(f_target,"w") as fy:
                fy.write(result)
                print(f_target)
                print("----")
    pass

def translate_models(): # generates .tla translations for the .dsh files, filter applied
    files = filter(get_all_absolute_paths(root_folder,"dsh"),r".*",r"\.dsh")
    conf = get_config()
    cmd = conf["translation_command"]
    shell = conf["shell"]
    for f in files:
        print(f)
        f_target = f[0:-3]+"tla"
        c = cmd+" "+f+" "+f_target
        run_command(c,shell)
        print(f_target)
        print("----")
    pass


    
def run_all_tests():
    files = filter(get_all_absolute_paths(root_folder,"tla"),r".*",r"\.tla")
    vers = filter(get_all_absolute_paths(root_folder,"ver"),r".*",r"-trace_prop[0-9]+\.ver")

    test_mapping = {}
    for f in files:
        vers_f = []
        for g in vers:
            if g.startswith(f[:-4]+"-trace_prop"):
                vers_f.append(g)
        test_mapping[f] = vers_f

    cfg_file_path = "./dash2tla/test_conf.cfg"
    conf = get_config()
    command = conf["run_command"]+" -config "+cfg_file_path

    for f in files:
        print(str(len(test_mapping[f]))+" test(s) detected for "+f)
        for ver in test_mapping[f]:
            test_file_path = create_test(f,ver)
            print("testing:"+ver)
            cmd = command + " " + test_file_path
            print(interpret_results(run_command(cmd,conf["shell"])))
            print("test complete")


def clean():
    files = []
    files = files + get_all_absolute_paths(root_folder,"tla")
    files = files + get_all_absolute_paths(root_folder,"ver")
    delete_files(files)
    print("finished cleaning models")
    pass