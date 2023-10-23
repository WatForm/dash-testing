conf_name = "_conf"
PROPERTY = "Prop"
INVARIANT = "Inv"
ct = "_ct"
ct_prime = ct+"'"
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