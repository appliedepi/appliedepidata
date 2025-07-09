## code to prepare `multidisease_notifications` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "multidisease_notifications.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
multidisease_notifications <- rio::import(file_path)

# Interalise the data
usethis::use_data(multidisease_notifications, overwrite = TRUE)