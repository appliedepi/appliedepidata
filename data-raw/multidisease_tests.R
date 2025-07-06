## code to prepare `multidisease_tests` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "multidisease_tests.csv", package = "appliedepidata")

# Read in the Excel file using rio
multidisease_tests <- rio::import(file_path)

usethis::use_data(multidisease_tests, overwrite = TRUE)
