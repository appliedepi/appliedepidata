## code to prepare `example_port_hospital` dataset goes here

# Define the path to the csv file in inst/extdata
file_path <- system.file("extdata", "example_Port Hospital.csv", package = "appliedepidata")

# Read in the csv file using rio
example_port_hospital <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this is the Port Hospital subset of the cleaned Ebola linelist, one of
## six per-hospital files (alongside Central, Military, Missing, Other, and
## St. Mark's Maternity Hospital) prepared for an iteration/loops example
## where multiple files are read in and combined

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(example_port_hospital, overwrite = TRUE)
