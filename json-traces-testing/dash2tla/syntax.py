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
    return "[]"+parenthesis(x)
def F(x):
    return "<>"+parenthesis(x)
def parenthesis(x):
    return "("+x+")"
IF = "IF"
ELSE = "ELSE"
THEN = "THEN"
INCREMENT = "_Increment"