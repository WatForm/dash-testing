# config

# defaults
dashplus = "java -ea -jar ../libs/watform-dashplus.jar "

# table gives output if sat; no output if not sat
alloy = "java -jar ../libs/org.alloytools.alloy.dist.jar exec -o - -f -t table"

sources = [
			'../models/',
			]
verbose = True
stop_on_first_fail = True
timeout = 30000 # ms
method = "traces"

def setup(who):
	global dashplus
	global alloy
	global sources 
	global verbose
	global stop_on_first_fail
	global timeout
	global method
	if who == "nad":
		print("Nancy's settings")
		# don't bother with setup each time; just run from sister directory
		dashplus = "java -ea -jar ../../dashplus/app/build/libs/watform-dashplus.jar "
		sources = [
			#'../models/case-studies/2019-dash-website/bit-counter/',
			#'../models/case-studies/2019-dash-website', 
			#'../models/case-studies/2022-bandali-thesis', 
			#'../models/case-studies/2022-tamjid-thesis',
			#'../models/case-studies/2023-bandali-day-paper',
			'../models/testing',
			]
		verbose = False
		stop_on_first_fail = False
		timeout = 30000 # ms
		method = "traces"
	#elif who == "mkj":
		# Mathew can set his own values for the script parameters here
	






