## code to prepare `epidemic_models_summary` dataset goes here

# Define the path to the rds file in inst/extdata
file_path <- system.file("extdata", "epidemic_models_summary.rds", package = "appliedepidata")

# Read in the rds file using rio
epidemic_models_summary <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## summary table from epinow_res$summary, unbundled for the epidemic models example

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(epidemic_models_summary, overwrite = TRUE)

