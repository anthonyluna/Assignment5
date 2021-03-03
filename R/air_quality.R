#### Function #2 - using case_when() in a function

## air quality index for particulate matter

# parameters - pm2.5_conc = concentration of particulate matter of in the air
### NOTE - thresholds for air quality index levels are specific to the United States Air Quality Index (AQI), this function does not apply to other countries

air_quality_index <- function(pm2.5_conc){
  # error_checking
  if(pm2.5_conc < 0) return("Concentrations must be positive")

  # determine air quality index levels based on concentrations
  AQ_index <- case_when(
    pm2.5_conc <= 50 ~ "Good",
    pm2.5_conc > 50 & pm2.5_conc <= 100 ~ "Moderate",
    pm2.5_conc > 100 & pm2.5_conc <= 150 ~ "Unhealthy for Sensitive Groups",
    pm2.5_conc > 150 & pm2.5_conc <= 200 ~ "Unhealthy",
    pm2.5_conc > 200 & pm2.5_conc <= 300 ~ "Very Unhealthy",
    pm2.5_conc > 300 & pm2.5_conc <= 500 ~ "Hazardous",
    pm2.5_conc > 500 ~ "Beyond U.S. AQ Index"
  )

  return(AQ_index)
}
