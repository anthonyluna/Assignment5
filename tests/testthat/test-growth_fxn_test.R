test_that("growth_fxn_works", {
  expect_length(growth_fxn(P, 1))
  expect_length(growth_fxn(t, 1))
})
