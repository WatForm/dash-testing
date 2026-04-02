
cp ../dashplus/app/build/libs/watform-dashplus.jar libs/
cd scripts
jenv local 17.0.16   
javac -cp ../libs/org.alloytools.alloy.dist.jar InstanceGenerator.java
javac -cp ../libs/org.alloytools.alloy.dist.jar InstanceChecker.java
unset JENV_VERSION
jenv local 25
cd ..

cd parsing-tests/catalyst
./download-corpus.sh
cd ..
jenv local 25
javac -cp ../libs/watform-dashplus.jar AntlrParsingTests.java

