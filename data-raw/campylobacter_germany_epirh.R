## code to prepare `campylobacter_germany_epirh` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "campylobacter_germany_epirh.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
campylobacter_germany_epirh <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this is the full CampyDE data from the {surveillance} package (date and case
## columns only), without trimming the last 13 weeks like campylobacter_germany
## does - kept whole for the epiRhandbook time series chapter

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(campylobacter_germany_epirh, overwrite = TRUE)
