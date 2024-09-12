
test_that("save_data saves files correctly when all files exist", {
  # Mock dataset information
  mock_dataset_info <- data.frame(
    name = c("dataset1", "dataset2"),
    extension = c("rds", "rda")
  )
  
  # Mock list_data to return existing files
  mock_existing_files <- data.frame(
    name = c("dataset1", "dataset2"),
    extension = c("rds", "rda")
  )
  
  # Mock system.file to simulate file paths
  mock_files_to_copy <- c("/path/to/dataset1.rds", "/path/to/dataset2.rda")
  
  # Mock success for file copying
  mock_success <- c(TRUE, TRUE)
  
  # Define lookup_dataset and list_data as mock functions
  with_mock(
    lookup_dataset = function(...) mock_dataset_info,
    list_data = function(...) mock_existing_files,
    system.file = function(...) mock_files_to_copy,
    file.copy = function(...) mock_success,
    
    {
      expect_message(save_data(name = "dataset1", path = "/path/to/save"), 
                     "File\\(s\\) successfully saved here: /path/to/save")
    }
  )
})

test_that("save_data throws an error when files are missing", {
  # Mock dataset information
  mock_dataset_info <- data.frame(
    name = c("dataset1", "dataset2"),
    extension = c("rds", "rda")
  )
  
  # Mock list_data to return only one existing file
  mock_existing_files <- data.frame(
    name = c("dataset1"),
    extension = c("rds")
  )
  
  # Define lookup_dataset and list_data as mock functions
  with_mock(
    lookup_dataset = function(...) mock_dataset_info,
    list_data = function(...) mock_existing_files,
    
    {
      expect_error(save_data(name = "dataset1", path = "/path/to/save"), 
                   "The following files are missing: dataset2.rda")
    }
  )
})

test_that("save_data handles unzipping when zipped files are encountered", {
  # Mock dataset information with a zipped file
  mock_dataset_info <- data.frame(
    name = c("dataset1"),
    extension = c("zip")
  )
  
  # Mock list_data to return the zipped file
  mock_existing_files <- data.frame(
    name = c("dataset1"),
    extension = c("zip")
  )
  
  # Mock success for file copying and unzipping
  mock_files_to_copy <- "/path/to/dataset1.zip"
  
  # Mock unzip function
  mock_unzip <- function(...) return(TRUE)
  
  # Define lookup_dataset and list_data as mock functions
  with_mock(
    lookup_dataset = function(...) mock_dataset_info,
    list_data = function(...) mock_existing_files,
    system.file = function(...) mock_files_to_copy,
    unzip = mock_unzip,
    file.copy = function(...) TRUE,
    
    {
      expect_message(save_data(name = "dataset1", path = "/path/to/save"), 
                     "File\\(s\\) successfully saved here: /path/to/save")
    }
  )
})

test_that("save_data handles invalid paths gracefully", {
  # Mock dataset information
  mock_dataset_info <- data.frame(
    name = c("dataset1"),
    extension = c("rds")
  )
  
  # Mock list_data to return existing files
  mock_existing_files <- data.frame(
    name = c("dataset1"),
    extension = c("rds")
  )
  
  # Mock system.file to simulate file paths
  mock_files_to_copy <- c("/invalid/path/dataset1.rds")
  
  # Mock failure for file copying
  mock_success <- FALSE
  
  # Define lookup_dataset and list_data as mock functions
  with_mock(
    lookup_dataset = function(...) mock_dataset_info,
    list_data = function(...) mock_existing_files,
    system.file = function(...) mock_files_to_copy,
    file.copy = function(...) mock_success,
    
    {
      expect_warning(save_data(name = "dataset1", path = "/invalid/path"), 
                     "Warning: File\\(s\\) could not be saved")
    }
  )
})
