## code to prepare `case_linelists_cleaning_dict` dataset goes here

# Define the path to the csv file in inst/extdata
file_path <- system.file("extdata", "case_linelists_cleaning_dict.csv", package = "appliedepidata")

# Read in the csv file using rio
case_linelists_cleaning_dict <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this is the same short example cleaning dictionary as cleaning_dict,
## repackaged under the case_linelists_ naming for this bundle

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(case_linelists_cleaning_dict, overwrite = TRUE)
