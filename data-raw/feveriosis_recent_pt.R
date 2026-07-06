## code to prepare `feveriosis_recent_pt` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "feveriosis_recent_pt.csv", package = "appliedepidata")

# Read in the Excel file using rio
feveriosis_recent_pt <- rio::import(file_path)

# Other code for editing the file can go here


# Save the data as an internal .rda file in the data/ directory

usethis::use_data(feveriosis_recent_pt, overwrite = TRUE)
