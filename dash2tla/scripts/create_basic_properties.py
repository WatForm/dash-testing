import os
import shutil

from config import *

# ChatGPT prompt: 
# write a python script to do the following:

# go to the upper directory and enter a folder named models
# recursively search every file in models
# replicate the folder structure of models inside a folder named dash2tla, which is stored in the same folder as models
# where there is a file in models, make a folder instead which has the same name as the file, without extension
# fill each of these folders with a empty file named "tautology.ver" and another named "fallacy.ver"
# write the string "TRUE" into tautology.ver and the string "FALSE" into fallacy.ver (without double-quotes)
# when making folders and files, if they already exist, do not do anything to them

def replicate_folder_structure(source_dir, dest_dir):


    for root, dirs, files in os.walk(source_dir):

        relative_path = os.path.relpath(root, source_dir)
        dest_path = os.path.join(dest_dir, relative_path)
        
        for directory in dirs:
            new_dir = os.path.join(dest_path, directory)
            if not os.path.exists(new_dir):
                os.makedirs(new_dir)
                print("made directory "+new_dir)
        
        for filename in files:
            base_name = os.path.splitext(filename)[0]
            new_dir = os.path.join(dest_path, base_name)
            if not os.path.exists(new_dir):
                os.makedirs(new_dir)
                tautology_ver = os.path.join(new_dir, "tautology.ver")
                fallacy_ver = os.path.join(new_dir, "fallacy.ver")
                with open(tautology_ver, 'w') as file:
                    file.write("TRUE")
                with open(fallacy_ver, 'w') as file:
                    file.write("FALSE")


replicate_folder_structure(source_directory, destination_directory)
