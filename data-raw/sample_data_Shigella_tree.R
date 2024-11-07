## code to prepare `sample_data_Shigella_tree` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "sample_data_Shigella_tree.csv", package = "appliedepidata")

# Read in the csv file with rio 
sample_data_Shigella_tree <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(sample_data_Shigella_tree, overwrite = TRUE)




