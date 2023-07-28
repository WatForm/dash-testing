# Language for testing Dash

## Requirements

- A test consists of a class of traces
- A test passes if one of the specified traces can be generated when the model is run
- The trace-class must be specifiable using LTL
- A trace is defined as a sequence of snapshots
- A snapshot is defined by assigning a value to each variable along with conf (which determines the states the system is in)

## Design

- Separate sections for defining snapshots and traces improve readability
- Using the regex analogue for w-languages can be used to specify traces
- json can be used to define variables since it naturally supports non-primitive tyes and since json parsers exist for most languages
- each snapshot can be given descriptive aliases to refer to them in traces.
- Example:

```
{
    snapshots:
[
{
    name: "s1"
    conf: ["root/s1"]
    variables: {v1:"val1"}
},
{
    name: "s2"
    conf: ["root/s2"]
    variables: {v1:"val1"}
}
]
    trace_class: ["s1","s2*",["s1","s2"],".*"]
}
```
- stuttering enabled by default so `*` is implicit
- `.` functions as a wildcard for any snapshot


Python script to do the following:

take three arguments as input
first is a string
second is a source path
third is a destination path (optional)
source path should pount to a .json file
destination path should point to a .ver file (throw error if either condition is violated)
if destination path is unspecified, make the destination path to be same as source but change extension to .ver
use json parser to read the source file
write it in stringified form to the destination file