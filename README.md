# dash-testing
Integration testing for Dash translations to other languages

## Adding models and tests

- Models are added in the appropriate folder inside the 'models' folder as a `.dsh` file.

- If the model is named `<model>.dsh`, then the test for the i<sup>th</sup> property is named `<model>-prop<i>.json` and stored in the same folder as `<model>.dsh`

## Adding language support

- A folder named `dash2<x>` is created at the top-level, where `<x>` is the target language. All modifications are done in this folder. No language-specific changes are to be made outside this folder

- A file named `script.py` is created in this folder. This script contains all the top-level functions that the user is expected to be able to access.

- Any imports into `script.py` must be defined relative to the parent folder of `main.py`, not the folder `dash2<x>`

- All functions in `script.py` is to have a single parameter named `args`

- One of the functions in `script.py` is to be named `help`, which is to display all relevant information about the language module when called.

- Any environment variables the user is expected to set is put into `dash2<x>/config.json`. For instance, commands to execute external programs.

