## code to prepare `multi_maladies_tests` dataset goes here

# This creates an .rda format of the multi_maladies_tests.csv file

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "multi_maladies_tests.csv", package = "appliedepidata")

# Read in the Excel file using rio
multi_maladies_tests <- rio::import(file_path)

usethis::use_data(multi_maladies_tests, overwrite = TRUE)
