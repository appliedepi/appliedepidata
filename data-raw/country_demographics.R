## code to prepare `country_demographics` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "country_demographics.csv", package = "appliedepidata")

# Read in the rds file using rio
country_demographics <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)


# Save the data as an internal .rda file in the data/ directory
usethis::use_data(country_demographics, overwrite = TRUE)




