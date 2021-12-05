# C project template
A template for C projects of any sorts

## How to use
Write your files in the `src` folder. Any header files should be put in `include`. A complex tree structure inside both folders may be utilised, all of the files will still compile. The `work-directory` is what the executable will see as the root directory `./`

## Compilation and debugging
Configuration for debugging in VSCode is provided, although it might need some tweaking
accoding to the system. The following commands may be used for:
- Building a debuggable executable on windows: `make debug-build-win`
- Building a debuggable executable on linux: `make debug-build`
- Building on windows: `make build-win`
- Building on linux: `make`
A debugger of prefrence may be used, the configurations use `gdb`

## Contribute
You can write configurations for other IDEs and make a pull request

## Required programs
- make
- gcc
- gdb
All of the abovementioned programs must be included in the `PATH` variable of the system