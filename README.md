# Dash Testing Repository

This repository contains three independent methods for testing Dash/Dash+.  Each subdirectory contains its own README.

1. json-traces-testing uses manually created models with .json files described traces that a model should/should not contain.  It includes scripts to create models in Alloy and TLA+ from the Dash model to automatically check if the model does/does not have the traces described in the .json files.

2. fuzz-testing includes code to create random Dash ASTs and ensure that these 1) translate to Alloy and are satisfiable in Alloy; and 2) translate to TLA+ and ...??  These models do not have any properties associated with them.

3. case-studies included real models with real properties and scripts to test that these translate to Alloy for the three methods of traces, tcmc, and electrum and get the correct results.  The properties are handwritten for each method and concatenated with the translated model.  What do we want to do for TLA+ for these?