

# Define tests
test_that("list_datasets function returns a dataframe with correct columns", {
  # Run the function
  result <- list_datasets(package_name = "appliedepidata")
  
  # Check that the result is a dataframe
  expect_s3_class(result, "data.frame")
  
  # Check for the correct columns
  expect_true(all(c("directory", "file", "duplicate") %in% colnames(result)))
})



test_that("list_datasets handles missing directories gracefully", {
  # For a non-existing package
  expect_error(list_datasets(package_name = "thepotatoeshow"), 
               "Package not found. Please ensure the package is installed.")
  
  # For a package that might not have some directories
  result <- list_datasets(package_name = "ggplot2")  # ggplot2 is used as an example
  expect_s3_class(result, "data.frame")
  
  # Check that 'data' and 'extdata' directories are handled even if they are empty
  expect_true(all(result$directory %in% c("data", "extdata", "intdata")))
})


# test_that("list_datasets correctly flags duplicates", {
#   # Use a package with known duplicates
#   result <- list_datasets(package_name = "appliedepidata")
#   
#   # Check if duplicates are flagged correctly
#   expect_true(any(result$duplicate))
#   expect_false(all(result$duplicate))
# })



test_that("list_datasets returns correct file paths", {
  # Run the function
  result <- list_datasets(package_name = "palmerpenguins")
  
  # Check some expected values
  expected_files <- c("penguins.csv",
                      "penguins_raw.csv",
                      "penguins.rda",
                      "penguins_raw (penguins).rda"
                      )
  
  expect_true(all(expected_files %in% result$file))
})


test_that("list_datasets handles internal data files properly", {
  # For a package known to have internal data
  result <- list_datasets(package_name = "appliedepidata")
  
  # Check that internal data files are present
  expect_true(any(result$directory == "intdata"))
  
  # Check that no external files are mistakenly listed as internal data
  expect_false(any(result$directory == "data" & result$duplicate))
  expect_false(any(result$directory == "extdata" & result$duplicate))
})