from dash2tla.translate_test import *
from dash2tla.run_tests import *
from dash2tla.util import *

root_folder = "./models"
conf = get_config()

def main(args):
    if len(args) == 0 or args[0] == "help":
        help(args[1:])
    elif args[0] == "tests":
        translate_tests(args[1:])
    elif args[0] == "models":
        translate_models()
    elif args[0] == "run":
        run_all_tests(args[1:])
    elif args[0] == "clean":
        clean()
    pass

def help(args):
    with open("./dash2tla/README","r") as f:
        print(f.read())
    pass

def translate_tests(args): # generates .ver files for every .json test, filter applied
    debug = len(args)>0 and args[0] == "debug"
    files = filter(get_all_absolute_paths(root_folder,"json"),".*","-trace_prop[0-9]+\.json")
    for f in files:
        print(f)
        f_target = f[:-4]+"ver"
        translate_test(f, f_target,debug)
        print(f_target)
        print("----")
    pass

def translate_models(): # generates .tla translations for the .dsh files, filter applied
    files = filter(get_all_absolute_paths(root_folder,"dsh"),r".*",r"\.dsh")
    for f in files:
        print(f)
        f_target = f[0:-3]+"tla"
        translate_model(f, f_target)
        print(f_target)
        print("----")
    pass

def run_all_tests(args):
    debug = len(args)>0 and args[0] == "debug"
    files = filter(get_all_absolute_paths(root_folder,"tla"),r".*",r"\.tla")
    vers = filter(get_all_absolute_paths(root_folder,"ver"),r".*",r"-trace_prop[0-9]+\.ver")

    test_mapping = {}
    for f in files:
        vers_f = []
        for g in vers:
            if g.startswith(f[:-4]+"-trace_prop"):
                vers_f.append(g)
        test_mapping[f] = vers_f


    for f in files:
        print(str(len(test_mapping[f]))+" test(s) detected for "+f)
        for ver in test_mapping[f]:
            print("testing:"+ver)
            result = run_test(setup_test(f, ver))
            if result["pass"]:
                print("PASS")
            else:
                print("FAIL")
            if debug:
                print(result)
            print("test complete")

def clean():
    files = []
    files = files + get_all_absolute_paths(root_folder,"tla")
    files = files + get_all_absolute_paths(root_folder,"ver")
    delete_files(files)
    print("finished cleaning models")
    pass

def setup_test(model_path, test_path): # path to .tla model and .ver file
    ver = open(test_path,"r")
    expected = ver.readlines()[2].startswith("true")
    cfg_file_path = "./dash2tla/test_conf.cfg"
    return create_test(model_path,test_path)

def run_test(test_file_path): # path to .tla model and .ver file
    cmd = conf["run_command"]+" -config "+cfg_file_path + " " + test_file_path
    start_time = time.time()
    out = run_command(cmd,conf["shell"])
    end_time = time.time()
    result = interpret_results(out)
    result["actual_time"] = end_time - start_time
    result["pass"] = result["result"] == expected
    if not result["result"]:
        assert "violated" in result
        n = result["violated"]
        result["violated"] = read_file_part(test_file_path,n["line_start"],n["line_end"],n["column_start"],n["column_end"])
    return result
    pass

def translate_test(source_path, destination_path,debug): # path to .json file as src and .ver file as destination
    with open(source_path,"r") as src:
        result = parse(json.load(src),debug)
        with open(destination_path,"w") as dest:
            dest.write(result)

def translate_model(source_path, destination_path): # path to .dsh file as src and .tla file as destination
    shell = conf["shell"]
    c = conf["translation_command"]+" "+source_path+" "+destination_path
    run_command(c,shell)
    pass