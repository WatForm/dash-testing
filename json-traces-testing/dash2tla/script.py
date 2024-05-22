from dash2tla.lib import *
from dash2tla.custom import *

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
    elif args[0] == "custom":
        print("running custom script")
        custom()
