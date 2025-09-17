## code to prepare `notificaciones_multienfermedad` dataset goes here

# This creates an .rda format of the notificaciones_multienfermedad.xlsx file

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "notificaciones_multienfermedad.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
notificaciones_multienfermedad <- rio::import(file_path)

usethis::use_data(notificaciones_multienfermedad, overwrite = TRUE)
