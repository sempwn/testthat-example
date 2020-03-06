source("../example_main.R", chdir = TRUE)
library(testthat)

data <- tibble(   
  date = c("2020-02-01", "2020-02-02", "2020-02-03", "2020-02-04", "2020-02-05", 
           "2020-02-06", "2020-02-07", "2020-02-08", "2020-02-09", "2020-02-10", 
           "2020-02-11", "2020-02-12", "2020-02-13", "2020-02-14", "2020-02-15", 
           "2020-02-16", "2020-02-17", "2020-02-18", "2020-02-19", "2020-02-20"),
  lab_test = c(7, 7, 7, 4, 4, 5, 2, 6, 4, 4, 3, 5, 2, 4, 3, 2, 7, 5, 9, 4),
  temp = c(3.0,  6.9, 14.3, 11.5,  2.9, 17.3,  3.0,  6.7,  8.8,  7.3,  3.6,
           3.6, 18.8, 15.9, 18.1, 18.3, 18.3,  8.6, 15.2,  7.6),
  infections = c(17, 14, 14, 14, 12, 5, 13,  7, 13, 12, 12,  9,
                 6, 1,  5,  1,  1, 14,  6, 19)
)

test_that("process data", {
  expect_type(process_data(data), "list")
})

test_that("date not unique", {
  expect_error(
    data %>% 
    add_row(date="2020-02-20",
            lab_test=1,
            temp=20.,
            infections=17) %>% 
    process_data() 
    )
    
})

test_that("Negative numbers", {
  expect_error(
    data %>% 
      add_row(date="2020-02-21",
              lab_test=-1,
              temp=20.,
              infections=17) %>% 
      process_data() 
  )
})