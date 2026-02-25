

# Usage: ./script.sh <base_filename>
# Example: ./script.sh simple

BASE_NAME=$1

# java -cp ./app/build/libs/watform-dashplus.jar ca.uwaterloo.watform.dashtotla.Main "../dashplus-aux/dash-models/${BASE_NAME}.dsh" "../dashplus-aux/tlaplus-models/"

java -jar ./app/build/libs/watform-dashplus.jar -alloy traces -write ../dashplus-aux/dash-models/${BASE_NAME}.dsh; 