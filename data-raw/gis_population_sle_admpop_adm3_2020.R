## code to prepare `gis_population_sle_admpop_adm3_2020` dataset goes here

# Define the path to the csv file in inst/extdata
file_path <- system.file("extdata", "gis_population_sle_admpop_adm3_2020.csv", package = "appliedepidata")

# Read in the csv file using rio
gis_population_sle_admpop_adm3_2020 <- rio::import(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

## this is the same content as sle_admpop_adm3_2020, repackaged for the
## GIS basics mapping example

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(gis_population_sle_admpop_adm3_2020, overwrite = TRUE)
