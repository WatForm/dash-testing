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
    for s in snapshots:
        if s['name'] == t:
            fqn_trace.append(s['conf0'][0])

dsh_trace = [s.replace("/", "_") for s in fqn_trace]

pred = "\n\npred trace_pred [\n"

for i in range(len(dsh_trace)):
    if i == len(dsh_trace) - 1:
        pred = pred + "s" + str(i+1) + ": one DshSnapshot] {\n"
    else:
        pred = pred + "s" + str(i+1) + ": one DshSnapshot,\n"

for i in range(len(dsh_trace)):
    if i == 0:
        pred = pred + "s1 = DshSnapshot/first &&\n"
    else:
        pred = pred + "s" + str(i+1) + " = s" + str(i) + ".DshSnapshot/next &&\n"

for i in range(len(dsh_trace)):
    pred = pred + "s" + str(i+1) + ".dsh_conf0 = " + dsh_trace[i]
    if i == len(dsh_trace) - 1:
        pred = pred + "}\n"
    else:
        pred = pred + " &&\n"

cmd = "\nrun trace_pred for exactly " + str(len(dsh_trace)) + " DshSnapshot"

# NEWPATH = '/Users/adityashankarnarayanan/dashplus/my-models/models/basic-states/BasicStatesNonDeterministic_trace.ver'

NEWPATH = sys.argv[2]
with open(NEWPATH, 'w') as f:
    f.write(pred)
    f.write(cmd)
