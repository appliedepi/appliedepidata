## code to prepare `contacts_clean` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "contacts_clean.rds", package = "appliedepidata")

# Read in the rds file using rio
contacts_clean <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)


# Save the data as an internal .rda file in the data/ directory
usethis::use_data(contacts_clean, overwrite = TRUE)




