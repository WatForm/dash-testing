cd parsing-tests/catalyst
./download-corpus.sh
cd ..
jenv local 25
javac -cp ../libs/watform-dashplus.jar AntlrParsingTests.java