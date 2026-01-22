# Anonymized COVID-19 linelist data from Fulton County (USA), 2020

Anonymized and jittered linelist data from the real emergence of
COVID-19 in Fulton County, with sample dates from early 2020 to July
2021.

## Usage

``` r
fulton_data
```

## Format

An object of class `data.frame` with 82101 rows and 31 columns.

## Source

This data was collected by Fulton County for surveillance purposes, then
anonymized and jittered for training.

This is version 1.0.

This dataset is English.

This dataset is licensed under [CC by-NC-SA
4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)

## Details

This is a case-linelist which contains de-indentified individual level
data on clinical, laboratory and epidemiological information. It can be
used together with
[fulton_population](https://appliedepi.github.io/appliedepidata/reference/fulton_population.md)
(population data by county).

Please note, that some data has been adapted in order to best achieve
training objectives. Also, the GPS coordinates included in the dataset
do not correspond to real cases identified during this outbreak. They
have been generated exclusively for training purposes.
