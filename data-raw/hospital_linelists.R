## code to prepare `hospital_linelists` dataset goes here - THIS IS THE EXCEL VERSION

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "hospital_linelists.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
hospital_linelists <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this data is a cleaned version of linelist_clean.xlsx
## There appears to be no reproducible code to create this dataset as it was likely
## just a manual deletion of rows in excel 

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(hospital_linelists, overwrite = TRUE)




