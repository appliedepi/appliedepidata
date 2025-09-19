## code to prepare `pruebas_multienfermedad` dataset goes here

## This is a tranlsated dataset - see the code for creating it in 'data-raw/multidisease_tests.R'

# This creates an .rda format of the pruebas_multienfermedad.csv file

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "pruebas_multienfermedad.csv", package = "appliedepidata")

# Read in the Excel file using rio
pruebas_multienfermedad <- rio::import(file_path)

usethis::use_data(pruebas_multienfermedad, overwrite = TRUE)
