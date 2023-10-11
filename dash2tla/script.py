from dash2tla.translate_test import *
import os
import json

root_folder = "./models"

def main(args):
    if len(args) == 0 or args[0] == "help":
        help()
    elif args[0] == "tests":
        translate_tests(args[1:])
    elif args[0] == "models":
        translate_models()
    elif args[0] == "run":
        run_tests()
    elif args[0] == "clean":
        clean()
    pass

def help():
    print("options:")
    print("tests\t\treads all .json tests in the models folder and converts them in place to .cfg files")
    print("models\t\treads all .dsh models in the models folder and converts them into .tla files")
    print("run\t\truns all the tests specified in .ver files for the models specified in .tla files")
    print("clean\t\tremoves all .ver and .tla files")
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
    pass

def run_tests():
    pass

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

