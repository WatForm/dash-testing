from config import *
from controller import *
import re

def check_properties(model_name_dsh, path_name):

    model_name = os.path.splitext(model_name_dsh)[0]

    # get the .ver files for this model_name
    # and the method in config.py
    pattern = re.compile(rf"^{re.escape(os.path.basename(model_name))}_{re.escape(method)}_(.+)_(sat|unsat)\.ver$")
    matching_files = []

    for root, dirs, files in os.walk(path_name):
        for filename in files:
            if pattern.match(filename):
                fragment_path = str(os.path.join(root, filename))
                matching_files.append(fragment_path)
    
    cnt_pass = 0
    cnt_fail = 0

    for ver_file in matching_files:
        # concatenate the .dsh and the .ver file
        dsh_ver_file = os.path.splitext(ver_file)[0] + ".dsh"
        with open(dsh_ver_file, "w") as outfile:
            for fname in [model_name_dsh, ver_file]:
                with open(fname, "r") as infile:
                    outfile.write(infile.read())

        # we already know it matches
        match = pattern.match(os.path.basename(ver_file))
        if match is None:
            print("Error it should have matched")
            sys.exit(1);
        property_name, result = match.groups()  
        if verbose:
            print(f"Property: {property_name}")
            print(f"Result: {result}")  # "sat" or "unsat" 

        cmd = f"{dashplus} -alloy={method} {dsh_ver_file}"
        (output,err, rc, time_taken) = run_command(cmd)
        if rc == 0 and "SAT" in output and result=="sat":
            if verbose:
                # eventually we may want to record this in a csv file
                print(f"{fragment_path}: PASS, time: {time_taken}, result: SAT")
            # clean up 
            os.rm(dsh_ver_file)
            cnt_pass += 1
        elif rc == 0 and "UNSAT" in output and result=="unsat":
            if verbose:
                # eventually we may want to record this in a csv file
                print(f"{fragment_path}: PASS, time: {time_taken}, result: UNSAT")
            # clean up 
            os.rm(dsh_ver_file)
            cnt_pass += 1
        else:
            common_err_response(cmd, output, err, time_taken)
            cnt_fail += 1

    return (cnt_pass, cnt_fail)


if __name__ == "__main__":
    controller(check_properties) 