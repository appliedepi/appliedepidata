## code to prepare `example_hospital_linelists` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "example_hospital_linelists.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
example_hospital_linelists <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this is the same content as hospital_linelists, repackaged for the
## iteration/loops example folder alongside the per-hospital splits

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(example_hospital_linelists, overwrite = TRUE)
