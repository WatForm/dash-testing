#!/bin/bash

# Usage: ./script.sh <base_filename>
# Example: ./script.sh simple

BASE_NAME=$1


export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
java --version
cd ./org.alloytools.alloy
./gradlew build

java -cp ../org.alloytools.alloy/org.alloytools.alloy.dist/target/org.alloytools.alloy.dist.jar ca.uwaterloo.watform.dash4whole.Dash

java -cp ../org.alloytools.alloy/org.alloytools.alloy.dist/target/org.alloytools.alloy.dist.jar ca.uwaterloo.watform.dash4whole.Dash -t "../dash-models/${BASE_NAME}.dsh"