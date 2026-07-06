## code to prepare `feveriosis_main_es` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "feveriosis_main_es.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
feveriosis_main_es <- rio::import(file_path)

# Other code for editing the file can go here


# Save the data as an internal .rda file in the data/ directory
usethis::use_data(feveriosis_main_es, overwrite = TRUE)
