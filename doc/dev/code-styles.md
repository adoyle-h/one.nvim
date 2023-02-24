# Code Styles

## First of all

- Your IDE must support [editorconfig](http://editorconfig.org/) and recognize the [`.editorconfig`](../../.editorconfig) file in project.
- All code and text must be written in English.

## File naming

All file names must match the regex `[a-z0-9-_]`, except `Dockerfile` and other particular files.

## Shell script code styles

- `[[ ... ]]` is preferred over `[ ... ]`, `test` and `/usr/bin/[`.
- Function declaration `func() {...}` is preferred over `function func() {...}`.
- Read-only Variables. Use `readonly` or `declare -r` to ensure they're read only.
- Local Variables. Declare function-specific variables with `local`. Declaration and assignment should be on different lines.
- Use `$(command)` instead of backticks.
- `eval` should be avoided in most scenarios.
- Constants and environment variable names must be all caps, separated with underscores.
