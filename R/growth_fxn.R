growth_fxn <- while((a < m) && (t < 100)){
  #error checking - make sure all inputs are positive
  a = ifelse((a < 0), return("initial amount must be greater than zero"), a)
  r = ifelse((r < 0), return("growth rate must be greater than zero"), r)
  t = ifelse((t < 0), return("time must be greater than zero"), t)
  
  #calculate annual "population" size using simple exponential growth formula
  P = a*(1+r)^t
  
  #track time
  t = t+1
}