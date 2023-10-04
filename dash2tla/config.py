conf_name = "_conf"
ct = "_ct"
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