"""
Requirements:
1) first argument is target language
2) second argument is source file
3) third argument is destination file
4th onwards are optional
if second argument is directory traverse directory recursively looking for any instance of files matching source
source file-type must be .json
target file name is source file name but .json replaced with .ver
if 3rd argument is missing, each destination file is to be put into the same location as the source file
go to the folder dash2<x> where x is the second arg and look for a file named script.py and run the method named 'generate' and pass arguments starting from 4th one
generate(data, args)
where args is the arguments and data is the json-parsed form of the source file
output of generate to be written into the target file. If the file exists, overwrite it without warning
use argparse, json, os, sys and importlib packages of python
"""


import argparse
import json
import os
import sys
import importlib.util

def find_and_call_generate(source_directory, target_directory, additional_args):
    for root, _, files in os.walk(source_directory):
        for file_name in files:
            if file_name.endswith(".json"):
                source_file_path = os.path.join(root, file_name)
                target_file_name = file_name[:-5] + ".ver"
                target_file_path = os.path.join(target_directory, target_file_name)

                # Load JSON data from the source file
                with open(source_file_path, "r") as source_file:
                    data = json.load(source_file)

                # Check if 'script.py' exists in 'dash2<x>' directory
                script_directory = os.path.join("dash2" + target_directory)
                script_path = os.path.join(script_directory, "script.py")
                if not os.path.exists(script_path):
                    print(f"Error: 'script.py' not found in {script_directory}")
                    continue

                # Import 'script.py' and call 'generate' method
                spec = importlib.util.spec_from_file_location("script_module", script_path)
                script_module = importlib.util.module_from_spec(spec)
                spec.loader.exec_module(script_module)

                if hasattr(script_module, "generate") and callable(script_module.generate):
                    result = script_module.generate(data, additional_args)
                else:
                    print(f"Error: 'generate' method not found in {script_path}")
                    continue

                # Write the result to the target file
                with open(target_file_path, "w") as target_file:
                    target_file.write(result)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process JSON files and call 'generate' method.")
    parser.add_argument("target_language", help="Target language")
    parser.add_argument("source_file", help="Source file (.json) or directory (searched recursively)")
    parser.add_argument("destination_file", nargs="?", help="Destination file (.ver) or directory (if unspecified, assumed same as parent folder for each source file)")
    parser.add_argument("additional_args", nargs=argparse.REMAINDER, help="Additional arguments")

    args = parser.parse_args()

    if os.path.isdir(args.source_file):
        source_directory = args.source_file
    else:
        print("Error: Source file must be a directory.")
        sys.exit(1)

    if args.destination_file:
        target_directory = args.destination_file
    else:
        target_directory = args.source_file

    find_and_call_generate(source_directory, target_directory, args.additional_args)



