# dash-testing
Integration testing for Dash translations to other languages

## Running tests

## Adding models and tests

- Models are added in the appropriate folder inside the 'models' folder as a `.dsh` file.

- If the model is named `<model>.dsh`, then the test for the i<sup>th</sup> property is named `<model>-prop<i>.json` and stored in the same folder as `<model>.dsh`

## Adding language support

- A folder named `dash2<x>` is created at the top-level, where `<x>` is the target language

- A file named `script.py` is created in this folder. This script is repsonsible for running all tests related to language `<x>`

- Appropriate changes are made to the `.gitignore` file to exclude those artefacts that are generated automatically by the script

