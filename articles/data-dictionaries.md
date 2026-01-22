# Data dictionaries

This is a brief walk-through of how to create a data dictionary for an
existing dataset. If you are intending to add this to the package then
you must follow the [guidelines for adding
datasets](https://appliedepi.github.io/appliedepidata/articles/adding-data.html).
If you were hoping to use the dictionary with
[`appliedepidata::create_desc()`](https://appliedepi.github.io/appliedepidata/reference/create_desc.md),
then you can add your variables descriptions to the `note` column.
Similarly this dictionary could be used for translating your dataset, by
adding columns to the excel sheet with the language suffix (e.g. `_fr`)
and then translating the content, you could then use {matchmaker} to
recode.

``` r
# Define the path to the Excel file in inst/extdata
import_path <- system.file("extdata", "AJS_AmTiman.xlsx", package = "appliedepidata")

# Define the path to export the Excel file (Dictionary) to in inst/extdata
export_path <- file.path("inst", "extdata", "AJS_AmTiman_dict.xlsx")


# Read in the Excel file using rio
AJS_AmTiman <- rio::import(import_path)


# create variable list 
survey <- datadict::dict_from_data(AJS_AmTiman)
# add in a notes column that can then be edited manually to describe variables
survey$note <- NA

# create list of variable values (choices)
choices <- datadict::coded_options(survey)

# chuck in list 
data_export <- list(
 survey, 
 choices
)

# write to excel sheet 
rio::export(data_export, export_path)
```
