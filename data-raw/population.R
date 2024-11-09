## code to prepare `population` dataset goes here
# This creates an .rda format of the population.xlsx file


### NOTE: these datasets were created using epidict::gen_data and msf_dict_survey
# eventually this script should be updated to reflect that 

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "population.xlsx", package = "appliedepidata")

# Read in the Excel file using rio
# note this reads in all sheets in to a list (for merging household and members)
population <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

# Save the data as an internal .rda file in the data/ directory
# This will make the dataset internal (not accessible via data()) 
# it is still available within the package but as package::dataset
# (the description file has 'LazyData: true' so data now wont take any memory 
# unless it is actively called)
usethis::use_data(population, overwrite = TRUE)
