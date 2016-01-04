# environment(1) -- sets common environment variables for a Bash library

## SYNOPSIS
eval "$(`environment`)"<br>
`environment` `-h`|`--help`<br>

## DESCRIPTION
`environment` sets common environment variables for a Bash library on Linux. It
enables a script to reference related files regardless of whether as part of an
installed package or part of a Git repository in development.

If the library is installed as part of a package:

* `BIN` is the path to the current script.
* `LIB` is `/usr/lib/PACKAGE_NAME`
* `HELP` is `/usr/share/PACKAGE_NAME/help/SCRIPT_NAME`

Otherwise, it is assumed the library files are all stored in a single directory
structure, like a Git repository:

* `BIN` is the path to the current script.
* `LIB` is `ROOT_DIRECTORY/lib`
* `HELP` is `ROOT_DIRECTORY/help/SCRIPT_NAME`

## OPTIONS
* -h, --help:
  Show help text and exit.

## COPYRIGHT
`bash-common-environment` is Copyright (c) 2016 Vinson Chuong under The MIT License.
