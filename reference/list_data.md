# List Datasets in a Package

This function lists all the files in the `data`,`inst/extdata` and
`internal binaries` directories of a specified R package.

## Usage

``` r
list_data(package_name = "appliedepidata")
```

## Arguments

- package_name:

  A character string specifying the name of the R package for which to
  list files. Defaults to "appliedepidata".

## Value

A data frame with four columns:

- `directory`:

  The directory (`data`,`extdata`, `intdata`) where the file is located.

- `name`:

  The name for each dataset found in directories.

- `extension`:

  The file extension for each dataset found in directories

- `duplicate`:

  Logical vector (TRUE/FALSE) if the file name (with extension) exists
  more than once. Only flags from the second occurrence. This is useful
  for packages which have not been built making .rda files internal

## Examples

``` r
if (FALSE) { # \dontrun{
# List all files in the directories of the "ggplot2" package
files <- list_data(package_name = "ggplot2")
print(files)
} # }
```
