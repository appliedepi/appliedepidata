% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/covid-19_outbreak_usa_2020_doc.R
\docType{data}
\name{fulton_data}
\alias{fulton_data}
\title{Anonymized COVID-19 linelist data from Fulton County (USA), 2020}
\format{
An object of class \code{data.frame} with 82101 rows and 31 columns.
}
\source{
This data was collected by Fulton County for surveillance purposes,
then anonymized and jittered for training.

This is version 1.0.

This dataset is English.

This dataset is licensed under \href{https://creativecommons.org/licenses/by-nc-sa/4.0/}{CC by-NC-SA 4.0}
}
\usage{
fulton_data
}
\description{
Anonymized and jittered linelist data from the real emergence of COVID-19 in
Fulton County, with sample dates from early 2020 to July 2021.
}
\details{
This is a case-linelist which contains de-indentified individual level data
on clinical, laboratory and epidemiological information. It can be used
together with \link{fulton_population} (population data by county).

Please note, that some data has been adapted in order to best achieve
training objectives. Also, the GPS coordinates included in the dataset
do not correspond to real cases identified during this outbreak.
They have been generated exclusively for training purposes.
}
\keyword{datasets}
