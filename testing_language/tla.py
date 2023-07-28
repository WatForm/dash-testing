
def parse(data):
    return str(data)
    pass

def state(object):
    clause = ""
    conf = "conf = {"


    for i in len(object["conf"]):
        conf+=object["conf"][i]

    pass