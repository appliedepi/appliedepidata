## code to prepare `example_case_linelist_2020_10_08` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "example_case_linelist_2020-10-08.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
example_case_linelist_2020_10_08 <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this is the same content as linelist_raw / case_linelists_linelist_raw,
## repackaged as a dated snapshot for the iteration/loops example folder

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(example_case_linelist_2020_10_08, overwrite = TRUE)
