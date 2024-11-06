## code to prepare `linelist_cleaned` dataset goes here - THIS IS THE EXCEL VERSION

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "linelist_cleaned.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
linelist_cleaned <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this data is a cleaned version of linelist_raw.xlsx
## the cleaning steps are in the epirhandbook cleaning chapter 

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(linelist_cleaned, overwrite = TRUE)




