## code to prepare `example_district_weekly_count_data` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "example_district_weekly_count_data.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
example_district_weekly_count_data <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this is the same content as district_weekly_count_data, repackaged for the
## iteration/loops example folder

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(example_district_weekly_count_data, overwrite = TRUE)
