## code to prepare `deaths_countryB` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "deaths_countryB.csv", package = "appliedepidata")

# Read in the rds file using rio
deaths_countryB <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)


# Save the data as an internal .rda file in the data/ directory
usethis::use_data(deaths_countryB, overwrite = TRUE)




