from config import *
from controller import *
import os

def check_sat_outside_dashplus(model_name, path_name):

    # translate to alloy and create a .als file
    cmd = f"{dashplus} -alloy={method} -write {model_name}"
    (output,err,rc,time_taken) = run_command(cmd)
    if rc != 0:
        common_err_response(cmd, output, err, time_taken)
        return (0,1)

    # run alloy on the .als file
    alloy_model_name = f"{os.path.splitext(model_name)[0]}-{method}.als"
    # will run it for default command
    cmd = f"{alloy} {alloy_model_name}"
    (output,err,rc,time_taken) = run_command(cmd)
    if rc == 0:
        common_pass_response(model_name, output, err, time_taken)
        os.remove(alloy_model_name)
        return (1,0)
    else:
        common_err_response(cmd, output, err, time_taken)
        return (0,1)

if __name__ == "__main__":
    controller(check_sat_outside_dashplus) 