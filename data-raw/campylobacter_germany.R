## code to prepare `campylobacter_germany` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "campylobacter_germany.xlsx", package = "appliedepidata")

# Read in the rds file using rio
campylobacter_germany <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this data is from the {surveillance} package, which can be accessed with data("campyDE")
## basically just subset to drop the last 13 weeks of data and only kept date and cases cols
## to demonstrate prediction 

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(campylobacter_germany, overwrite = TRUE)




