

# Define the mock dataset for testing
mock_table_of_tables <- tibble::tibble(
  name = c("AJS_AmTiman", "AJS_AmTiman", "Malaria_Cases", "Cholera_Outbreak"),
  language = c("en", "fr", "en", "en"),
  group_identifier = c("acutejaundicesyndrome_outbreak_tcd_2016", 
                       "acutejaundicesyndrome_outbreak_tcd_2016", 
                       "malaria_surveillance", 
                       "cholera_outbreak_2021"),
  unique_identifier = c("ajs_2016_1", "ajs_2016_1", "malaria_2020_1", "cholera_2021_1")
)

# Define the mock for rio::import
mock_rio_import <- function(...) mock_table_of_tables

test_that("Lookup by name works", {
  mockr::with_mock(
    `rio::import` = mock_rio_import,
    {
      result <- lookup_dataset(name = "AJS_AmTiman")
      expect_equal(nrow(result), 2)  # Two records found for AJS_AmTiman (fr and en)
    }
  )
})

test_that("Lookup by name and language works", {
  mockr::with_mock(
    `rio::import` = mock_rio_import,
    {
      result <- lookup_dataset(name = "AJS_AmTiman", language = "en")
      expect_equal(nrow(result), 1)  # One record found for AJS_AmTiman in English
      expect_equal(result$language, "en")
    }
  )
})

test_that("Lookup by group identifier works", {
  mockr::with_mock(
    `rio::import` = mock_rio_import,
    {
      result <- lookup_dataset(group_identifier = "acutejaundicesyndrome_outbreak_tcd_2016")
      expect_equal(nrow(result), 2)  # Two datasets in this group (en and fr)
    }
  )
})

test_that("Lookup by group identifier and language works", {
  mockr::with_mock(
    `rio::import` = mock_rio_import,
    {
      result <- lookup_dataset(group_identifier = "acutejaundicesyndrome_outbreak_tcd_2016", language = "fr")
      expect_equal(nrow(result), 1)  # One dataset in French
      expect_equal(result$language, "fr")
    }
  )
})

test_that("Lookup by unique identifier works", {
  mockr::with_mock(
    `rio::import` = mock_rio_import,
    {
      result <- lookup_dataset(unique_identifier = "ajs_2016_1")
      expect_equal(nrow(result), 2)  # Two records with the same unique identifier (fr and en)
    }
  )
})

test_that("Handling duplicates for unique identifier and name", {
  mockr::with_mock(
    `rio::import` = mock_rio_import,
    {
      expect_error(
        lookup_dataset(unique_identifier = "ajs_2016_1", name = "AJS_AmTiman"),
        "Multiple datasets found with the same unique identifier"
      )
    }
  )
})

test_that("Invalid name returns error", {
  mockr::with_mock(
    `rio::import` = mock_rio_import,
    {
      expect_error(
        lookup_dataset(name = "InvalidName"),
        "No datasets found matching search-criteria"
      )
    }
  )
})

test_that("Invalid language with valid name returns suggestions or error", {
  mockr::with_mock(
    `rio::import` = mock_rio_import,
    {
      expect_error(
        lookup_dataset(name = "AJS_AmTiman", language = "es"),
        "No datasets found with the specified criteria, did you mean"
      )
    }
  )
})

test_that("Multiple datasets by name, language filtering needed", {
  mockr::with_mock(
    `rio::import` = mock_rio_import,
    {
      expect_error(
        lookup_dataset(name = "AJS_AmTiman"),
        "Multiple datasets found with this name. Please specify 'language'"
      )
    }
  )
})

test_that("Only language provided without name or identifier", {
  mockr::with_mock(
    `rio::import` = mock_rio_import,
    {
      expect_error(
        lookup_dataset(language = "en"),
        "Please specify additional details, such as 'name' or 'group_identifier'"
      )
    }
  )
})
