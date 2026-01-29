## code to prepare `viraland_cholera_20210721_linelist` dataset goes here

# Define the path to the file in inst/extdata
file_path <- system.file("extdata", "viraland_cholera_20210721_linelist.rds", package = "appliedepidata")

# Read in the file using rio
viraland_cholera_20210721_linelist <- rio::import(file_path)

usethis::use_data(viraland_cholera_20210721_linelist, overwrite = TRUE)
