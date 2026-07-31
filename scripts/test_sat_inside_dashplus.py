import config
from controller import *



def test_sat_inside_dashplus(model_name):
    cmd = f"{config.dashtoalloy} -alloy={config.method} {model_name}"
    (output,err, rc, time_taken) = run_command(cmd)
    # note that SAT is a prefix of UNSAT
    if rc == 0 and ("SAT" in output) and not("UNSAT" in output):
        common_pass_response(model_name, output, err, time_taken)
        return (1,0)
    else:
        common_err_response(cmd, output, err, time_taken)
        return (0,1)

if __name__ == "__main__":
    controller(test_sat_inside_dashplus) 