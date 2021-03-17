test_that("interest_fun_works", {
  # test that final balance ends up being greater than target
  target = 100000
  expect_true(interest_fun(target, balance = 1, yr = 0, compound_per_yr = 1, interest_rate = 0.02)$balance > target)

  # write a test that is expected to fail (balance is supposed to be > target)
  expect_true(interest_fun(target, balance = 1, yr = 0, compound_per_yr = 1, interest_rate = 0.02)$balance < target)
})

