## code to prepare `example_military_hospital` dataset goes here

# Define the path to the csv file in inst/extdata
file_path <- system.file("extdata", "example_Military Hospital.csv", package = "appliedepidata")

# Read in the csv file using rio
example_military_hospital <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this is the Military Hospital subset of the cleaned Ebola linelist, one of
## six per-hospital files (alongside Central, Missing, Other, Port, and
## St. Mark's Maternity Hospital) prepared for an iteration/loops example
## where multiple files are read in and combined

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(example_military_hospital, overwrite = TRUE)
