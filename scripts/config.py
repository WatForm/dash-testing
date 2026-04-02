# config

sources = [
	#'../models/case-studies/2019-dash-website/bit-counter/',
	#'../models/case-studies/2019-dash-website', 
	#'../models/case-studies/2022-bandali-thesis', 
	#'../models/case-studies/2022-tamjid-thesis',
	#'../models/case-studies/2023-bandali-day-paper',
	'../models',
	]

verbose = False
stop_on_first_fail = True
timeout = 30000 # ms
method = "traces"

dashplus = "java -ea -jar ../../dashplus/app/build/libs/watform-dashplus.jar "
#dashplus = "java -ea -jar ../libs/watform-dashplus.jar "

# table gives output if sat; no output if not sat
alloy = "java -jar ../libs/org.alloytools.alloy.dist.jar exec -o - -f -t table"
