"""
Explaining the logic of existential quantifier using strings:

Let S be a set of strings

claim: "ABC" belongs to S

One needs to write this claim using only universal quantifier over S.

This can be written as:

:math:`\exists x \in S: x = "ABC"`

:math:`\exists x : P(x) = ~Ax:~P(x)`

so it can be written as:

:math:`~(\forall x \in S: x != "ABC")`

Let :math:`x = PQR`

:math:`x != ABC` can be written as:

:math:`P!="A" \/ Q!="B" \/ R!="C"`

Idea: assert the opposite and get it to generate a counterexample - thus the presence of an error confirms the assertion
"""

from syntax import *


def parse(data, debug):
    """
    Top-level function which produces the (TODO: what does it produce?), `debug=True` prints verbose output to stdout.
    """

    objects = data["snapshots"]

    debug_out = ""

    for x in objects:

        debug_out+=("\n"+x["name"]+" = "+state(x))

    if debug:
        print(debug_out)

    result = ""

    if "quantifier" in data and data["quantifier"] == "forall":
        result = result + for_all(data, debug)
        result = result + "\n" + "forall"
    else:
        result = result + there_exists(data, debug)
        result = result + "\n" + "exists"
    if "limit" in data:
        result = result + "\n"+ str(data["limit"])
    else:
        result = result + "\n" + str(len(data["trace_class"]))
    if "expected_result" in data and not data["expected_result"]:
        result = result + "\nfalse"
    else:
        result = result + "\ntrue"
    return result


def get_object_named(snapshots,x):
    """
    `snapshots` is a list of dictionary objects, all of whom have "name" as a required field. This function returns the object whose name is `x`.


    For instance: if snapshots = [{"name":"t","v1":"v2"...},...], then get_object_named(snapshots,"name") returns snapshots[0].
    """

    for o in snapshots:

        if o["name"] == x:

            return o

    return None




def state(object): # clause which says that system is in current state
    """
    returns a string clause which says that the system is in the state described by the object
    """

    clause = ""

    conf = "{" + getList(enclose(object["conf0"],"\"","\"")," , ") + "}"

    clause = clause + conf_name+" "+EQUAL+" "+conf

    if not "variables" in object.keys():
        return clause

    variables = []

    for x in object["variables"].keys():

        variables.append(x+" "+EQUAL+" "+object["variables"][x])

    return clause+" "+AND+" "+getList(variables," "+AND+" ")


def enclose(arr, start, end): # enclose each string in arr with start and end

    arr_new = []

    for x in arr:

        arr_new.append(start+x+end)

    return arr_new



def getList(arr, sep): # turn arr of strings into a single string with sep as separator
    list = ""

    for i in range(len(arr)):

        list+=arr[i]

        if not i == len(arr)-1:
            list+=sep

    return list


def for_all(data, debug=False): # property to test if all traces are members of the trace-class
    
    c=-1
    and_list = []
    and_list_debug = []

    for i in range(len(data["trace_class"])):
        x = data["trace_class"][i]
        c+=1

        if isinstance(x, str):
            if x == ".": # in case of ., there is no condition to check for
                continue
            xo = get_object_named(data["snapshots"],x)
            if xo == None:
                return "Error: "+x+" is not defined in the input"

            s = ct+" "+EQUAL+" "+str(c)+" "+IMPLIES+" "+parenthesis(state(xo))
            s_debug = str(c)+" "+IMPLIES+" "+x
            and_list.append(G(s))
            and_list_debug.append(G(s_debug))
            pass

        else:
            or_list = []
            or_list_debug = []
            for y in x:
                yo = get_object_named(data["snapshots"],y)
                if yo == None:
                    return "Error: "+y+" is not defined in the input"
                or_list.append(state(yo))
                or_list_debug.append(y)

            and_clause = getList(enclose(or_list,"(",")"),OR)
            and_clause_debug = getList(enclose(or_list_debug,"",""),OR)
            and_list.append(G(ct+" "+EQUAL+" "+str(c)+" "+IMPLIES+" "+parenthesis(and_clause)))
            and_list_debug.append(G(str(c)+" "+IMPLIES+" "+parenthesis(and_clause_debug)))
            pass
    
    if debug:
        print("formula:"+getList(enclose(and_list_debug," "," "),AND))
    return getList(enclose(and_list,"(",")"),AND)


def there_exists(data, debug=False): # property to verify that at least one trace is part of the trace-class

    c=-1
    or_list = []
    or_list_debug = []

    for i in range(len(data["trace_class"])):
        x = data["trace_class"][i]
        c+=1

        if isinstance(x, str):
            if x == ".": # in case of ., there is no condition to check for
                continue
            xo = get_object_named(data["snapshots"],x)
            if xo == None:
                return "Error: "+x+" is not defined in the input"

            s = ct+" "+EQUAL+" "+str(c)+" "+IMPLIES+" "+NOT+parenthesis(state(xo))
            s_debug = str(c)+" "+IMPLIES+" "+NOT+x
            or_list.append(G(s))
            or_list_debug.append(G(s_debug))
            pass

        else:
            or_list_inner = []
            or_list_inner_debug = []
            for y in x:
                yo = get_object_named(data["snapshots"],y)
                if yo == None:
                    return "Error: "+y+" is not defined in the input"
                or_list_inner.append(state(yo))
                or_list_inner_debug.append(y)

            or_clause = getList(enclose(or_list_inner,"(",")"),OR)
            or_clause_debug = getList(enclose(or_list_inner_debug,"",""),OR)
            or_list.append(G(ct+" "+EQUAL+" "+str(c)+" "+IMPLIES+" "+NOT+parenthesis(or_clause)))
            or_list_debug.append(G(str(c)+" "+IMPLIES+" "+NOT+parenthesis(or_clause_debug)))
    
    if debug:
        print("formula:"+getList(enclose(or_list_debug,"",""),OR))
    return getList(enclose(or_list,"(",")"),OR)


    

