## code to prepare `linelist_raw` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "linelist_raw.xlsx", package = "appliedepidata")

## this dataset is originally from the {outbreaks} package 
## extensive changes were made in the link below but unfortunately these are not reproducible 
## https://github.com/appliedepi/epiRhandbook_eng/blob/master/old_bookdown/data/make_evd_dataset.R

# Read in the Excel file using rio
linelist_raw <- rio::import(file_path)

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(linelist_raw, overwrite = TRUE)



usethis::use_data(linelist_raw, overwrite = TRUE)
