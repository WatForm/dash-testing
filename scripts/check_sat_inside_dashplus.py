from config import *
from controller import *



def check_sat_inside_dashplus(model_name, path_name):
    cmd = f"{dashplus} -alloy={method} {model_name}"
    (output,err, rc, time_taken) = run_command(cmd)
    if rc == 0 and "SAT" in output:
        common_pass_response(model_name, output, err, time_taken)
        return (1,0)
    else:
        common_err_response(cmd, output, err, time_taken)
        return (0,1)

if __name__ == "__main__":
    controller(check_sat_inside_dashplus) 