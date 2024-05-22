import json
import sys

# PATH = '/Users/adityashankarnarayanan/dashplus/my-models/properties/basic-states/BasicStatesNonDeterministic/BasicStatesNonDeterministic-trace.json'

PATH = sys.argv[1]

with open(PATH, 'r') as f:
    contents = f.read()
    parsed = json.loads(contents)

trace = parsed['trace_class']
snapshots = parsed['snapshots']

fqn_trace = []

for t in trace:
    if isinstance(t, list):
        l = []
        for ti in t:
            for snap in snapshots:
                if snap['name'] == ti:
                    l.append(snap['conf0'][0].replace("/", "_"))
        fqn_trace.append(l)
    
    elif isinstance(t, str):
        for snap in snapshots:
            if snap['name'] == t:
                fqn_trace.append(snap['conf0'][0].replace("/", "_"))
            
    # for snap in snapshots:
    #     if isinstance(t, str):
    #         if snap['name'] == t:
    #             fqn_trace.append(snap['conf0'][0].replace("/", "_"))
    #     elif isinstance(t, list):
    #         l = [s.replace("/", "_") for s in t]
    #         fqn_trace.append(l)

# dsh_trace = [s.replace("/", "_") for s in fqn_trace]


pred = "\n\npred trace_pred [\n"

num_snap = len(trace)

for i in range(num_snap):
    pred = pred + "s" + str(i+1) + ": one DshSnapshot"
    if i == num_snap - 1:
        pred = pred + "] {\n"
    else:
        pred = pred + ",\n"

for i in range(num_snap):
    if i == 0:
        pred = pred + "s1 = DshSnapshot/first &&\n"
    else:
        pred = pred + "s" + str(i+1) + " = s" + str(i) + ".DshSnapshot/next &&\n"

for i in range(num_snap):
    pred = pred + "s" + str(i+1) + ".dsh_conf0 = " # + fqn_trace[i][0]
    if isinstance(fqn_trace[i], list):
        pred = pred + fqn_trace[i][0]
        for j in range(1, len(fqn_trace[i])):
            pred = pred + " + " + fqn_trace[i][j] 
            
    elif isinstance(fqn_trace[i], str):
        pred = pred + fqn_trace[i]

    if i == num_snap - 1:
        pred = pred + "\n}\n"
    else:
        pred = pred + " &&\n"

cmd = "\nrun trace_pred for exactly " + str(num_snap) + " DshSnapshot"

# NEWPATH = '/Users/adityashankarnarayanan/dashplus/my-models/models/basic-states/BasicStatesNonDeterministic_trace.ver'

NEWPATH = sys.argv[2]
with open(NEWPATH, 'w') as f:
    f.write(pred)
    f.write(cmd)
