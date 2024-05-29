"""
stores all config data in a dict
"""

CONFIG = {
    "translation_command":"java -cp ../org.alloytools.alloy/org.alloytools.alloy.dist/target/org.alloytools.alloy.dist.jar ca.uwaterloo.watform.dash4whole.Dash -tla",
    "run_command":"java -jar ../software/toolbox/tla2tools.jar",
    "shell":False,
    "regex_include_files":[
        ".*Bistable.*",
        "BasicStates.*",
        "concurrency.*"
    ]
}

def get_config():
    """
    getter function for `config`
    """
    global CONFIG
    return CONFIG