#' Ornstein-Uhlenbeck process
#'
#' Simulates an Ornstein-Uhlenbeck stochastic realization
#' The Ornstein-Uhlenbeck process is the canonical model of a mean-reverting process.
#' It is often used to model the spread in a pairs trading strategy.
#'
#' @param T total time
#' @param dt time step
#' @param mu mean
#' @param sigma standard deviation of the stochastic term, over 1 time unit
#' @param tau reverting time constant
#' @param Y0 initial value
#' @return The time and the process realization vectors
#' \itemize{
#'   \item 1 - The time vector t.
#'   \item 2 - Tbe process realization Y.
#' }
#' @export
Ornstein_Uhlenbeck <- function(T, dt, mu, sigma, tau, Y0){
    Y <- vector()
    t <- seq(0, T, dt)
    Y[1] <- Y0
    # Parameters
    N <- length(t)
    sigma_bis <- sigma*sqrt(2/tau)
    sigmadt <- sqrt(dt)
    normal_draws <- stats::rnorm(N, mean=0, sd=1)
    for (i in seq(2,N)){
        Y[i] <- Y[i-1] - dt*(Y[i-1]-mu)/tau + sigma_bis*sigmadt*normal_draws[i]
    }
    return(list(t,Y))
}
