# Parsing Alloy Tests

These tests are completed on a corpus of Alloy models previously collected called catalyst (available at https://github.com/WatForm/dashplus/releases/download/catalyst-corpus-v1/catalyst-corpus.zip).

`cd catalyst`
`./download-corpus.sh`, which will download the zip (github release), unzip it, and move problematic files
`cd ..`
`jenv local 25`
`javac -cp ../libs/watform-dashplus.jar AntlrParsingTests.java`
`java -cp .:../libs/watform-dashplus.jar AntlrParsingTests`

- It also tests for the generation of our Alloy AST objects, AlloyModel constructor, and the toString does not throw exceptions. 
- It also checks the toString return from AlloyModel.toString() will parse again
- But it DOES NOT check if AlloyFile.toString() produces the same string

