#' Ornstein-Uhlenbeck process
#'
#' Simulates an Ornstein-Uhlenbeck stochastic realization
#' The Ornstein-Uhlenbeck process is the canonical model of a mean-reverting process.
#' Time step is taken as 1 (dt=1).
#'
#' @param N number of time steps
#' @param sigma standard deviation of the stochastic term, over 1 time unit (over 1 time step, given the normalization dt=1)
#' @param mu mean
#' @param tau reverting time constant
#' @param Y0 initial value
#' @return The time and the process realization vectors
#' \itemize{
#'   \item 1 - The time vector t.
#'   \item 2 - Tbe process realization Y.
#' }
#' @export
Ornstein_Uhlenbeck <- function(N, sigma, mu, tau, Y0){
    Y <- vector()
    t <- seq(1, N)
    Y[1] <- Y0
    # Parameters
    sigma_bis <- sigma*sqrt(2/tau)
    dt <- 1
    sqrtdt <- sqrt(dt)
    normal_draws <- stats::rnorm(N, mean=0, sd=1)
    for (i in seq(2,N)){
        Y[i] <- Y[i-1] - dt*(Y[i-1]-mu)/tau + sigma_bis*sqrtdt*normal_draws[i]
    }
    return(list(t,Y))
}
