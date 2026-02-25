#!/bin/bash

# Usage: ./script.sh <base_filename>
# Example: ./script.sh simple

# this script implicitly refers to the files in simple-alloy-models


BASE_NAME=$1

# java -cp ./app/build/libs/watform-dashplus.jar ca.uwaterloo.watform.dashtotla.Main "../dashplus-aux/dash-models/${BASE_NAME}.dsh" "../dashplus-aux/tlaplus-models/"

java -jar ./app/build/libs/watform-dashplus.jar -tla ../dash-testing/simple-alloy-models/${BASE_NAME}.als -v -d; 