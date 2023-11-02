from dash2tla.translate_test import *
from dash2tla.run_tests import *
from dash2tla.util import *
import time
import pprint

root_folder = "./models"
debug = False
conf = get_config()
separator = "______________________________________________\n"

def main(args):
    if len(args) == 0:
        help()
        return
    options(args[1:])
    if args[0] == "help":
        help()
    elif args[0] == "tests":
        print("translating tests:")
        translate_tests()
    elif args[0] == "models":
        print("translating models:")
        translate_models()
    elif args[0] == "run":
        print("running tests:")
        run_all_tests()
    elif args[0] == "clean":
        print("cleaning directory:")
        clean()

def help():
    with open("./dash2tla/README","r") as f:
        print(f.read())
    pass

def translate_tests(): # generates .ver files for every .json test, filter applied
    files = filter(get_all_absolute_paths(root_folder,"json"))
    for f in files:
        print(os.path.basename(f))
        f_target = f[:-4]+"ver"
        translate_test(f, f_target,debug)
        if debug:
            print(separator)
        
    print(str(len(files))+" test(s) translated")

def translate_models(): # generates .tla translations for the .dsh files, filter applied
    files = filter(get_all_absolute_paths(root_folder,"dsh"))
    for f in files:
        print(os.path.basename(f))
        f_target = f[0:-3]+"tla"
        translate_model(f, f_target)
    print(str(len(files))+" dash model(s) translated")

def run_all_tests():
    files = filter(get_all_absolute_paths(root_folder,"tla"))
    vers = filter(get_all_absolute_paths(root_folder,"ver"))


    test_mapping = {}
    for f in files:
        vers_f = []
        for g in vers:
            if g.startswith(f[:-4]+"-trace_prop"):
                vers_f.append(g)
        test_mapping[f] = vers_f

    ct=0
    for f in files:
        if not f.endswith("_test.tla"):
            ct=ct+1
            if debug:
                print(separator)
            print("\n"+str(len(test_mapping[f]))+" test(s)"+"\t\t"+os.path.basename(f))
        for ver in test_mapping[f]:
            if debug:
                print(separator)
            test_file_path = f[:-4]+re.search(r'-trace(_prop\d+)',ver).group(1)+"_test.tla"
            file_print = os.path.basename(test_file_path)
            setup_test(f, ver,test_file_path)
            result = run_test(ver,test_file_path,debug)
            if "pass" not in result:
                print('\x1b[0;33;40m' + 'ERROR' + '\x1b[0m\t\t'+file_print)
            elif result["pass"]:
                print('\x1b[0;32;40m' + 'PASS' + '\x1b[0m\t\t'+file_print)
            else:
                print('\x1b[0;31;40m' + 'FAIL' + '\x1b[0m\t\t'+file_print)
            if debug:
                print("\n")
                pprint.pprint(result)
    print(str(ct)+" model(s) identified")
        

def clean():
    files = []
    files_tla = get_all_absolute_paths(root_folder,"tla")
    files_ver = get_all_absolute_paths(root_folder, "ver")
    files = files + files_tla + files_ver
    delete_files(files,debug)
    print("deleted "+str(len(files_tla))+" .tla file(s) and "+str(len(files_ver))+" .ver file(s)")
    pass

def setup_test(model_path, test_path, test_file_path): # path to .tla model, .ver file and test .tla file
    f = open(model_path,"r")
    f_cfg = open(test_path,"r")
    cfg = f_cfg.readlines()
    f_contents = f.readlines()

    old_name = os.path.basename(model_path)[:-4]
    new_name = os.path.basename(test_file_path)[:-4]

    f_contents = replace_module_name(f_contents,old_name,new_name)
    f_contents = inject_ct(f_contents)
    f_contents = inject_prop(f_contents, cfg[0])
    f_contents = inject_inc(f_contents, cfg[2][:-1])
    with open(test_file_path, "w") as c:
        for t in f_contents:
            c.write(t)

def run_test(test_path, test_file_path, debug): # path to .tla model and .ver file
    ver_lines = open(test_path,"r").readlines()
    expected = ver_lines[3].startswith("true")
    quantifier = ver_lines[1][0]
    cfg_file_path = "./dash2tla/test_conf.cfg"
    cmd = conf["run_command"]+" -config "+cfg_file_path + " " + test_file_path
    shell = conf['shell']

    start_time = 0
    end_time = 0
    attempts = 10
    out = ""
    while attempts > 0:
        start_time = time.time()
        out = run_command(cmd,shell)
        end_time = time.time()
        attempts = attempts - 1
        if len(out)!=0:
            break

    result = interpret_results(out)

    if attempts == 0:
        result["debug"]="timeout. No result obtained after running test due to pipe issues in script"
    
    result["actual_time"] = end_time - start_time
    if "result" in result:
        result["pass"] = result["result"] == expected
        if quantifier == "exists":
            result["pass"] = ~result["pass"]
    return result

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

def options(args):
    global root_folder
    global debug
    if len(args)>1:
        if args[0] == "dir":
            root_folder = args[1]
            args = args[2:]
    debug = len(args)>0 and args[0] == "debug"
