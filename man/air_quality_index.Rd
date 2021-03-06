% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/air_quality.R
\name{air_quality_index}
\alias{air_quality_index}
\title{air_quality - a function for classifying air quality levels}
\source{
AQI index values and levels: https://www.airnow.gov/aqi/aqi-basics/

AQI technical assistance document - index thresholds for PM2.5
concentrations found in Table 4 on pages 4-5:
https://www.airnow.gov/sites/default/files/2020-05/aqi-technical-assistance-document-sept2018.pdf
}
\usage{
air_quality_index(pm2.5_conc)
}
\arguments{
\item{pm2.5_conc}{the concentration of fine particulate matter (PM2.5) in the
air. Concentrations are reported as a 24-hour average, in micrometers per
cubic meter (μg/m^3). The AQI index thresholds for PM2.5 concentrations
were taken from Table 4 of the AQI technical assistance document}
}
\description{
Purpose: to determine the air quality index level given a 24-hour
concentration of particulate matter (PM2.5). This function uses the United
States Air Quality Index (AQI), which determines levels of concern for
concentrations of the 5 major air quality pollutants. This application of the
AQI classification is specific to 24-hour average PM2.5 concentrations. PM2.5
is fine particulate matter that is smaller than 2.5 micrometers, small enough
to be inhaled into the lungs and bloodstream and cause long-term health
effects.
}
\details{
NOTE: thresholds for AQI levels in this function are specific to the United
States, this function does not apply to other countries with different index
thresholds
}
