## code to prepare `generation_time` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "generation_time.rds", package = "appliedepidata")

# Read in the rds file using rio
generation_time <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this data is outputed from {epinow2}  

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(generation_time, overwrite = TRUE)




