"""
Stores all the TLA+ keywords and other reserved names as text, to be referenced as symbols in other parts of the script
"""


conf_name = "_conf"
PROPERTY = "Prop"
ct = "_ct"
ct_prime = ct+"'"
n = "n"
EOF = "===="
VARIABLES = "VARIABLES"
MODULE = "MODULE"
INIT = "Init"
NEXT = "Next"
TRANSITION = "_transition"
STUTTER = "_stutter"
DEFINITION = "=="
EQUAL = "="
LESSER = "<"
AND = "/\\"
OR = "\\/"
NOT = "~"
IMPLIES = "=>"
def G(x):
    """
    TLA+ syntax for "x always true in the future"
    """
    return "[]"+parenthesis(x)
def F(x):
    """
    TLA+ syntax for "x eventually true in the future"
    """
    return "<>"+parenthesis(x)
def parenthesis(x):
    """
    TLA+ syntax for paranthesis (to specify order of evaluation)
    """
    return "("+x+")"
IF = "IF"
ELSE = "ELSE"
THEN = "THEN"
INCREMENT = "_Increment"