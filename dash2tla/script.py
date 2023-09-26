import tla

def generate(data, args):
    # arg[0] decides if debug output shown
    debug = False
    if len(args) > 0:
        if args[0] == '-d' or args[0] == '--debug':
            debug == True
    tla.parse(data, debug)
    pass