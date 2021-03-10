#' growth_fxn - a simple population growth equation
#'
#' @description This simple exponential growth formula can be used to calculate
#'   population size at a given time.
#'
#'   @details Use this formula to calculate a final population size, using any
#'     give initial population, growth rate, and time.
#'
#'     @param a Size of initial population
#'     @param r Growth rate of population of interest
#'     @param t Time in years
#'     @param m Maximum population
#'     @return P The final population size at time t + n, organized in a 2x2
#'       data frame

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
