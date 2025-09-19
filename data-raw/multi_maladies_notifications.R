## code to prepare `multi_maladies_notifications` dataset goes here

## This is a tranlsated dataset - see the code for creating it in 'data-raw/multidisease_notifications.R'

# This creates an .rda format of the multi_maladies_notifications.xlxs file

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "multi_maladies_notifications.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
multi_maladies_notifications <- rio::import(file_path)

usethis::use_data(multi_maladies_notifications, overwrite = TRUE)
