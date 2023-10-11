from dash2tla.syntax import *


def parse(data, debug):

    objects = data["snapshots"]

    result = ""

    for x in objects:

        result+=("\n"+x["name"]+" = "+state(x))

    if debug:
        print(result)

    if "forall" in data and data["forall"]:

        return for_all(data, debug)

    else:

        return there_exists(data, debug)
    pass


def get_object_named(snapshots,x):

    for o in snapshots:

        if o["name"] == x:

            return o

    return None




def state(object): # clause which says that system is in current state

    clause = ""

    conf = "{" + getList(enclose(object["conf0"],"\"","\"")," , ") + "}"

    clause = clause + conf_name+" == "+conf

    if not "variables" in object.keys():
        return clause

    variables = []

    for x in object["variables"].keys():

        variables.append(x+" == "+object["variables"][x])

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
    
    ct=-1
    and_list = []
    and_list_debug = []

    for i in range(len(data["trace_class"])):
        x = data["trace_class"][i]
        ct+=1

        if isinstance(x, str):
            if x == ".": # in case of ., there is no condition to check for
                continue
            xo = get_object_named(data["snapshots"],x)
            if xo == None:
                return "Error: "+x+" is not defined in the input"

            s = "ct == "+str(ct)+IMPLIES+parenthesis(state(xo))
            s_debug = str(ct)+" "+IMPLIES+" "+x
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
            and_list.append(G("ct == "+str(ct)+" "+IMPLIES+parenthesis(and_clause)))
            and_list_debug.append(G(str(ct)+" "+IMPLIES+" "+parenthesis(and_clause_debug)))
            pass
    
    if debug:
        print("formula:"+getList(enclose(and_list_debug," "," "),AND))
    return getList(enclose(and_list,"(",")"),AND)
    pass


def there_exists(data, debug=False): # property to verify that at least one trace is part of the trace-class

    ct=-1
    or_list = []
    or_list_debug = []

    for i in range(len(data["trace_class"])):
        x = data["trace_class"][i]
        ct+=1

        if isinstance(x, str):
            if x == ".": # in case of ., there is no condition to check for
                continue
            xo = get_object_named(data["snapshots"],x)
            if xo == None:
                return "Error: "+x+" is not defined in the input"

            s = "ct == "+str(ct)+IMPLIES+NOT+parenthesis(state(xo))
            s_debug = str(ct)+" "+IMPLIES+" "+NOT+x
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
            or_list.append(G("ct == "+str(ct)+" "+IMPLIES+NOT+parenthesis(or_clause)))
            or_list_debug.append(G(str(ct)+" "+IMPLIES+" "+NOT+parenthesis(or_clause_debug)))
            pass
    
    if debug:
        print("formula:"+getList(enclose(or_list_debug," "," "),OR))
    return getList(enclose(or_list,"(",")"),OR)

    pass
    

