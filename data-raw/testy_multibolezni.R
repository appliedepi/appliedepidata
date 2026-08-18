## code to prepare `testy_multibolezni` dataset goes here
## Russian translation of multidisease_tests

# Define the path to the csv file in inst/extdata
file_path <- system.file("extdata", "testy_multibolezni.csv", package = "appliedepidata")

# Read in the csv file using rio
testy_multibolezni <- rio::import(file_path)

# Internalise the data
usethis::use_data(testy_multibolezni, overwrite = TRUE)
