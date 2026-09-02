## code to prepare `sle_hf` dataset goes here
# This creates an .rda format of the sle_hf.shp file (health facility points,
# OpenStreetMap via the Humanitarian Data Exchange). The same seven component
# files also ship inside sle_adm3.zip, so save_data(name = "sle_adm3") gives a
# reader both shapefiles; this dataset lets get_data(name = "sle_hf") return the
# points as an sf object on their own.

file_path <- system.file("extdata", "sle_hf.zip", package = "appliedepidata")

sle_hf <- sf::read_sf(paste0("/vsizip/", file_path))

usethis::use_data(sle_hf, overwrite = TRUE)
