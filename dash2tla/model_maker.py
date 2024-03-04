class State:
    def __init__(self, n):
        self.name = n
        self.transitions = []
        self.events = []
        self.AND = []
        self.OR = [] # default is OR[0]
    def toStringRep(self):
        s = []
        s.append("state "+self.name)
        s.append("{")
        for e in self.events:
            s.append(e.toStringRep())
        for t in self.transitions:
            s.append(t.toStringRep())
        for st in self.AND:
            sr = st.toStringRep()
            sr[0] = "conc "+sr[0]
            s.append(sr)
        if len(self.OR) != 0:
    
            sr_def = self.OR[0].toStringRep()
            sr_def[0] = "default "+sr_def[0]
            s.append(sr_def)
            for i in range(1,len(self.OR)):
                s.append(self.OR[i].toStringRep())
        
        s.append("}")
        return s


class Transition:
    
    name = ""
    def __init__(self, n):
        self.name = n
        self.on = None # event
        self.goto = None # state
        self.send = None # event
        self.from_ = None # state
    def toStringRep(self):
        s = []
        s.append("trans "+self.name)
        s.append("{")
        sr = []
        if self.from_:
            sr.append("from "+self.from_.name)
        if self.on:
            sr.append("on "+self.on.name)
        if self.goto:
            sr.append("goto "+self.goto.name)
        if self.send:
            sr.append("send "+self.send.name)
        s.append(sr)
        s.append("}")
        return s

class Event:
    name = ""
    def __init__(self, n):
        self.name = n


def printStringRep(stringrep, offset): #stringrep is an array were each element is array or a string, tree structure
    s = ""
    tab = "\t"*offset
    for x in stringrep:
        if isinstance(x, list):
            s = s+printStringRep(x, offset+1)
        else:
            s = s+tab+x+"\n"
    return s