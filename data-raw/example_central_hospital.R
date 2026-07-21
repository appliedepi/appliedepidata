## code to prepare `example_central_hospital` dataset goes here

# Define the path to the csv file in inst/extdata
file_path <- system.file("extdata", "example_Central Hospital.csv", package = "appliedepidata")

# Read in the csv file using rio
example_central_hospital <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this is the Central Hospital subset of the cleaned Ebola linelist, one of
## six per-hospital files (alongside Missing, Military, Other, Port, and
## St. Mark's Maternity Hospital) prepared for an iteration/loops example
## where multiple files are read in and combined

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(example_central_hospital, overwrite = TRUE)
