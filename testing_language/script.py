import json

import os

import sys


import dash

import tla


options = {"-dash":dash.parse, "-tla":tla.parse} # write options here


def convert_json_to_ver(source_path, destination_path, function):

    try:

        # Check if the source path points to a .json file

        if not source_path.lower().endswith('.json'):

            raise ValueError("Source file should be a .json file.")
        

        # Check if the destination path points to a .ver file

        if not destination_path.lower().endswith('.ver'):

            raise ValueError("Destination file should be a .ver file.")
        

        # Read JSON data from the source file

        with open(source_path, 'r') as source_file:

            data = json.load(source_file)
        

        # Convert the JSON data to a string

        json_string = json.dumps(data)

        output = function(data)

        # Write the stringified JSON to the destination file

        with open(destination_path, 'w') as destination_file:

            destination_file.write(json_string)
        

        print(f"Successfully converted JSON from '{source_path}' to VER in '{destination_path}'.")
    

    except FileNotFoundError:

        print("Error: Source file not found.")

    except ValueError as ve:

        print(f"Error: {ve}")

    except Exception as e:

        print(f"An error occurred: {e}")


if __name__ == "__main__":

    if len(sys.argv) < 3 or sys.argv[1] == "-help":

        print("Usage: python script.py <option> <source_path> [<destination_path>]\noptions:\t-dash\t-tla\t-help")

    else:
        option = sys.argv[1]

        source_path = sys.argv[2]
        

        # If destination path is not specified, use the source path with .ver extension

        if len(sys.argv) == 3:

            destination_path = os.path.splitext(source_path)[0] + ".ver"

        else:

            destination_path = sys.argv[3]
        

        convert_json_to_ver(source_path, destination_path, options[option])

