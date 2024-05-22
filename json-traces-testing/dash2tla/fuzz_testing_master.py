from fuzz import *
from visualize import *
import sys

print(sys.argv[1])

set_paths(output=sys.argv[1],dot=sys.argv[2])

fuzz_main()