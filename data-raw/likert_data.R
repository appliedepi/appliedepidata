## code to prepare `likert_data` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "likert_data.csv", package = "appliedepidata")

# Read in the rds file using rio
likert_data <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)


# Save the data as an internal .rda file in the data/ directory
usethis::use_data(likert_data, overwrite = TRUE)




