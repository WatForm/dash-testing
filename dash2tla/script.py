from dash2tla.translate_test import *
from dash2tla.run_tests import *
import os
import json
import subprocess

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


def translate_tests(args):
    debug = len(args)>0 and args[0] == "debug"
    files = get_all_absolute_paths(root_folder,"json")
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

def translate_models():
    files = get_all_absolute_paths(root_folder,"dsh")
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
    files = get_all_absolute_paths(root_folder,"tla")
    props = get_all_absolute_paths(root_folder,"ver")
    conf = get_config()
    if conf["custom_include"]:
        new_files = []
        for f in files:
            for n in conf["include_list"]:
                if f.endswith(n+".tla"):
                    new_files.append(f)
        files = new_files
    test_mapping = {}
    for f in files:
        props_f = []
        for g in props:
            if g.startswith(f[:-4]+"-trace_prop"):
                props_f.append(g)
        test_mapping[f] = props_f
    for f in files:
        print(str(len(test_mapping[f]))+" test(s) detected for "+f)
        for prop in test_mapping[f]:
            create_test(f,prop)
    # run test using tla command, the cfg is given in the same folder as test_conf
    # delete theb

def clean():
    files = []
    files = files + get_all_absolute_paths(root_folder,"tla")
    files = files + get_all_absolute_paths(root_folder,"ver")
    delete_files(files)
    print("finished cleaning models")
    pass


def get_all_absolute_paths(folder, extension):
    # Create an empty list to store the absolute paths of matching files
    file_paths = []

    # Walk through the folder and its subdirectories
    for root, _, files in os.walk(folder):
        for filename in files:
            # Split the file's name and extension
            _, ext = os.path.splitext(filename)
            
            # Check if the extension matches the provided extension (without a dot)
            if ext[1:] == extension:
                # Build the absolute path and add it to the list
                file_paths.append(os.path.join(root, filename))

    return file_paths

def delete_files(file_paths):
    for file_path in file_paths:
        try:
            os.remove(file_path)
            print(f"Deleted file: {file_path}")
        except OSError as e:
            print(f"Error deleting {file_path}: {e}")

def get_config():
    with open("./dash2tla/config.json","r") as f:
        return json.load(f)
    return None

def run_command(cmd,shell):
    if shell:
        subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    else: # for unix-based
        subprocess.run(cmd.split(),stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    pass

