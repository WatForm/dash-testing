import config
from controller import *
import os

def test_dash_model_to_tla_model_is_translateable(model_name, path_name):

    

    # write the DashFile of the model

    # java -jar ./app/build/libs/watform-dashplus.jar
    dashplus = "java -ea -jar ../dashplus/app/build/libs/watform-dashplus.jar "

    cmd = f"{config.dashplus} -tla {path_name}"

    print("path "+path_name)

    (output,err,rc, time_taken) = run_command(cmd)
    if rc != 0:
        common_err_response(cmd, output, err, time_taken)
        return (0,1)
    

if __name__ == "__main__":
    controller(test_dash_model_to_tla_model_is_translateable) 