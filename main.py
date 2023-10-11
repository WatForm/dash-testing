"""
trranslate each models (needs to merged)
translate each test
run all the tests (needs to be written, take the langauge as an argument)

Rquirements:
first argument required, language
second argument is method in file named script.py in dash2<x> where x is first argument to execute (may be anything depending on the language, of these the help is mandatory)
arguments after that are given to individual functions

Requirements:

The first three arguments are mandatory
1) The first argument is a language. If -x is typed, language becomes x
2) The second argument is a source path
3) The third argument is a destination path

case 1: source and destination are both files
Then perform a check to ensure that source file ends in '.json' and destination file ands in '.ver'
go to the folder dash2<x> where x is the second arg and look for a file named script.py and run the method named 'generate' and pass arguments starting from 4th one
generate(data, args)
where args is the arguments and data is the json-parsed form of the source file
output of generate to be written into the target file. If the file exists, overwrite it without warning

case 2: source is a directory
Then perform a check to ensure that destination is also a directory
traverse directory recursively looking for any instance of files matching source pattern
if found, case 1 but set the destination file to be source file name but with extension replaced
do this for all files
put all those output files into the destination directory

case 3: source is directory and destination is "--auto"
do the same as case 2 but put each output file into the same parent folder as the source file


4th onwards are optional, pass all from the 4th one to args in generate(data, args)

use argparse, json, os, sys and importlib packages of python
"""
import argparse
import json
import os
import sys
import importlib.util

def run_generate(script_directory, source_file, destination_file, additional_args):
    # Check if 'script.py' exists in 'dash2<x>' directory
    script_path = os.path.join(script_directory, "script.py")
    if not os.path.exists(script_path):
        print(f"Error: 'script.py' not found in {script_directory}")
        return

    # Load JSON data from the source file
    with open(source_file, "r") as source:
        data = json.load(source)

    # Import 'script.py' and call 'generate' method
    spec = importlib.util.spec_from_file_location("script_module", script_path)
    script_module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(script_module)

    if hasattr(script_module, "generate") and callable(script_module.generate):
        result = script_module.generate(data, additional_args)
    else:
        print(f"Error: 'generate' method not found in {script_path}")
        return

    # Write the result to the destination file
    with open(destination_file, "w") as dest:
        dest.write(result)

def process_files(language, source, destination, additional_args):
    if not source.endswith(".json"):
        print("Error: Source file must end with '.json'.")
        sys.exit(1)

    if not destination.endswith(".ver"):
        print("Error: Destination file must end with '.ver'.")
        sys.exit(1)

    script_directory = os.path.join("dash2" + language)
    run_generate(script_directory, source, destination, additional_args)

def process_directory(language, source, destination, additional_args):
    auto = False
    if destination == "auto":
        auto = True
    elif not os.path.isdir(destination):
        print("Error: Destination must be a directory.")
        sys.exit(1)

    for root, _, files in os.walk(source):
        for file_name in files:
            if file_name.endswith(".json"):
                source_file = os.path.join(root, file_name)
                if auto:
                    destination_file = os.path.join(root, file_name[:-5] + ".ver")
                else:
                    destination_file = os.path.join(destination, file_name[:-5] + ".ver")
                script_directory = os.path.join("dash2" + language)
                run_generate(script_directory, source_file, destination_file, additional_args)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Top-level script for testing dash models")
    parser.add_argument("language", help="target language of translation")
    parser.add_argument("additional_args", nargs=argparse.REMAINDER, help="Additional arguments, passed to language-specific script")

    args = parser.parse_args()
    print("args parsed")

    # Check if 'script.py' exists in 'dash2<x>' directory
    script_directory = os.path.join("dash2" + args.language)
    if not os.path.exists(script_directory):
        print(f"Error: the target language {args.language} is not currently supported")
        exit()
    script_path = os.path.join(script_directory, "script.py")
    if not os.path.exists(script_path):
        print(f"Error: 'script.py' not found in {script_directory}")
        exit()

    # Import 'script.py' and call 'generate' method
    spec = importlib.util.spec_from_file_location("script_module", script_path)
    script_module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(script_module)
    if hasattr(script_module, "main") and callable(script_module.main):
        result = script_module.main(args.additional_args)
    else:
        print(f"Error: 'main' method not found in {script_path}")
        exit
    
    
    print("complete")

