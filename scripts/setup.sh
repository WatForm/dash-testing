
cp ../../dashplus/app/build/libs/dashtoalloy.jar ../libs/
jenv local 17.0.16   
javac -cp ../libs/org.alloytools.alloy.dist.jar InstanceGenerator.java
javac -cp ../libs/org.alloytools.alloy.dist.jar InstanceChecker.java
unset JENV_VERSION
jenv local 25
cd ..



