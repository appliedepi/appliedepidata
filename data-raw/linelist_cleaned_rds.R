## code to prepare `linelist_cleaned_rds` dataset goes here - THIS IS THE RDS VERSION

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "linelist_cleaned_rds.rds", package = "appliedepidata")

# Read in the rds file using rio
linelist_cleaned_rds <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this data is a cleaned version of linelist_raw.xlsx
## the cleaning steps are in the epirhandbook cleaning chapter 

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(linelist_cleaned_rds, overwrite = TRUE)




