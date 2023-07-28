# Operators:

- always []
- eventually <>
- leads to ~>

# Simplifications:

- `[](x)` is same as `TRUE ~> x`
- `<>(x)` is reduced using duality

Thus `~>` captures all expressive power

# Grammar:

- The test is a sequence of lists of acceptable states
- Each list may or may not have a `*` to allow stuttering. Usually, the `*` is expected.
- The `.` acts as a wild-card. Tests end with  `.*` usually.
- For TLA, `*` makes no real difference since there is no way to turn off stuttering.

