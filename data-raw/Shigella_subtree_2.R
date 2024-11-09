## code to prepare `Shigella_subtree_2` dataset goes here

# Define the path to the Excel file in inst/extdata
file_path <- system.file("extdata", "Shigella_subtree_2.txt", package = "appliedepidata")

# Read in the text file with ape 
Shigella_subtree_2 <- ape::read.tree(file_path)

# process data as needed (e.g. cleaning, recoding, restructuring)

# Save the data as an internal .rda file in the data/ directory
usethis::use_data(Shigella_subtree_2, overwrite = TRUE)




