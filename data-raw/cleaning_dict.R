## code to prepare `cleaning_dict` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "cleaning_dict.csv", package = "appliedepidata")

# Read in the Excel file using rio
cleaning_dict <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this is just an example cleaning dictionary used in the epirhandbook 
## it is only short (not a full)

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(cleaning_dict, overwrite = TRUE)




