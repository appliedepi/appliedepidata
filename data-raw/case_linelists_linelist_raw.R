## code to prepare `case_linelists_linelist_raw` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "case_linelists_linelist_raw.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
case_linelists_linelist_raw <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this dataset is originally from the {outbreaks} package, same content as
## linelist_raw, repackaged under the case_linelists_ naming for this bundle

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(case_linelists_linelist_raw, overwrite = TRUE)
