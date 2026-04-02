import config
from controller import *
import os

def check_dash_model_to_dash_file_is_syntactically_correct(model_name, path_name):
    if model_name.endswith("-resolved.dsh"):
        # these will be in the count, but overwritten when we get
        # to the actual model and then removed if passes
        return (0,0)

    # write the DashFile of the model
    cmd = f"{config.dashplus} -write {model_name}"
    (output,err,rc, time_taken) = run_command(cmd)
    if rc != 0:
        common_err_response(cmd, output, err, time_taken)
        return (0,1)
    
    # read the file of the DashFile written above
    resolved_model_name = os.path.splitext(model_name)[0] + "-resolved.dsh"
    cmd = f"{config.dashplus} {resolved_model_name}"
    (output,err,rc, time_taken) = run_command(cmd)
    if rc == 0:
        common_pass_response(resolved_model_name, output, err, time_taken)
        os.remove(resolved_model_name)
        return (1,0)
    else:
        common_err_response(cmd, output, err, time_taken)
        return (0,1)

if __name__ == "__main__":
    controller(check_dash_model_to_dash_file_is_syntactically_correct) 