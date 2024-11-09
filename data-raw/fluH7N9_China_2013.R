## code to prepare `fluH7N9_china_2013` dataset goes here
# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "fluH7N9_China_2013.csv", package = "appliedepidata")

## this dataset is originally from the {outbreaks} package 
## here we should actually just source directly given no changes are made 
## however as it is from the epirhandbook and not wanting to break things have 
## just copied directly 
# fluH7N9_China_2013 <- outbreaks::fluH7N9_china_2013

# Read in the Excel file using rio
fluH7N9_China_2013 <- rio::import(file_path)

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(fluH7N9_China_2013, overwrite = TRUE)
