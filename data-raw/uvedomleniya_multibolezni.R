## code to prepare `uvedomleniya_multibolezni` dataset goes here
## Russian translation of multidisease_notifications

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "uvedomleniya_multibolezni.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
uvedomleniya_multibolezni <- rio::import(file_path)

# Internalise the data
usethis::use_data(uvedomleniya_multibolezni, overwrite = TRUE)
