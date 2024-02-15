from dash2tla.lib import *

DEST = "./dash2tla/workspace/"

def custom():
    num = 128
    cus("TwoStateOscillatorUnstable",1,num)
    cus("TwoStateOscillatorUnstable",2,num)
    cus("TwoStateOscillatorUnstable",3,num)
    cus("TwoStateOscillatorUnstable",4,num)
    cus("TwoStateOscillatorUnstable",11,num)
    cus("TwoStateOscillatorUnstable",21,num)
    cus("TwoStateOscillatorUnstable",31,num)
    cus("TwoStateOscillatorUnstable",41,num)

def cus(model_name, num, r):
    output_file = DEST+model_name+"_test"+str(num)+"_results.json"
    path = "./models/basic-states/"+model_name+"/"
    model = path+model_name+".dsh"
    test = path+model_name+"-trace_prop"+str(num)+".json"
    results = {}
    for j in range(r):
        i = j+1
        print(i)
        results[str(1024*i)] = (foo(model,test,1024*i,model_name))
    with open(output_file,"w") as op:
        data = {"result":results}
        json.dump(data, op, indent=4)


    

def foo(path_to_model, path_to_test, length, model_name):
    translate_model(path_to_model,DEST+"foo.tla")

    with open(path_to_test, 'r') as input_file:
        data = json.load(input_file)

    # Insert a new field into the JSON data
    data['limit'] = str(length)

    # Write the modified JSON data to another location
    with open(DEST+"foo.json", 'w') as output_file:
        json.dump(data, output_file, indent=4)

    translate_test(DEST+"foo.json",DEST+"foo.ver",False)
    setup_test(DEST+"foo.tla",DEST+"foo.ver",DEST+model_name+".tla")
    data = run_test(DEST+"foo.ver",DEST+model_name+".tla", False)

    cfg_file_path = "./dash2tla/test_conf.cfg"
    cmd = "perf stat -e cycles "+conf["run_command"]+" -config "+cfg_file_path + " " + DEST+model_name+".tla"
    shell = conf['shell']

    completed_process = subprocess.run(
        cmd,
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )
    out = completed_process.stderr
    return {"data":data,"perf":out}

    # goes to dash model
    # translates it with test provided and length overwritten
    # runs it and measures everything
    # returns dict with results in dict

    pass
