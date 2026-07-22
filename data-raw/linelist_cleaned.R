## code to prepare `linelist_cleaned` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "linelist_cleaned.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
linelist_cleaned <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this data is the same content as linelist_cleaned_excel.xlsx, added under a
## plain name per user request (note: this name is a duplicate of the
## generic-name example the package vignette explicitly warns against)

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(linelist_cleaned, overwrite = TRUE)
