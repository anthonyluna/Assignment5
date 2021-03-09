#' air_quality - a function for classifying air quality levels
#'
#' Purpose: to determine the air quality index level given a 24-hour
#' concentration of particulate matter (PM2.5). This function uses the United
#' States Air Quality Index (AQI), which determines levels of concern for
#' concentrations of the 5 major air quality pollutants. This application of the
#' AQI classification is specific to 24-hour average PM2.5 concentrations. PM2.5
#' is fine particulate matter that is smaller than 2.5 micrometers, small enough
#' to be inhaled into the lungs and bloodstream and cause long-term health
#' effects.
#'
#' NOTE: thresholds for AQI levels in this function are specific to the United
#' States, this function does not apply to other countries with different index
#' thresholds
#'
#' @source AQI index values and levels: https://www.airnow.gov/aqi/aqi-basics/
#' @source AQI technical assistance document - index thresholds for PM2.5
#'   concentrations found in Table 4 on pages 4-5:
#'   https://www.airnow.gov/sites/default/files/2020-05/aqi-technical-assistance-document-sept2018.pdf
#'
#' @param pm2.5_conc the concentration of fine particulate matter (PM2.5) in the
#'   air. Concentrations are reported as a 24-hour average, in micrometers per
#'   cubic meter (μg/m^3). The AQI index thresholds for PM2.5 concentrations
#'   were taken from Table 4 of the AQI technical assistance document

air_quality_index <- function(pm2.5_conc){
  # error_checking
  if(pm2.5_conc < 0) return("Concentrations must be positive")

  # determine air quality index levels based on concentrations
  AQ_index <- case_when(
    pm2.5_conc <= 12 ~ "Good",
    pm2.5_conc > 12 & pm2.5_conc <= 35.4 ~ "Moderate",
    pm2.5_conc > 35.4 & pm2.5_conc <= 55.4 ~ "Unhealthy for Sensitive Groups",
    pm2.5_conc > 55.4 & pm2.5_conc <= 150.4 ~ "Unhealthy",
    pm2.5_conc > 150.4 & pm2.5_conc <= 250.4 ~ "Very Unhealthy",
    pm2.5_conc > 250.4 & pm2.5_conc <= 500.4 ~ "Hazardous",
    pm2.5_conc > 500.4 ~ "Beyond U.S. AQ Index"
  )

  return(AQ_index)
}
