## code to prepare `viraland_cholera_20210721_linelist_raw` dataset goes here

# This dataset was simulated with code in the aesim repo https://github.com/appliedepi/aesim
# This is a derivative of `viraland_cholera_20210721_linelist` 

# Define the path to the file in inst/extdata
file_path <- system.file("extdata", "viraland_cholera_20210721_linelist_raw.xlsx", package = "appliedepidata")

# Read in the file using rio
viraland_cholera_20210721_linelist_raw <- rio::import(file_path)

usethis::use_data(viraland_cholera_20210721_linelist_raw, overwrite = TRUE)
