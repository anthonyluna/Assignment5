

growth_fxn <- function(a, r, t, m, P=0) {
  while ((P < m) && (t < 100)) {
    #error checking - make sure all inputs are positive
    a = ifelse((a < 0), return("initial amount must be greater than zero"), a)
    r = ifelse((r < 0 || r > 1), return("growth rate must be greater than zero but less than one"), r)
    t = ifelse((t < 0), return("time must be greater than zero"), t)

    #calculate annual "population" size using simple exponential growth formula
    P = a * (1 + r) ^ t

    #track time
    t = t + 1

  }
  output <- data.frame(P,t)
  return(output)
}
