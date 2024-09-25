## code to prepare `stegentira_data` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "stegentira_data.csv", package = "appliedepidata")

# Read in the Excel file using rio
stegentira_data <- rio::import(file_path)

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(stegentira_data, overwrite = TRUE)
