#' Geometric Brownian motion
#'
#' Simulates a stochastic realization of geometric Brownian motion
#' The geometric Brownian motion is often taken as the standard model of stocks and other financial instruments.
#' It is also one of the building blocks of the Black-Scholes option pricing model.
#'
#' @param T total time
#' @param dt time step
#' @param mu mean
#' @param sigma standard deviation of the stochastic term, over 1 time unit
#' @param Y0 initial value
#' @return The time and the process realization vectors
#' \itemize{
#'   \item 1 - The time vector t.
#'   \item 2 - Tbe process realization Y.
#' }
#' @export
geometric_Brownian_motion <- function(T, dt, mu, sigma, Y0){
    Y <- vector()
    t <- seq(0, T, dt)
    Y[1] <- Y0
    # Parameters
    N <- length(t)
    sigmadt <- sigma*sqrt(dt)
    normal_draws <- stats::rnorm(N, mean=0, sd=1)
    for (i in seq(2,N)){
        Y[i] <- Y[i-1] + mu*Y[i-1]*dt + sigmadt*Y[i-1]*normal_draws[i]
    }
    return(list(t,Y))
}
