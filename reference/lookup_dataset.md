# Lookup Dataset Information

This function is an internal function used within the `get_data.R` and
`save_data.R` functions. This function helps retrieve information (from
*tableoftables.xlsx*) about datasets based on provided search criteria
such as `name`, `language`, `group_identifier`, or `unique_identifier`.
It returns the dataset that matches the specified criteria or suggests
alternatives if mismatches are found.

## Usage

``` r
lookup_dataset(
  name = NULL,
  language = NULL,
  group_identifier = NULL,
  usage = NULL,
  unique_identifier = NULL
)
```

## Arguments

- name:

  (optional) A string specifying the name of the dataset to search for.

- language:

  (optional) A string specifying the language of the dataset. If used
  with `name`, `group_identifier`, or `unique_identifier`, the function
  will filter datasets based on this language.

- group_identifier:

  (optional) A string identifying a group of related datasets. If
  provided, the function will return all datasets within the group
  unless further criteria are given.

- usage:

  (optional) A string representing where the datasets are used. If
  provided, the function will return all datasets within the group
  unless further criteria are given.

- unique_identifier:

  (optional) A string representing the unique identifier for a dataset.

## Value

A `data.frame` containing dataset information if a matching dataset is
found. If no dataset is found or if multiple datasets are found and more
details are required (unless for a group), an error message is returned
with suggestions for further search refinement.

## Details

The function performs searches in the following order:

1.  **Searching by `name`:**

    - If a single dataset is found by `name`, the function checks if
      other parameters like `language` or `group_identifier` match the
      dataset. If they do not match, it suggests alternatives.

    - If multiple datasets are found, additional filtering is done based
      on `language` or `group_identifier` (if specified).

2.  **Handling incorrect `language` or `group_identifier`:**

    - If a dataset is found by `name`, but the specified `language` or
      `group_identifier` does not match, alternative datasets are
      suggested based on the same `unique_identifier`.

3.  **Searching by `group_identifier`:**

    - If a `group_identifier` is provided, the function returns all
      datasets within the group unless further refinement by `language`
      is necessary.

4.  **Searching by `usage`:**

    - If a `usage` is provided, the function returns all datasets within
      the group unless further refinement by `language` is necessary.

5.  **Searching by `unique_identifier`:**

    - If a `unique_identifier` is provided, the function will attempt to
      find a dataset by that identifier and apply further filtering by
      `language` or `name` if needed.

## Examples

``` r
if (FALSE) { # \dontrun{
# Search by name
lookup_dataset(name = "AJS_AmTiman")

# Search by name and language
lookup_dataset(name = "AJS_AmTiman", language = "en")

# Search by group identifier and language
lookup_dataset(group_identifier = "acutejaundicesyndrome_outbreak_tcd_2016", language = "fr")

# Search by unique identifier
lookup_dataset(unique_identifier = "acutejaundicesyndrome_outbreak_tcd_2016_linelist_1_1_outbreak_2016")

# Search by name and group identifier
lookup_dataset(name = "AJS_AmTiman", group_identifier = "acutejaundicesyndrome_outbreak_tcd_2016")
} # }
```
