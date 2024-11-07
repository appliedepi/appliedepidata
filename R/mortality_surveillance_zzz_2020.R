#' @title Fictional country demographic and mortality data to demonstrate standardisation
#'
#' @description
#' Fictional country demographic and mortality data to demonstrate standardisation
#'  
#' @details
#' Fictional country demographic and mortality data to demonstrate standardisation
#'  
#' @source This data was created for training purposes
#' 
#' The original dataset is country_demographics.csv 
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [CC by-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)  
#' 
#' @format Dataframes
#' 
#' @docType data
"country_demographics"
#' @rdname country_demographics
"country_demographics_2"
#' @rdname country_demographics
"deaths_countryA.csv"
#' @rdname country_demographics
"deaths_countryB.csv"


#' @title World “standard population” by sex
#'
#' @description
#' This is reference population counts which can be used together with \link{country_demographics}
#'  
#' @details
#' The World standard population is based on the populations of 46 countries and 
#' was developed in 1960. It is used to produce world standardised rates. It is 
#' a much ‘younger’ population compared to the population of Scotland 
#' (and other Western European countries). Also, like the European standard 
#' population, the World standard population has equal numbers of males and females 
#' within an age band. 
#' However, as the World standard population is a very ‘young’ population, it is 
#' generally less appropriate for Scottish data than the European standard population
#'  and is only be used for particular purposes.
#'  This file is split by five year age groups and sex
#'  
#' @source This data is made available by [Public Health Scotland](https://www.opendata.nhs.scot/dataset/4dd86111-7326-48c4-8763-8cc4aa190c3e/resource/2f493d21-fd39-48f9-ad6a-9b2c95b32e30/download/world_standard_population_by_sex.csv)
#' 
#' The original dataset is country_demographics.csv 
#' 
#' This is version 1.0.  
#' 
#' This dataset is English.   
#' 
#' This dataset is licensed under [OGL](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/)  
#' 
#' @format Dataframes
#' 
#' @docType data
"world_standard_population_by_sex"