## code to prepare `coords` dataset goes here
# This creates an .rda format of the coords.csv file

# Define the path to the csv file in inst/extdata
file_path <- system.file("extdata", "coords.csv", package = "appliedepidata")

# Read in the Excel file using rio
coords <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

# Save the data as an internal .rda file in the data/ directory
# This will make the dataset internal (not accessible via data()) 
# it is still available within the package but as package::dataset
# (the description file has 'LazyData: true' so data now wont take any memory 
# unless it is actively called)
usethis::use_data(coords, overwrite = TRUE)