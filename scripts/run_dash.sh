#!/bin/bash

# Usage: ./script.sh <base_filename>
# Example: ./script.sh simple

BASE_NAME=$1

# this script implicitly refers to the files in simple-dash-models

# java -cp ./app/build/libs/watform-dashplus.jar ca.uwaterloo.watform.dashtotla.Main "../dashplus-aux/dash-models/${BASE_NAME}.dsh" "../dashplus-aux/tlaplus-models/"

java -jar ./app/build/libs/watform-dashplus.jar -tla ../dash-testing/simple-dash-models/${BASE_NAME}.dsh -v -s -d; 