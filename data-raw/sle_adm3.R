## code to prepare `sle_adm3` dataset goes here
# This creates an .rda format of the sle_adm3.shp file

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "sle_adm3.zip", package = "appliedepidata")

# Read in the Excel file using rio
sle_adm3 <- sf::read_sf(paste0("/vsizip/", file_path))

# process data as needed (e.g. cleaning, recoding, restructuring)

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(sle_adm3, overwrite = TRUE)
