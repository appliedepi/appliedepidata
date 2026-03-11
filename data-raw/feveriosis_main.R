## code to prepare `feveriosis_main` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "feveriosis_main.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
feveriosis_main <- rio::import(file_path)

usethis::use_data(feveriosis_main, overwrite = TRUE)

