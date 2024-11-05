## code to prepare `ebola_linelist_20141201` dataset goes here
# This creates an .rda format of the ebola_linelist_20141201.rds file

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "ebola_linelist_20141201.rds", package = "appliedepidata")

# Read in the RDS file using rio
ebola_linelist_20141201 <- rio::import(file_path)

usethis::use_data(ebola_linelist_20141201, overwrite = TRUE)


