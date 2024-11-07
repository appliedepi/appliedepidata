## code to prepare `world_standard_population_by_sex` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "world_standard_population_by_sex.csv", package = "appliedepidata")

# Read in the rds file using rio
world_standard_population_by_sex <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)


# Save the data as an internal .rda file in the data/ directory
usethis::use_data(world_standard_population_by_sex, overwrite = TRUE)




