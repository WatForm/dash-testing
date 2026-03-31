# Dash Testing Repository

## Setup
* assumes dashplus is a sister directory to dash-testing
	`./setup.sh`
This puts the dashplus jar in the libs directory, downloads the parsing tests, and compiles the Java scripts.

## Parsing Tests

* follow the instructions in parsing-tests/README.md

## Correctness Tests

* choose options in scripts/config.py

### Translation to Alloy
* Test Translation to Alloy Directly within Dashplus 
	* `python3 check_sat_inside_dashplus.py`
* Test Translation to Alloy by generating a .als file and running the AA on it 
	* `python3 check_sat_outside_dashplus.py`
* use config.py to choose different methods of traces/tcmc/electrum

### DashModel -> DashFile
* Test DashFile generated is syntactically correct
`python3 check_dash_model_to_dash_file_is_syntactically_correct.py`

* Test DashFile Model is equivalent for input and output DashFile
	- (java) need a script
	- java script depending on dashplus jar model.dsh model_resolved.dsh; checks if they are equal
	- check its output in java program; return 1/0
	- no clean up

### Property Checking

* python per model.dsh
* model_method_prop_result.ver files contain one command in them
	* .ver files use complete big steps/stutter, etc.
* create merged .dsh file for each model_method_prop_result.dsh
* sat or unsat is in file name
	dashplus -alloy=method -cmd=1 model_method_prop_result.dsh
* python check result in output
* clean up model_method_prop_result.dsh

### Checking Scopes for Enough Ops??

#task

### Instance Checking

* for regression testing
* dashplus -alloy=method -write model.dsh to create Alloy file
* collect all xml files for model_method_Y.xml
* java -cp .:../libs/org.alloytools.alloy.dist.jar InstanceChecker model_method.als model_method_Y.xml 
* clean up model_method.als

### Translation to TLA

* merges .dsh and .ver files
* creates .tla and .cfg files

## Models Directory Organization
* at any level of nesting #task
	- file called X.dsh 
	- any number of X_method_prop_result.ver files in it
		- method is "traces/electrum/tcmc"
		- X and prop may have dashes in them
		- result is "sat/unsat"
		- .ver files contains scopes; if want to run at different scopes, create multiple files
		- a single command in .ver files
		- property may contains: strongnostutter, single input assumption, complete big steps
	- any number of X_method_num.xml (traces that should be in model X_method)
* often one .dsh model per directory but this is not required
* scripts overwrite any existing extra files
* clean up is done within script

# Leftover

This repository contains three independent methods for testing Dash/Dash+.  Each subdirectory contains its own README.

1. json-traces-testing uses manually created models with .json files described traces that a model should/should not contain.  It includes scripts to create models in Alloy and TLA+ from the Dash model to automatically check if the model does/does not have the traces described in the .json files.

2. fuzz-testing includes code to create random Dash ASTs and ensure that these 1) translate to Alloy and are satisfiable in Alloy; and 2) translate to TLA+ and ...??  These models do not have any properties associated with them.

# Dash Testing How To Use

## Remaining Tasks
* get some sat and unsat properties for all


## Setup: Instance Generation

* Create .xml files of .dsh model for regression testing
#task
	- run for default scopes no cmd
	- run for larger scopes no cmd
	- run for cmds?
	- generates .class files, which are in .gitignore

		


