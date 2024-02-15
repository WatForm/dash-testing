SHAPE_AND = "hexagon"
COLOR_AND = "red"
TRANSITION_STYLE = "dotted"
TRANSITION_COLOR = "blue"

transcript = "Digraph\n{"

def write_state(state, is_and=False):
    global transcript
    transcript+="\n"+state.name
    if is_and:
        transcript+="[color="+COLOR_AND+"]"
    state_names = []
    for x in state.OR:
        state_names.append(x.name)
        write_state(x)
        transcript+="\n"+state.name+" -> "+x.name
    for x in state.AND:
        state_names.append(x.name)
        write_state(x,True)
        transcript+="\n"+state.name+" -> "+x.name+"[color="+COLOR_AND+"]"
    transcript+="{rank=same; "
    for name in state_names:
        transcript+=name+"; "
    transcript+="}"

def write_transition(root_state):
    global transcript
    for x in root_state.AND:
        write_transition(x)
    for x in root_state.OR:
        write_transition(x)
    for x in root_state.transitions:
        x_from = root_state
        if x.from_:
            x_from = x.from_
        transcript+="\n"+x_from.name+" -> "+x.goto.name+" [style="+TRANSITION_STYLE+",color="+TRANSITION_COLOR+"]"
    

def write_to_graph(root_state):
    global transcript
    write_state(root_state)
    write_transition(root_state)
    transcript+="\n}"
    with open('fuzz.dot', 'w') as file:
        # Write the content of transcript to the file
        file.write(transcript)



