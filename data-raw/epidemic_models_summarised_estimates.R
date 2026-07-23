## code to prepare `epidemic_models_summarised_estimates` dataset goes here

# Define the path to the rds file in inst/extdata
file_path <- system.file("extdata", "epidemic_models_summarised_estimates.rds", package = "appliedepidata")

# Read in the rds file using rio
epidemic_models_summarised_estimates <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## summarised estimates from epinow_res$estimates$summarised, unbundled for the epidemic models example

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(epidemic_models_summarised_estimates, overwrite = TRUE)

