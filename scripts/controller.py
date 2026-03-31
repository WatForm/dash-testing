# General script for common parts of dash-testing operations

from config import *
import os
import sys
import subprocess
import time 

RED = "\033[31m"
RESET = "\033[0m"
MAGENTA = "\033[35m"
BLUE = "\033[34m"

def controller(func_per_dsh_model):

    count_pass = 0
    count_fail = 0
    for source in sources:
        print('Searching source:', source)

        for root, dirs, files in os.walk(source):
            for file in files:
                fragment_path = str(os.path.join(root, file))
                if file.endswith(".dsh"):
                    (cnt_pass, cnt_fail) = func_per_dsh_model(fragment_path, root)
                    count_pass += cnt_pass 
                    count_fail += cnt_fail

    print("Passed: ", count_pass)
    print("Failed: ", count_fail)


def run_command(cmd):
    if verbose:
        print("Running:", cmd)
    start = time.perf_counter()
    with subprocess.Popen(
        cmd,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        universal_newlines=True,
        shell=True
    ) as p:
        try:
            (output, err) = p.communicate(timeout=timeout)
            rc = p.returncode
            end = time.perf_counter()
            elapsed = end - start
            return (output, err, rc, elapsed)

        except subprocess.TimeoutExpired:
            p.kill()
            (output, err) = p.communicate()
            rc = p.returncode
            end = time.perf_counter()
            elapsed = end - start
            return ("", "Timeout", 1, elapsed)

def common_err_response(cmd, output, err, time_taken):
    if time_taken >= timeout:
        print(f"{RED}TEST RESULT: ERROR, {cmd}, time: TIMEOUT {timeout}{RESET}")
    else:
        print(f"{RED}TEST RESULT: ERROR, {cmd}, time: {time_taken}{RESET}")
    print(f"{RED}{output}{RESET}")
    print(f"{MAGENTA}{err}{RESET}")
    
    if stop_on_first_fail:
        sys.exit(1);

def common_pass_response(model, output, err, time_taken):
    if verbose:
        # eventually we may want to record this in a csv file
        print(f"{BLUE}TEST RESULT: PASS, {model}, {time_taken}{RESET}")
