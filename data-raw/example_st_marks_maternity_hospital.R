## code to prepare `example_st_marks_maternity_hospital` dataset goes here

# Define the path to the csv file in inst/extdata
file_path <- system.file("extdata", "example_st_marks_maternity_hospital.csv", package = "appliedepidata")

# Read in the csv file using rio
example_st_marks_maternity_hospital <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this is the St. Mark's Maternity Hospital (SMMH) subset of the cleaned
## Ebola linelist, one of six per-hospital files (alongside Central, Military,
## Missing, Other, and Port Hospital) prepared for an iteration/loops example
## where multiple files are read in and combined

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(example_st_marks_maternity_hospital, overwrite = TRUE)
