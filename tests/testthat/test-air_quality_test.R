# create vector of sample PM2.5 concentration data
pm2.5_data <- c(16, 102, 314, 501)

test_that("air_quality_index_works", {
  # test that each value in sample vector match with expected index level
  expect_match(air_quality_index(pm2.5_data[1]), "Moderate")
  expect_match(air_quality_index(pm2.5_data[2]), "Unhealthy")
  expect_match(air_quality_index(pm2.5_data[3]), "Hazardous")
  expect_match(air_quality_index(pm2.5_data[4]), "Beyond U.S. AQ Index")
}
)
