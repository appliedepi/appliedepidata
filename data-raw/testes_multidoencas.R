## code to prepare `testes_multidoencas` dataset goes here

## This is a tranlsated dataset - see the code for creating it in 'data-raw/multidisease_tests.R'

# This creates an .rda format of the testes_multidoencas.csv file

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "testes_multidoencas.csv", package = "appliedepidata")

# Read in the Excel file using rio
testes_multidoencas <- rio::import(file_path)

usethis::use_data(testes_multidoencas, overwrite = TRUE)
