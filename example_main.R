#######################
##   code testing    ##
##      example      ##
#######################

library(tidyverse)
library(assertr)

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

process_data <- function(data){
  data %>% 
    # verify all columns are present
    verify(has_all_names("date","lab_test","temp","infections"),
           error_fun=just_warn) %>%
    # verify numbers are non-negative
    assert(within_bounds(0,Inf),c("infections","temp","lab_test")) %>%
    # verify all dates are unique
    assert(is_uniq,date)
    
}

# examples:
# data %>% add_row(date="2020-02-21",lab_test=-1,temp=20.,infections=17) %>% process_data()


fit_model <- function(data,file="fitted_model.rds"){
  # fit model
  m <- lm(infections ~ lab_test + temp,data=data)
  # save model
  saveRDS(m,file)
}

predict_model <- function(data, file="fitted_model.rds"){
  # load the model
  m <- readRDS(file)
  
  # make a predictions on new data using the model
  predict(m, data)
}



