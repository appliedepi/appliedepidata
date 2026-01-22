# Retrieve and Load Datasets

The `get_data` function is designed to load specific datasets from the
`appliedepidata` package based on search criteria such as `name`,
`language`, `group_identifier`, or `unique_identifier`. The function
performs an internal lookup to identify the appropriate dataset(s), then
loads and assigns them into the global environment.

Depending on the type of dataset (e.g., regular data frame, spatial data
(`sf`), or list), appropriate post-processing is done to ensure proper
handling and loading.

## Usage

``` r
get_data(
  name = NULL,
  language = NULL,
  group_identifier = NULL,
  usage = NULL,
  unique_identifier = NULL
)
```

## Arguments

- name:

  (optional) A string specifying the name of the dataset to load.

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

The dataset(s) are loaded into the global environment. Depending on the
structure \#' of the dataset, it could be a data frame, spatial object,
or individual list elements loaded as separate objects.

## Details

The function operates as follows:

1.  **Dataset Lookup:** It performs an internal lookup to identify
    datasets matching the search criteria provided.

2.  **Loading Datasets:** For each dataset found:

    - It attempts to load the dataset using the
      [`data()`](https://rdrr.io/r/utils/data.html) function from the
      `appliedepidata` package.

    - The dataset is loaded into a temporary environment to avoid global
      environment clutter during the loading process.

3.  **Post-Processing Based on Object Type:** Once the dataset is
    loaded, the function checks the type of object and handles it
    accordingly:

    - **Data frames** are directly assigned to the global environment
      without any further processing.

    - **Phylo objects** (`phylo` class) are directly assigned to the
      global environment without any further processing.

    - **Stars objects** (`stars` class) are directly assigned to the
      global environment without any further processing.

    - **Epinow objects** (`epinow` class) are directly assigned to the
      global environment without any further processing.

    - **Spatial objects** (`sf` class) are processed using
      [`sf::st_as_sf()`](https://r-spatial.github.io/sf/reference/st_as_sf.html)
      to ensure correct handling of spatial data, and then assigned to
      the global environment.

    - **Lists** that are not data frames are split into individual
      objects and assigned to the global environment as separate
      entities.

If any dataset cannot be found or loaded, the function will raise an
error.

## See also

[`appliedepidata::search_data()`](https://appliedepi.github.io/appliedepidata/reference/search_data.md)
for details on finding datasets and their criteria.

## Examples

``` r
if (FALSE) { # \dontrun{
# Load a dataset by name
get_data(name = "AJS_AmTiman")

# Load a dataset by name and language
get_data(name = "AJS_AmTiman", language = "en")

# Load datasets by group identifier
get_data(group_identifier = "acutejaundicesyndrome_outbreak_tcd_2016")

} # }
```
