import os
import shutil

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

source_directory = "../../models"
destination_directory = "../../dash2tla/properties"

replicate_folder_structure(source_directory, destination_directory)
