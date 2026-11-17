tot <- rio::import(system.file("extdata", "tableoftables.xlsx", package = "appliedepidata"))

test_that("save_data saves the file of every indexed dataset that has one", {
  for (n in tot$name[!is.na(tot$file)]) {
    d <- tempfile(); dir.create(d)
    suppressMessages(save_data(name = n, path = d))
    expect_true(file.exists(file.path(d, tot$file[tot$name == n])), label = n)
  }
})

test_that("save_data saves a whole group, including the empty placeholder files", {
  d <- tempfile(); dir.create(d)
  suppressMessages(save_data(group_identifier = "example_case_linelist_outbreak_sle_2014", path = d))
  expect_setequal(dir(d), tot$file[tot$group_identifier == "example_case_linelist_outbreak_sle_2014"])
  expect_equal(file.size(file.path(d, "example_case_linelist_2020-10-02.csv")), 0)
})

test_that("every indexed dataset has its file in extdata", {
  expect_false(anyNA(tot$file))
  expect_true(all(file.exists(system.file("extdata", tot$file, package = "appliedepidata"))))
})

test_that("get_data skips datasets with no R object", {
  expect_message(x <- get_data(group_identifier = "example_case_linelist_outbreak_sle_2014"),
                 "Skipped .*example_case_linelist_2020_10_02")
  expect_named(x, c("example_case_linelist_2020_10_08", "example_hospital_linelists",
                    "example_central_hospital", "example_military_hospital",
                    "example_port_hospital", "example_st_marks_maternity_hospital",
                    "example_missing", "example_other"))
  expect_error(get_data(name = "example_case_linelist_2020_10_02"), "has an R object")
})
