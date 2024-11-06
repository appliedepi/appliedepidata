## code to prepare `sle_admpop_adm3_2020` dataset goes here
# This creates an .rda format of the sle_admpop_adm3_2020.csv file

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "sle_admpop_adm3_2020.csv", package = "appliedepidata")

# Read in the Excel file using rio
sle_admpop_adm3_2020 <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(sle_admpop_adm3_2020, overwrite = TRUE)
