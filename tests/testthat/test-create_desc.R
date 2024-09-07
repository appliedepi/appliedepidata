

# Sample dictionary data frame
sample_dict <- data.frame(
  variable_name = c("var1", "var2", "var3", "var4"),
  type = c("Type1", NA, "Type3", "Unknown"),
  description = c("Description 1", "Description 2", NA, "Description 4"),
  stringsAsFactors = FALSE
)

# Expected outputs for the given sample data
expected_desc_with_type <- "#' \\describe{\n#'   \\item{var1}{a Type1 denoting Description 1}\n#'   \\item{var2}{Description 2}\n#'   \\item{var3}{a Type3 denoting No description available}\n#'   \\item{var4}{a Unknown denoting Description 4}\n#' }\n"
expected_desc_without_type <- "#' \\describe{\n#'   \\item{var1}{a Type1 denoting Description 1}\n#'   \\item{var2}{Description 2}\n#'   \\item{var3}{No description available}\n#'   \\item{var4}{a Unknown denoting Description 4}\n#' }\n"

# Test: Output matches expected description when type is provided
test_that("create_desc correctly formats output with type", {
  # Capture the output of the function
  output <- capture.output(create_desc(sample_dict, "variable_name", "type", "description", copy_to_clipboard = FALSE))
  output_text <- paste(output, collapse = "\n")
  
  # Check if the output matches the expected description with type
  expect_equal(output_text, expected_desc_with_type)
})

# Test: Output matches expected description when type is missing
test_that("create_desc correctly formats output without type", {
  # Modify the sample dictionary to remove the type column
  sample_dict_no_type <- sample_dict
  sample_dict_no_type$type <- NA
  
  # Capture the output of the function
  output <- capture.output(create_desc(sample_dict_no_type, "variable_name", NULL, "description", copy_to_clipboard = FALSE))
  output_text <- paste(output, collapse = "\n")
  
  # Check if the output matches the expected description without type
  expect_equal(output_text, expected_desc_without_type)
})

# Test: Clipboard functionality (requires running interactively)
test_that("create_desc writes to clipboard", {
  skip_on_cran()  # Skip this test on CRAN
  
  # Clear clipboard before testing
  clipr::write_clip("")
  
  # Call the function
  create_desc(sample_dict, "variable_name", "type", "description", copy_to_clipboard = TRUE)
  
  # Capture the clipboard content
  clipboard_content <- clipr::read_clip()
  
  # Check if clipboard content matches the expected description with type
  expect_equal(clipboard_content, expected_desc_with_type)
})