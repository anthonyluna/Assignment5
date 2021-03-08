#### Function #1 - using a while() loop

### compound interest function

# parameters:
## balance = the amount of money in a bank account, when setting this parameter you are setting the amount of initial balance, function produces final balance after applying compound interest for X years
## interest_rate = the rate at which interest is being applied, set to 0.02 but could be changed manually
## compound_per_yr = the amount of times interest is compounded per year, this should be set to just 1 most of the time but kept it as variable in case that is not the case
## yr = number of years since your initial balance has started to gain interest, starting with year 0 as the first year 

# compound interest formula:
### Final Amount = initial_balance*(1 + (interest_rate/number_of_times_compounded_per_year))^(number_of_times_compounded_per_year*years)


interest_fun <- function(balance, target, interest_rate, compound_per_yr, yr){
  # error checking - make sure inputs are positive
  if(balance < 0 | interest_rate < 0 | compound_per_yr < 0 | yr < 0) return("Conditions must all be positive!")
  
  while((balance < target) && (yr < 1000)){
  
  # calculate amount of money in account each year using compound interest formula
  balance = balance*(1 + (interest_rate/compound_per_yr))^(compound_per_yr*yr)
  
  # count the number of years
  yr = yr+1
  }
  interest_results <- data.frame(balance, yr)
}
