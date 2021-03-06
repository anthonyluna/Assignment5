testthat::test_that("ricker_test", {
  # Here we create a vecotr with known results
  input_vector <- list(A0=10, J0=10, u=0.2, y0=10, a=5, b=5, c11=0.1, c12=0.1, c21=0.12, c22=0.1)
  #this is the fake test data to be checked
  test_data <- ricker( input_vector$A0, input_vector$J0 , input_vector$u, input_vector$y0 , input_vector$a, input_vector$b, input_vector$c11, input_vector$c12, input_vector$c21, input_vector$c22 )
  # Check that the dimensions of the dataframe are as required
  testthat::expect_equal(dim(test_data)[1],1001)
  #check the outcome of the population model
  testthat::expect_equal(round(test_data$xn[1000]),31)

  testthat::expect_equal(round(test_data$yn[1000]),0)

})
