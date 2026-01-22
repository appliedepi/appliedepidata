# Create Description of Variables for Roxygen Documentation

This function uses a data frame (in a data dictionary format) to create
a the description section of 'format' for data set documentation with
the Roxygen package.

## Usage

``` r
create_desc(
  dictionary,
  variable_name,
  type = NULL,
  description,
  copy_to_clipboard = TRUE
)
```

## Arguments

- dictionary:

  A data frame listing at minimum the variable name, variable type and a
  description column.

- variable_name:

  A column listing the names of variables

- type:

  A column listing the type of variable

- description:

  A column explaining what the variable contains

- copy_to_clipboard:

  if `TRUE` (default), the description text will be copied to the user's
  clipboard with
  [`clipr::write_clip()`](http://matthewlincoln.net/clipr/reference/write_clip.md).
  If `FALSE`, it will be printed to the user's console.

## Value

A character string which can be pasted in to the documentation file

## Examples

``` r
if (FALSE) { # \dontrun{
# Create description text for ... 
create_desc(data_dict, "variable_name", "type", "description")
} # }
```
