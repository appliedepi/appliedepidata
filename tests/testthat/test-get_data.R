
test_that("get_data successfully loads a data frame", {
  # Mock dataset information for a data frame
  mock_dataset_info <- data.frame(
    name = c("dataset1"),
    stringsAsFactors = FALSE
  )
  
  # Mock the loaded data frame
  mock_data_frame <- data.frame(a = 1:5, b = letters[1:5])
  
  # Mock functions for lookup_dataset and data
  with_mock(
    `lookup_dataset` = function(...) mock_dataset_info,
    `data` = function(list, package, envir) assign(list, mock_data_frame, envir = envir),
    
    {
      # Check if the data frame is successfully loaded into the global environment
      get_data(name = "dataset1")
      expect_equal(dataset1, mock_data_frame)
    }
  )
})

test_that("get_data successfully loads an sf object", {
  # Mock dataset information for an sf object
  mock_dataset_info <- data.frame(
    name = c("spatial_dataset"),
    stringsAsFactors = FALSE
  )
  
  # Mock the loaded sf object
  mock_sf_object <- structure(list(geometry = "POINT(1 1)"), class = "sf")
  
  # Mock functions for lookup_dataset and data
  with_mock(
    `lookup_dataset` = function(...) mock_dataset_info,
    `data` = function(list, package, envir) assign(list, mock_sf_object, envir = envir),
    `sf::st_as_sf` = function(x) x,
    
    {
      # Check if the sf object is successfully loaded into the global environment
      expect_message(get_data(name = "spatial_dataset"), "Loaded data is an sf object")
      expect_equal(spatial_dataset, mock_sf_object)
    }
  )
})

test_that("get_data successfully loads and splits a list", {
  # Mock dataset information for a list
  mock_dataset_info <- data.frame(
    name = c("list_dataset"),
    stringsAsFactors = FALSE
  )
  
  # Mock the loaded list
  mock_list <- list(obj1 = 1:5, obj2 = letters[1:5])
  
  # Mock functions for lookup_dataset and data
  with_mock(
    `lookup_dataset` = function(...) mock_dataset_info,
    `data` = function(list, package, envir) assign(list, mock_list, envir = envir),
    
    {
      # Check if the list is split and loaded into the global environment
      expect_message(get_data(name = "list_dataset"), "Loaded data is a list. Splitting into individual objects.")
      expect_equal(obj1, 1:5)
      expect_equal(obj2, letters[1:5])
    }
  )
})

test_that("get_data throws an error for missing dataset", {
  # Mock dataset information for a non-existent dataset
  mock_dataset_info <- data.frame(
    name = c("missing_dataset"),
    stringsAsFactors = FALSE
  )
  
  # Mock functions for lookup_dataset and data to simulate a missing dataset
  with_mock(
    `lookup_dataset` = function(...) mock_dataset_info,
    `data` = function(list, package, envir) stop("Dataset not found"),
    
    {
      # Check if the function throws an error when the dataset is missing
      expect_error(get_data(name = "missing_dataset"), "Failed to load the dataset: missing_dataset")
    }
  )
})

test_that("get_data handles multiple datasets", {
  # Mock dataset information for two datasets
  mock_dataset_info <- data.frame(
    name = c("dataset1", "dataset2"),
    stringsAsFactors = FALSE
  )
  
  # Mock the loaded datasets
  mock_data_frame1 <- data.frame(a = 1:3, b = letters[1:3])
  mock_data_frame2 <- data.frame(x = 10:12, y = letters[4:6])
  
  # Mock functions for lookup_dataset and data
  with_mock(
    `lookup_dataset` = function(...) mock_dataset_info,
    `data` = function(list, package, envir) {
      if (list == "dataset1") assign(list, mock_data_frame1, envir = envir)
      if (list == "dataset2") assign(list, mock_data_frame2, envir = envir)
    },
    
    {
      # Check if both datasets are successfully loaded into the global environment
      get_data(name = "dataset1")
      expect_equal(dataset1, mock_data_frame1)
      expect_equal(dataset2, mock_data_frame2)
    }
  )
})
