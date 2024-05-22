# dash-testing
Integration testing for Dash translations to other languages


## Writing a test

A test is a `.json` file which contains the following fields:

```
{
    "snapshots":
    [
        {
            "name":<name>
            "conf0":[
                // leaf states in conf0
            ]
            // properties of variables
        },
    ]
    "trace_class":[]
    "quantifier": (either "forall" or "exists", "exists" by default)
    "expected_result": (true by default)
    "limit": (length of trace_class by default)
    "description": (ignored by script, used to comment)
}
```

The trace class is a representation of a set of valid traces.

- if the i<sup>th</sup> element is `name`, then `name` must appear in the i<sup>th</sup> position of every trace in the set

- if the i<sup>th</sup> element is a list of `names`, then one of those `names` must appear in the i<sup>th</sup> position of every trace in the set

- if the i<sup>th</sup> element is simply `"*"` then there is no restriction on what `name` appears in the i<sup>th</sup> position of a trace in the set

The `limit` field determines the maximum value of the length of traces to be explored.

The test is considered `pass` if the running of the test results in success or failure as expected:

- `expected_value=true` and `success` implies `PASS`
- `expected_value=false` and `fail` imples `PASS`
- else `FAIL`

Interpreting `quantifier`:

- `"exists"` checks if there exists some trace produced by the model is in the trace-class.

- `"forall"` checks if all traces produced by the model are in the trace class.


## Adding models and tests

- Models are added in the appropriate folder inside the 'models' folder as a `.dsh` file.

- Each model is stored in its own folder with the same name.

- If the model is named `<model>.dsh`, then the test for the i<sup>th</sup> property is named `<model>-trace_prop<i>.json` and stored in the same folder as `<model>.dsh`

## Running the script

The script ought to be run when inside the root folder of the repository. The general format to run the script is:

```
python main.py <language> <arg_list>
```

None of the arguments are to be preceded with `-` or `--`

For further information about the `<arg_list>`, it is suggested that the following be run:

```
python main.py <language> help
```

This produces the relevant information for the given language, provided the developer has implemented a `help` command


## Adding language support

- A folder named `dash2<x>` is created at the top-level, where `<x>` is the target language. All modifications are done in this folder. No language-specific changes are to be made outside this folder

- A file named `script.py` is created in this folder. This script contains all the top-level functions that the user is expected to be able to access.

- Any imports into `script.py` must be defined relative to the parent folder of `main.py`, not the folder `dash2<x>`

- `script.py` is to have a function `main(args)` which is given all additional arguments given to the top-level script.

- Any environment variables the user is expected to set is put into `dash2<x>/config.json`. For instance, commands to execute external programs.

- Information about available commands is to be displayed when the `help` argument is passed to `main()`

