## code to prepare `district_weekly_count_data` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "district_weekly_count_data.xlsx", package = "appliedepidata")

# Read in the rds file using rio
district_weekly_count_data <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)


# Save the data as an internal .rda file in the data/ directory
usethis::use_data(district_weekly_count_data, overwrite = TRUE)




