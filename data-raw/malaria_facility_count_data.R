## code to prepare `malaria_facility_count_data` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "malaria_facility_count_data.rds", package = "appliedepidata")

# Read in the rds file using rio
malaria_facility_count_data <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## There is no reproducible code, however this is based off district_weekly_count_data.xlsx 

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(malaria_facility_count_data, overwrite = TRUE)




