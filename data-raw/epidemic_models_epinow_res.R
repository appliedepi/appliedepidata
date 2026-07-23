## code to prepare `epidemic_models_epinow_res` dataset goes here

# Define the path to the rds file in inst/extdata
file_path <- system.file("extdata", "epidemic_models_epinow_res.rds", package = "appliedepidata")

# Read in the rds file using rio
epidemic_models_epinow_res <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## same content as epinow_res, repackaged for the epidemic models example

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(epidemic_models_epinow_res, overwrite = TRUE)

