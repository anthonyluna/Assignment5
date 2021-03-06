#' ricker - a discrete population model
#'
#' @description This is an implementation of the adult/juvinile ricker
#' population model.
#'
#' @details
#'
#' This function models the population dynamics of two competing
#' species, one that has a life phase difference and the other that doesn't.
#' This function uses a Adult/Juvinile Ricker model, a discrete
#' competition model and therefore can benefit from the use of a while loop.
#'
#' ## Modules:
#'  - Initialize the outputed dataframe
#'  - Use initial counts for first timestep calculation
#'  - Loop discrete function iteration
#'  - Store and return results at the end
#'
#' @param A0 Adult count of species x at timestep 0
#' @param J0 Juvenile count of species x at timestep 0 J
#' @param u Juvenile death rate must be between 0 and 1
#' @param y0 Total population of species x at timestep 0
#' @param a Reproduction coefficient for species x
#' @param b Reproduction coefficient for species y
#' @param c11 Self competition coefficient for species x
#' @param c12 Interspecies competition coefficient for species x
#' @param c21 Self competition coefficient for species y
#' @param c22 Interspecies competition coefficient for species y
#' @return timeseries A dataframe with the timestep, the population of species x and species y.
#' @references Cushing, J.M., Sheree Levarge, Nakul Chitnis, and Shandelle M.
#'   Henson. "Some Discrete Competition Models and the Competitive Exclusion
#'   Principle." Journal of Difference Equations and Applications 10, no.
#'   13–15 (November 2004): 1139–51.
#'   https://doi.org/10.1080/10236190410001652739.

ricker <- function(A0, J0, u, y0, a, b, c11, c12, c21, c22) {
  # Input Validation/Error Checking

  checkmate::assert_number(A0,lower = 0)
  checkmate::assert_number(J0,lower = 0)
  checkmate::assert_number(u,lower = 0, upper = 1)
  checkmate::assert_number(y0,lower = 0)
  checkmate::assert_number(a,lower = 0)
  checkmate::assert_number(b,lower = 0)
  checkmate::assert_number(c11,lower = 0)
  checkmate::assert_number(c12,lower = 0)
  checkmate::assert_number(c21,lower = 0)
  checkmate::assert_number(c22,lower = 0)


  # Initializing the while loop iterator and the output dataframe
  i <- 0
  timeseries <- data.frame(
    "i" = i,
    "xn" = A0 + J0,
    "yn" = y0
  )

  # Constructing the while loop. We assume 1000 iterations will show periodic
  # behavior.

  while (i < 1000) {

    if (i == 0) {

      # Using the initial population measures
      # Juvenile growth rate
      Jn <- a * A0 * exp(-c11 * A0 - c12 * y0)
      # Adult growth rate as it relates to the die off of juveniles
      An <- (1 - u) * J0
      # Population of species y
      yn <- b * y0 * exp(-c21 * J0 - c22 * y0)
      # Population of species x including both adults and juveniles
      xn <- A0 + J0
      new_row <- c(i, xn, yn)

    } else {

      # Now using the discrete iteratative timestep function for growth. Same
      # equations as described above. Values are written to a place holder so
      # that values are calculated for each at the same timestep.

      Jnn <- a * An * exp(-c11 * An - c12 * yn)
      Ann <- (1 - u) * Jn
      ynn <- b * yn * exp(-c21 * Jn - c22 * yn)
      xnn <- An + Jn

      # Dummy storage to used storage
      Jn <- Jnn
      An <- Ann
      yn <- ynn
      xn <- xnn

      new_row <- c(i, xn, yn)
    }

    # Append the timestep to the output dataframe
    timeseries <- rbind(timeseries, new_row, make.row.names = FALSE)

    # Incrementor
    i <- i + 1
  }
  return(timeseries)
}
