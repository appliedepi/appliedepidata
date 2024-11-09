## code to prepare `linelist_cleaned_with_adm3` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "linelist_cleaned_with_adm3.rds", package = "appliedepidata")

# Read in the rds file using rio
linelist_cleaned_with_adm3 <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this data is a version of linelist_cleaned_rds.rds
## there is no reproducible code for creating this file - however it appears to
## simply be a direct subset with three additional and two removed variables

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(linelist_cleaned_with_adm3, overwrite = TRUE)




