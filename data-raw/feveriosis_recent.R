## code to prepare `feveriosis_recent` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "feveriosis_recent.csv", package = "appliedepidata")

# Read in the Excel file using rio
feveriosis_recent <- rio::import(file_path)

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(feveriosis_recent, overwrite = TRUE)
