
<!-- README.md is generated from README.Rmd. Please edit that file -->

# appliedepidata

<!-- badges: start -->
<!-- badges: end -->

This package stores all Applied Epi data across courses and resources.
This includes courses, tutorials, case studies and books (such as the
EpiRhandbook and Applied Epi Manual).

## Installation

You can install the development version of appliedepidata from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("appliedepi/appliedepidata")
```

## stuff to consider

### functions

- [x] list available datasets  
- [x] search available datasets (wrapper around list/*tableoftables* to
  make searchable by country, disease, language, name, ID, etc)
  - [ ] needs tests (no point me doing it as I have no idea what am
    doing)
- [ ] get data (different to saving if just want to use within Rstudio)
  - ?necessary - rather than have new users freakout about different
    ways of accessing the data)
- [ ] download/save dataset locally function (based on *tableoftables*)
- [ ] data dictionary for a dataset: start with wrapper for
  [{datadict}](https://github.com/epicentre-msf/datadict) as demo, then
  either consider pulling parts to {epidict} or offer them help to get
  on CRAN.
  - if decide to help w/ {datadict} then {epidict} would just become a
    fake data generator.
  - odk example dictionary from
    [xlsxform](https://docs.getodk.org/xlsform/)
- [x] function which uses a data dict to create the description section
  in roxygen for a dataset
- [ ] in phase 2 could build helper functions that create the
  description file from *tableoftables* (then the user just needs to
  edit an excel file)
- [ ] unit testing for functions
  - ?pull snapshots bit from
    [{gapminder}](https://github.com/jennybc/gapminder/) re changes to
    datasets

### Documentation

- readme/pkgdown table (adapted from *tableoftables*) listing available
  datasets, versions, languages, source, and where used (e.g. case
  study, course, tutorial, epirhandbook)  
- ?pkgdown separated by heading for dictionaries and actual datasets,
  and cross-links between the two
