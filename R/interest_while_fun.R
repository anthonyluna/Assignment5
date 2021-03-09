#'interest_fun - a while loop function for calculating compound interest
#'
#'Purpose: to calculate the final balance in a bank account and amount of years
#'it would take to reach a certain target in an account where an initial
#'investment earns compound interest. The function uses the compound interest
#'formula and contains a `while()` loop which will continue to apply interest on
#'a given investment until a given target balance is reached. It will report the
#'amount of years it would take to reach that target balance and the actual
#'final balance that is achieved at the end of the year in which the target was
#'reached.
#'
#'@source compound interest formula:
#'  https://www.thecalculatorsite.com/articles/finance/compound-interest-formula.php#:~:text=Compound%20interest%2C%20or%20'interest%20on,the%20number%20of%20time%20periods
#'
#'@param balance the amount of money in a bank account. When setting this
#'  parameter, you are setting the amount of initial balance. The function then
#'  produces the final balance after applying compound interest for X years
#'@param interest_rate the rate at which interest is being applied
#'@param compound_per_yr the amount of times the balance is compounded per year.
#'  This typically should be set to 1 most of the time, but can be changed by
#'  user in situations where that is not the case
#'@param yr number of years since the initial investment was made, the amount of
#'  time that balance has had time to gain interest. Starts with year 0 as the
#'  first year
#'

interest_fun <- function(balance, target, interest_rate, compound_per_yr, yr){
  # error checking - make sure inputs are positive
  if(balance < 0 | interest_rate < 0 | compound_per_yr < 0 | yr < 0) return("Conditions must all be positive!")

  while((balance < target) && (yr < 1000)){

  # calculate amount of money in account each year using compound interest formula
  balance = balance * (1 + (interest_rate / compound_per_yr)) ^ (compound_per_yr * yr)

  # count the number of years
  yr = yr+1
  }
  interest_results <- data.frame(balance, yr)
}
