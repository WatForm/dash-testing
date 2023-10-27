import os
import re
import subprocess
import json

def filter(files, regex_start, regex_end):
    conf = get_config()
    new_files = files
    if conf["custom_include"]:
        new_files = []
        for f in files:
            for n in conf["include_list"]:
                if re.match(regex_start+n+regex_end,f):
                    new_files.append(f)
    return new_files

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

def delete_files(file_paths, debug):
    for file_path in file_paths:
        try:
            os.remove(file_path)
            if debug:
                print(f"Deleted file: {file_path}")
        except OSError as e:
            print(f"Error deleting {file_path}: {e}")

def get_config():
    with open("./dash2tla/config.json","r") as f:
        return json.load(f)
    return None

def run_command(cmd,shell):
    result = ""
    if shell:
        result = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    else: # for unix-based
        result = subprocess.run(cmd.split(),stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return result.stdout

def read_file_part(file_path, start_line, end_line, start_column, end_column):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    # Ensure valid line and column ranges
    if start_line < 1 or end_line > len(lines) or start_column < 1:
        return "Invalid range"

    content = ""
    for i in range(start_line - 1, end_line):
        line = lines[i]
        # Adjust column indices based on Python's 0-based indexing
        adjusted_start_column = start_column - 1
        adjusted_end_column = min(end_column, len(line))

        # Ensure valid column range
        if adjusted_start_column < 0 or adjusted_start_column > adjusted_end_column:
            return "Invalid range"

        content += line[adjusted_start_column:adjusted_end_column]

    return content