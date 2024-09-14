## code to prepare `fulton_population` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "fulton_population.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
fulton_population <- rio::import(file_path)

# Save the data as an internal .rda file in the data/ directory
# This will make the dataset internal (not accessible via data()) 
# it is still available within the package but as package::dataset
# (the description file has 'LazyData: true' so data now wont take any memory 
# unless it is actively called)
usethis::use_data(fulton_population, overwrite = TRUE)
