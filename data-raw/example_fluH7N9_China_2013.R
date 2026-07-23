## code to prepare `example_fluH7N9_China_2013` dataset goes here

# Define the path to the csv file in inst/extdata
file_path <- system.file("extdata", "example_fluH7N9_China_2013.csv", package = "appliedepidata")

# Read in the csv file using rio
example_fluH7N9_China_2013 <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this is the same content as fluH7N9_China_2013, repackaged for the
## iteration/loops example folder

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(example_fluH7N9_China_2013, overwrite = TRUE)
